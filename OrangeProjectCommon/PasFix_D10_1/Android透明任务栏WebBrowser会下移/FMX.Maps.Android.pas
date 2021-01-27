{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Maps.Android;

interface

{$SCOPEDENUMS ON}


var
  WebBrowserSystemStatusBarHeight:Integer;


{$IFDEF ANDROID}
procedure RegisterMapService;
{$ENDIF ANDROID}

implementation

{$IFDEF ANDROID}
uses
  System.Types, System.SysUtils, System.Generics.Collections, System.Classes, System.SyncObjs,
  Androidapi.JNI.Widget, Androidapi.JNIBridge, Androidapi.JNI.App,
  Androidapi.JNI.Playservices, Androidapi.JNI.Embarcadero, Androidapi.Helpers, Androidapi.Jni.Os,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes, // for debug only
  FMX.Types, FMX.Platform, FMX.Maps, FMX.Helpers.Android, FMX.Forms, FMX.Graphics, FMX.Surfaces,
  FMX.Platform.Android, FMX.Consts, FMX.Dialogs, FMX.DialogService;

type
  TAndroidMapView = class;
  TAndroidMapView_UIThread = class;

  TAndroidMapService = class(TInterfacedObject, IFMXMapService)
  private
    FMapViews: TList<TAndroidMapView>;
  public
    constructor Create; overload;
    destructor Destroy; override;
    function CreateMapView: ICustomMapView;
    procedure DestroyMapView(const MapView: ICustomMapView);
    procedure RealignMapViews;
  end;

  TMapEventKind = (CameraChanged, MarkerClick, MarkerDragStart, MarkerDrag, MarkerDragEnd, MapClick, MapLongClick,
    MapDoubleClick);
  TMapEvent = record
    Marker: JMarker;
    LatLng: TMapCoordinate;
    Kind: TMapEventKind;

    class function Create(Marker: JMarker; Kind: TMapEventKind): TMapEvent; overload; static;
    class function Create(Kind: TMapEventKind): TMapEvent; overload; static;
    class function Create(Kind: TMapEventKind; const LatLng: TMapCoordinate): TMapEvent; overload; static;
  end;

  TAndroidMapMarker = class(TMapMarker)
  private
    FJavaMarker: JMarker;
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(const Descriptor: TMapMarkerDescriptor); override;
    destructor Destroy; override;
    procedure SetJMarker(Marker: JMarker);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapCircle = class(TMapCircle)
  private
    FJavaCircle: JCircle;
    [Weak] FMapView: TAndroidMapView;
  public
    destructor Destroy; override;
    procedure SetJCircle(Circle: JCircle);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapPolygon = class(TMapPolygon)
  private
    FJavaPolygon: JPolygon;
    [Weak] FMapView: TAndroidMapView;
  public
    destructor Destroy; override;
    procedure SetJPolygon(Polygon: JPolygon);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapPolyline = class(TMapPolyline)
  private
    FJavaPolyline: JPolyline;
    [Weak] FMapView: TAndroidMapView;
  public
    destructor Destroy; override;
    procedure SetJPolyline(Polyline: JPolyline);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapView = class(TMapViewBase, ICustomMapView)
  private
    FUIThread: TAndroidMapView_UIThread;
    [Weak] FHostControl: TCustomMapView;
    FJNativeLayout: JNativeLayout;
    FJMapView: JMapViewWithGestures;
    FJBundle: JBundle;
    FScale: Single;
    FViewBounds: TRect;
    FVisible: Boolean;

    { Camera }
    FCameraPosition: JCameraPosition;
    FTilt: Single;
    FBearing: Single;
    FZoom: Single;
    FLocation: TMapCoordinate;
    FUpdateOptions: TMapOptionSets;

    { Markers and shapes }
    FMapObjects: TDictionary<string, TMapObjectBase>;
    FUninitialized: TList<TMapObjectBase>;
    FSelectedMarker: TMapMarker;

    { Sync }
  strict private
    FMapEvents: TThreadedQueue<TMapEvent>;
  private
    FCheckMapEvents: TThreadMethod;
  protected
    function BuildCameraPosition: JCameraPosition;
    function GetGoogleMapType: Integer;
    procedure InitMapView;
    procedure UpdateNativeBounds;
    property Bundle: JBundle read FJBundle;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetHostControl(const Host: TCustomMapView);
    procedure UpdateContentFromControl;

    procedure DestroyView;
    procedure Hide;
    procedure Show;

    procedure AnimateToCameraPosition;
    procedure SyncCameraPosition;

    procedure SetLocation(const ACoordinate: TMapCoordinate);
    function GetLocation: TMapCoordinate;

    procedure SetZoom(const Zoom: Single);
    function GetZoom: Single;
    procedure SetBearing(const Bearing: Single);
    function GetBearing: Single;
    procedure SetTilt(const Tilt: Single);
    function GetTilt: Single;

    procedure SetMapType(const AValue: TMapType);
    procedure OptionsChanged(const OptionSets: TMapOptionSets); override;
    function AddMarker(const Descriptor: TMapMarkerDescriptor): TMapMarker; override;
    function AddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle; override;
    function AddPolygon(const Descriptor: TMapPolygonDescriptor): TMapPolygon; override;
    function AddPolyline(const Descriptor: TMapPolylineDescriptor): TMapPolyline; override;

    function CaptureBitmap: TBitmap; override;
    procedure Snapshot(const Recipient: TMapScreenshotRecipient); override;

    procedure PostMapEvent(const Event: TMapEvent);
    procedure CheckMapEvents;

    function GetMapObject<T:TMapObjectBase>(const Key: string): T;
    procedure PutMapObject<T:TMapObjectBase>(const Key: string; const MapObject: T);
    procedure RemoveMapObject(const Key: string);

    procedure StashUninitializedMapObject(const MapObject: TMapObjectBase);
    procedure ClearUninitializedMapObjects;
  end;

  TCameraCallback = class(TJavaLocal, JCameraChangeListener_Callback)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onCameraChange(listener: JCameraChangeListener); cdecl;
  end;

  TMarkerClickListener = class(TJavaLocal, JGoogleMap_OnMarkerClickListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    function onMarkerClick(P1: JMarker): Boolean; cdecl;
  end;

  TMarkerDragListener = class(TJavaLocal, JGoogleMap_OnMarkerDragListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMarkerDrag(P1: JMarker); cdecl;
    procedure onMarkerDragEnd(P1: JMarker); cdecl;
    procedure onMarkerDragStart(P1: JMarker); cdecl;
  end;

  TMapClickListener = class(TJavaLocal, JGoogleMap_OnMapClickListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMapClick(P1: JLatLng); cdecl;
  end;

  TMapLongClickListener = class(TJavaLocal, JGoogleMap_OnMapLongClickListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMapLongClick(P1: JLatLng); cdecl;
  end;

  TDoubleTapListener = class(TJavaLocal, JGestureDetector_OnDoubleTapListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(const MapView: TAndroidMapView);
    function onDoubleTap(e: JMotionEvent): Boolean; cdecl;
    function onDoubleTapEvent(e: JMotionEvent): Boolean; cdecl;
    function onSingleTapConfirmed(e: JMotionEvent): Boolean; cdecl;
  end;

  TSnapshotReadyCallback = class(TJavaLocal, JGoogleMap_SnapshotReadyCallback)
  private
    [Weak] FMapView: TAndroidMapView;
    FRecipient: TMapScreenshotRecipient;
    FBitmapResult: JBitmap;
  public
    constructor Create(MapView: TAndroidMapView; const Recipient: TMapScreenshotRecipient);
    procedure onSnapshotReady(P1: JBitmap); cdecl;
  end;

  TMapLoadedCallback = class(TJavaLocal, JGoogleMap_OnMapLoadedCallback)
  private
    [Weak] FMapViewUIThread: TAndroidMapView_UIThread;
  public
    constructor Create(MapView: TAndroidMapView_UIThread);
    procedure onMapLoaded; cdecl;
  end;

  TAndroidMapView_UIThread = class
  private type
    TServicesStatus = (Unchecked, Clear, Error);
  private
    [Weak] FMapView: TAndroidMapView;
    FViewShown: Boolean;
    FViewShowing: Boolean;
    FCameraPosition: JCameraPosition;
    FCameraChangeListener: JCameraChangeListener;
    FCameraCallback: TCameraCallback;
    FMarkerClickListener: TMarkerClickListener;
    FMarkerDragListener: TMarkerDragListener;
    FClickListener: TMapClickListener;
    FLongClickListener: TMapLongClickListener;
    FSnapshotReadyCallback: TSnapshotReadyCallback;
    FMapLoadedCallback: TMapLoadedCallback;
    FDoubleTapListener: JGestureDetector_OnDoubleTapListener;
  class var
    FPlayServicesStatus: TServicesStatus;

    function BuildGoogleMapOptions: JGoogleMapOptions;
    function BuildMarkerOptions(const D: TMapMarkerDescriptor): JMarkerOptions;
    function BuildCircleOptions(const D: TMapCircleDescriptor): JCircleOptions;
    function BuildPolygonOptions(const D: TMapPolygonDescriptor): JPolygonOptions;
    function BuildPolylineOptions(const D: TMapPolylineDescriptor): JPolylineOptions;
    function InvokeOnMap(const MapView: JMapViewWithGestures; const Proc: TProc<JGoogleMap>): Boolean; overload;
    function InvokeOnMap(const Proc: TProc<JGoogleMap>): Boolean; overload;
    function ApplyToMap<TResult>(const Func: TFunc<JGoogleMap,TResult>): TResult;
    function InvokeOnUISettings(const Proc: TProc<JUiSettings>): Boolean;
    function SetLayers: Boolean;
    function SetControls: Boolean;
    function SetGestures: Boolean;
    class function CheckGooglePlayServices: Boolean;
  public
    constructor Create(MapView: TAndroidMapView);
    class constructor Create;
    procedure InitMapView;
    procedure InitializeMapObjects;
    procedure DestroyMapView(MapView: JMapViewWithGestures; NativeLayout: JNativeLayout; Bundle: JBundle);
    procedure SetViewBounds; overload;
    procedure SetViewBounds(AndroidMapView: TAndroidMapView; NativeLayout: JNativeLayout; ViewBounds: TRect); overload;
    procedure Show;
    procedure Hide; overload;
    procedure Hide(MapView: JMapViewWithGestures; NativeLayout: JNativeLayout; Bundle: JBundle); overload;
    procedure AnimateCameraToPosition;
    procedure GetCameraPosition;
    procedure SetMapType;
    procedure OptionsChanged;
    function AddMarker(const D: TMapMarkerDescriptor): JMarker;
    function AddCircle(const D: TMapCircleDescriptor): JCircle;
    function AddPolygon(const D: TMapPolygonDescriptor): JPolygon;
    function AddPolyline(const D: TMapPolylineDescriptor): JPolyline;
    function Snapshot(Recipient: TMapScreenshotRecipient): Boolean;
    procedure InitGestureDetector;
  end;

var
  MapService: TAndroidMapService;

procedure RegisterMapService;
begin
  MapService := TAndroidMapService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXMapService, MapService);
end;

function CreateBitmapDescriptorFromBitmap(const Bitmap: TBitmap): JBitmapDescriptor;
var
  Surface: TBitmapSurface;
  JavaBitmap: JBitmap;
begin
  Result := nil;
  Surface := TBitmapSurface.Create;
  try
    Surface.Assign(Bitmap);
    JavaBitmap := TJBitmap.JavaClass.createBitmap(Surface.Width, Surface.Height, TJBitmap_Config.JavaClass.ARGB_8888);
    if SurfaceToJBitmap(Surface, JavaBitmap) then
      Result := TJBitmapDescriptorFactory.JavaClass.fromBitmap(JavaBitmap);
  finally
    Surface.DisposeOf;
  end;
end;

function CoordToLatLng(const C: TMapCoordinate): JLatLng;
begin
  Result := TJLatLng.JavaClass.init(C.Latitude, C.Longitude)
end;

{ TAndroidMapService }

constructor TAndroidMapService.Create;
begin
  inherited;
  FMapViews := TList<TAndroidMapView>.Create;
end;

destructor TAndroidMapService.Destroy;
begin
  FreeAndNil(FMapViews);
  inherited;
end;

function TAndroidMapService.CreateMapView: ICustomMapView;
var
  MapView: TAndroidMapView;
begin
  MapView := TAndroidMapView.Create;
  FMapViews.Add(MapView);
  Result := MapView;
end;

procedure TAndroidMapService.DestroyMapView(const MapView: ICustomMapView);
begin
  FMapViews.Remove(TAndroidMapView(MapView));
  TAndroidMapView(MapView).DestroyView;
end;

procedure TAndroidMapService.RealignMapViews;
var
  Map: TAndroidMapView;
begin
  for Map in FMapViews do
    Map.InitMapView;
end;

{ TAndroidMapView }

constructor TAndroidMapView.Create;
var
  ScreenService: IFMXScreenService;
begin
  inherited;
  FZoom := 1;
  FTilt := 0;
  FBearing := 0;

  FMapEvents := TThreadedQueue<TMapEvent>.Create(16);
  FCheckMapEvents := CheckMapEvents;
  FMapObjects := TDictionary<string, TMapObjectBase>.Create;

  FUIThread := TAndroidMapView_UIThread.Create(Self);
  FJBundle := TJBundle.JavaClass.init;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
    FScale := ScreenService.GetScreenScale
  else
    FScale := 1;
end;

destructor TAndroidMapView.Destroy;
begin
  FMapObjects.DisposeOf;
  inherited;
end;

procedure TAndroidMapView.PostMapEvent(const Event: TMapEvent);
begin
  FMapEvents.PushItem(Event);
  TThread.CurrentThread.Queue(nil, FCheckMapEvents);
end;

procedure TAndroidMapView.CheckMapEvents;
var
  MapEvent: TMapEvent;
begin
  while FMapEvents.QueueSize > 0 do
  begin
    MapEvent := FMapEvents.PopItem;
    case MapEvent.Kind of
      TMapEventKind.MarkerClick:
        begin
          FSelectedMarker := GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId));
          FHostControl.DoMarkerClick(FSelectedMarker);
        end;
      TMapEventKind.MarkerDragStart:
        FHostControl.DoMarkerDragStart(GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId)));
      TMapEventKind.MarkerDrag:
        FHostControl.DoMarkerDrag(GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId)));
      TMapEventKind.MarkerDragEnd:
        FHostControl.DoMarkerDragEnd(GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId)));
      TMapEventKind.MapClick:
        begin
          FSelectedMarker := nil;
          FHostControl.DoMapClick(MapEvent.LatLng);
        end;
      TMapEventKind.MapLongClick:
        begin
          FSelectedMarker := nil;
          FHostControl.DoMapLongClick(MapEvent.LatLng);
        end;
      TMapEventKind.MapDoubleClick:
        if FSelectedMarker <> nil then
          FHostControl.DoMarkerDoubleClick(FSelectedMarker)
        else
          FHostControl.DoMapDoubleClick(MapEvent.LatLng);
      TMapEventKind.CameraChanged:
        FHostControl.DoCameraChanged;
    end;
  end;
end;

procedure TAndroidMapView.InitMapView;
begin
  TUIThreadCaller.CallWithAsyncCallback(
    procedure begin
      FUIThread.InitMapView;
    end,
    procedure begin
      UpdateContentFromControl;
    end);
end;

procedure TAndroidMapView.Snapshot(const Recipient: TMapScreenshotRecipient);
begin
  TUIThreadCaller.Call<TMapScreenshotRecipient, Boolean>(FUIThread.Snapshot, Recipient);
end;

procedure TAndroidMapView.OptionsChanged(const OptionSets: TMapOptionSets);
begin
  FUpdateOptions := FUpdateOptions + OptionSets;
  CallInUIThread(FUIThread.OptionsChanged);
end;

procedure TAndroidMapView.DestroyView;
begin
  TUIThreadCaller.Call<JMapViewWithGestures,JNativeLayout,JBundle>(FUIThread.DestroyMapView, FJMapView, FJNativeLayout, FJBundle);
end;

function TAndroidMapView.GetGoogleMapType: Integer;
begin
  case FHostControl.MapType of
    TMapType.None:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_NONE;
    TMapType.Normal:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_NORMAL;
    TMapType.Satellite:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_SATELLITE;
    TMapType.Hybrid:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_HYBRID;
    TMapType.Terrain:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_TERRAIN;
  else
      Result := TJGoogleMap.JavaClass.MAP_TYPE_NORMAL;
  end;
end;

procedure TAndroidMapView.SetTilt(const Tilt: Single);
begin
  FTilt := Tilt;
end;

function TAndroidMapView.GetTilt: Single;
begin
  Result := FTilt;
end;

procedure TAndroidMapView.SetBearing(const Bearing: Single);
begin
  FBearing := Bearing;
end;

function TAndroidMapView.GetBearing: Single;
begin
  Result := FBearing;
end;

procedure TAndroidMapView.SetZoom(const Zoom: Single);
begin
  FZoom := Zoom;
end;

function TAndroidMapView.GetZoom: Single;
begin
  Result := FZoom;
end;

procedure TAndroidMapView.SetHostControl(const Host: TCustomMapView);
begin
  FHostControl := Host;
  CallInUIThread(procedure begin
    if FJMapView <> nil then
      FJMapView.setFocusable(FHostControl.CanFocus);
  end);
end;

procedure TAndroidMapView.Show;
begin
  FVisible := True;
  FUpdateOptions := [TMapOptionSet.Layer, TMapOptionSet.Control, TMapOptionSet.Gesture];
  CallInUIThread(FUIThread.Show);
end;

procedure TAndroidMapView.SyncCameraPosition;
begin
  if FUIThread.FCameraChangeListener <> nil then
  begin
    FBearing := FUIThread.FCameraChangeListener.getBearing();
    FZoom := FUIThread.FCameraChangeListener.getZoom();
    FTilt := FUIThread.FCameraChangeListener.getTilt();
    FLocation := TMapCoordinate.Create(FUIThread.FCameraChangeListener.getLatitude(),
      FUIThread.FCameraChangeListener.getLongitude());
  end;
end;

procedure TAndroidMapView.Hide;
begin
  FVisible := False;
  if FJMapView <> nil then
    CallInUIThread(FUIThread.Hide);
end;

function TAndroidMapView.BuildCameraPosition: JCameraPosition;
begin
  Result := TJCameraPosition_Builder.JavaClass.init()
    .target(TJLatLng.JavaClass.init(FLocation.Latitude, FLocation.Longitude))
    .zoom(GetZoom)
    .tilt(GetTilt)
    .bearing(GetBearing)
    .build;
end;

function TAndroidMapView.AddMarker(const Descriptor: TMapMarkerDescriptor): TMapMarker;
var
  R: TAndroidMapMarker;
begin
  R := TAndroidMapMarker.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FJMapView <> nil then
  begin
    R.SetJMarker(TUIThreadCaller.Call<TMapMarkerDescriptor,JMarker>(
      function(D: TMapMarkerDescriptor): JMarker
      begin
        Result := FUIThread.AddMarker(D);
      end, Descriptor));
    if R.FJavaMarker <> nil then
      PutMapObject<TMapMarker>(JStringToString(R.FJavaMarker.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

function TAndroidMapView.AddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle;
var
  R: TAndroidMapCircle;
begin
  R := TAndroidMapCircle.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FJMapView <> nil then
  begin
    R.SetJCircle(TUIThreadCaller.Call<TMapCircleDescriptor,JCircle>(
      function(D: TMapCircleDescriptor): JCircle
      begin
        Result := FUIThread.AddCircle(D);
      end, Descriptor));
    if R.FJavaCircle <> nil then
      PutMapObject<TMapCircle>(JStringToString(R.FJavaCircle.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

function TAndroidMapView.AddPolygon(const Descriptor: TMapPolygonDescriptor): TMapPolygon;
var
  R: TAndroidMapPolygon;
begin
  R := TAndroidMapPolygon.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FJMapView <> nil then
  begin
    R.SetJPolygon(TUIThreadCaller.Call<TMapPolygonDescriptor,JPolygon>(
      function(D: TMapPolygonDescriptor): JPolygon
      begin
        Result := FUIThread.AddPolygon(D);
      end, Descriptor));
    if R.FJavaPolygon <> nil then
      PutMapObject<TMapPolygon>(JStringToString(R.FJavaPolygon.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

function TAndroidMapView.AddPolyline(const Descriptor: TMapPolylineDescriptor): TMapPolyline;
var
  R: TAndroidMapPolyline;
begin
  R := TAndroidMapPolyline.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FJMapView <> nil then
  begin
    R.SetJPolyline(TUIThreadCaller.Call<TMapPolylineDescriptor,JPolyline>(
      function(D: TMapPolylineDescriptor): JPolyline
      begin
        Result := FUIThread.AddPolyline(D);
      end, Descriptor));
    if R.FJavaPolyline <> nil then
      PutMapObject<TMapPolyline>(JStringToString(R.FJavaPolyline.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

procedure TAndroidMapView.AnimateToCameraPosition;
begin
  FCameraPosition := BuildCameraPosition;
  if FJMapView <> nil then
    CallInUIThread(FUIThread.AnimateCameraToPosition);
end;

procedure TAndroidMapView.SetLocation(const ACoordinate: TMapCoordinate);
begin
  FLocation := ACoordinate;
end;

function TAndroidMapView.GetLocation: TMapCoordinate;
begin
  Result := FLocation;
end;

procedure TAndroidMapView.SetMapType(const AValue: TMapType);
begin
  if FJMapView <> nil then
    CallInUIThread(FUIThread.SetMapType);
end;

procedure TAndroidMapView.UpdateContentFromControl;
begin
  if FHostControl = nil then
    Exit;
  // if native MapView is not yet initialized, call InitMapView. It starts initialization
  // of the native control and calls UpdateNativeBounds when native MapView is ready
  if FJMapView = nil then
    InitMapView
  else
    UpdateNativeBounds;
end;

procedure TAndroidMapView.UpdateNativeBounds;
var
  Pos: TPointF;
  RootForm: TCommonCustomForm;
begin
  Pos := FHostControl.LocalToAbsolute(TPointF.Zero) * FScale;
  FViewBounds := TRect.Create(
          Round(Pos.X),
          Round(Pos.Y)
                      //wn
                      //修复Android任务栏透明的情况下,会下移
                      -Round(WebBrowserSystemStatusBarHeight*FScale)
                      ,

          Round(FHostControl.Width * FScale), Round(FHostControl.Height *
        FScale));

  RootForm := nil;
  if FHostControl.Visible and FHostControl.ParentedVisible and (FHostControl.Root <> nil) then
    RootForm := TCommonCustomForm(FHostControl.Root.GetObject);

  if (RootForm <> nil) and RootForm.Visible and RootForm.Active then
    FVisible := True
  else
    FVisible := False;

  TUIThreadCaller.Call<TAndroidMapView,JNativeLayout,TRect>(FUIThread.SetViewBounds, Self, FJNativeLayout, FViewBounds);
end;

function TAndroidMapView.CaptureBitmap: TBitmap;
begin
  Result := nil;
end;

function TAndroidMapView.GetMapObject<T>(const Key: string): T;
var
  TmpResult: TMapObjectBase;
begin
  if FMapObjects.TryGetValue(Key, TmpResult) then
    try
      Result := TmpResult as T;
    except
      on EInvalidCast do
        Result := nil;
    end;
end;

procedure TAndroidMapView.PutMapObject<T>(const Key: string; const MapObject: T);
var
  MObject: TMapObjectBase;
begin
  if FMapObjects.TryGetValue(Key, MObject) then
    FMapObjects[Key] := MapObject
  else
    FMapObjects.Add(Key, MapObject);
end;

procedure TAndroidMapView.RemoveMapObject(const Key: string);
var
  M: TMapMarker;
begin
  M := GetMapObject<TMapMarker>(Key);
  if (M <> nil) and (M = FSelectedMarker) then
    FSelectedMarker := nil;
  FMapObjects.Remove(Key);
end;

procedure TAndroidMapView.StashUninitializedMapObject(const MapObject: TMapObjectBase);
begin
  if FUninitialized = nil then
    FUninitialized := TList<TMapObjectBase>.Create;
  FUninitialized.Add(MapObject);
end;

procedure TAndroidMapView.ClearUninitializedMapObjects;
begin
  FUninitialized.Clear;
  FUninitialized := nil;
end;


{ TAndroidMapView_UIThread }

constructor TAndroidMapView_UIThread.Create(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

class constructor TAndroidMapView_UIThread.Create;
begin
  FPlayServicesStatus := TServicesStatus.Unchecked;
end;

class function TAndroidMapView_UIThread.CheckGooglePlayServices: Boolean;
const
  PLAY_SERVICES_RESOLUTION_REQUEST = 10000;
var
  ErrorCode: Integer;
begin
  if FPlayServicesStatus = TServicesStatus.Unchecked then
  begin
    ErrorCode := TJGooglePlayServicesUtil.JavaClass.isGooglePlayServicesAvailable(TAndroidHelper.Activity);
    if ErrorCode <> TJConnectionResult.JavaClass.SUCCESS then
    begin
      FPlayServicesStatus := TServicesStatus.Error;
      try
        TJGooglePlayServicesUtil.JavaClass.getErrorDialog(ErrorCode, TAndroidHelper.Activity,
          PLAY_SERVICES_RESOLUTION_REQUEST).show;
      except
        on Exception do
        begin
          TDialogService.ShowMessage(SMsgGooglePlayServicesNeedUpdating);
        end;
      end;
    end
    else
      FPlayServicesStatus := TServicesStatus.Clear;
  end;
  Result := FPlayServicesStatus = TServicesStatus.Clear;
end;


procedure TAndroidMapView_UIThread.InitGestureDetector;
begin
  FDoubleTapListener := TDoubleTapListener.Create(FMapView);
  FMapView.FJMapView.getGestureDetector.setOnDoubleTapListener(FDoubleTapListener);
end;


procedure TAndroidMapView_UIThread.InitializeMapObjects;
  procedure InitializeMapObject(const Marker: TAndroidMapMarker); overload;
  begin
    Marker.SetJMarker(AddMarker(Marker.Descriptor));
    FMapView.PutMapObject<TMapMarker>(JStringToString(Marker.FJavaMarker.getId), Marker);
  end;

  procedure InitializeMapObject(const Polyline: TAndroidMapPolyline); overload;
  begin
    Polyline.SetJPolyline(AddPolyline(Polyline.Descriptor));
    FMapView.PutMapObject<TMapPolyline>(JStringToString(Polyline.FJavaPolyline.getId), Polyline);
  end;

  procedure InitializeMapObject(const Polygon: TAndroidMapPolygon); overload;
  begin
    Polygon.SetJPolygon(AddPolygon(Polygon.Descriptor));
    FMapView.PutMapObject<TMapPolygon>(JStringToString(Polygon.FJavaPolygon.getId), Polygon);
  end;

  procedure InitializeMapObject(const Circle: TAndroidMapCircle); overload;
  begin
    Circle.SetJCircle(AddCircle(Circle.Descriptor));
    FMapView.PutMapObject<TMapCircle>(JStringToString(Circle.FJavaCircle.getId), Circle);
  end;

var
  Obj: TMapObjectBase;
begin
  if FMapView.FUninitialized <> nil then
  try
    for Obj in FMapView.FUninitialized do
      if Obj is TAndroidMapMarker then
        InitializeMapObject(TAndroidMapMarker(Obj))
      else if Obj is TAndroidMapPolygon then
        InitializeMapObject(TAndroidMapPolygon(Obj))
      else if Obj is TAndroidMapPolyline then
        InitializeMapObject(TAndroidMapPolygon(Obj))
      else if Obj is TAndroidMapCircle then
        InitializeMapObject(TAndroidMapCircle(Obj));
  finally
    FMapView.ClearUninitializedMapObjects;
  end;
end;

procedure TAndroidMapView_UIThread.InitMapView;
begin
  if CheckGooglePlayServices then
  begin
    TJMapsInitializer.JavaClass.initialize(TAndroidHelper.Activity);
    if FMapView.FJMapView = nil then
    begin
      FMapView.FJMapView := TJMapViewWithGestures.JavaClass.init(TAndroidHelper.Activity, BuildGoogleMapOptions);
      FMapView.FJNativeLayout := TJNativeLayout.JavaClass.init(TAndroidHelper.Activity, MainActivity.getWindow.getDecorView.getWindowToken);
      FMapView.FJMapView.onCreate(FMapView.Bundle);
      InitGestureDetector;
      InitializeMapObjects;
    end;
  end;
end;

procedure TAndroidMapView_UIThread.SetViewBounds;
begin
  if FMapView.FVisible then
    Show
  else
    Hide;
  FMapView.FJNativeLayout.setPosition(FMapView.FViewBounds.Left, FMapView.FViewBounds.Top);
  FMapView.FJNativeLayout.setSize(FMapView.FViewBounds.Right, FMapView.FViewBounds.Bottom);
end;

procedure TAndroidMapView_UIThread.SetViewBounds(AndroidMapView: TAndroidMapView; NativeLayout: JNativeLayout;
  ViewBounds: TRect);
begin
  if AndroidMapView.FVisible then
    Show
  else
    Hide;
  NativeLayout.setPosition(ViewBounds.Left, ViewBounds.Top);
  NativeLayout.setSize(ViewBounds.Right, ViewBounds.Bottom);
end;

procedure TAndroidMapView_UIThread.DestroyMapView(MapView: JMapViewWithGestures; NativeLayout: JNativeLayout; Bundle: JBundle);
begin
  Hide(MapView, NativeLayout, Bundle);
  MapView.onDestroy;
end;

{ TMapLoadedCallback }

constructor TMapLoadedCallback.Create(MapView: TAndroidMapView_UIThread);
begin
  inherited Create;
  FMapViewUIThread := MapView;
end;

procedure TMapLoadedCallback.onMapLoaded;
begin
  FMapViewUIThread.FViewShown := True;
  FMapViewUIThread.FViewShowing := False;
  FMapViewUIThread.InvokeOnMap(procedure (Map: JGoogleMap) begin
    FMapViewUIThread.FMapView.FUpdateOptions := [TMapOptionSet.Gesture, TMapOptionSet.Control, TMapOptionSet.Layer];
    FMapViewUIThread.OptionsChanged;
  end);
end;

procedure TAndroidMapView_UIThread.Show;
begin
  if FCameraChangeListener = nil then
  begin
    FCameraChangeListener := TJCameraChangeListener.JavaClass.init;
    FCameraCallback := TCameraCallback.Create(FMapView);
    FCameraChangeListener.setCallback(FCameraCallback);

    FMarkerClickListener := TMarkerClickListener.Create(FMapView);
    FMarkerDragListener := TMarkerDragListener.Create(FMapView);

    FClickListener := TMapClickListener.Create(FMapView);
    FLongClickListener := TMapLongClickListener.Create(FMapView);

    FMapLoadedCallback := TMapLoadedCallback.Create(Self);
  end;

  if (not FViewShown) and (not FViewShowing) then
  begin
    FViewShowing := True;
    FMapView.FJMapView.onResume;
    FMapView.FJNativeLayout.setControl(FMapView.FJMapView);
    InvokeOnMap(procedure (Map: JGoogleMap)
      begin
        Map.setOnMapLoadedCallback(FMapLoadedCallback); // called when the map will have been fully loaded
        Map.setOnCameraChangeListener(JGoogleMap_OnCameraChangeListener(FCameraChangeListener));
        Map.setOnMarkerClickListener(JGoogleMap_OnMarkerClickListener(FMarkerClickListener));
        Map.setOnMarkerDragListener(JGoogleMap_OnMarkerDragListener(FMarkerDragListener));
        Map.setOnMapClickListener(FClickListener);
        Map.setOnMapLongClickListener(FLongClickListener);
      end);
  end;
end;

procedure TAndroidMapView_UIThread.Hide;
begin
  Hide(FMapView.FJMapView, FMapView.FJNativeLayout, FMapView.Bundle);
end;

procedure TAndroidMapView_UIThread.Hide(MapView: JMapViewWithGestures; NativeLayout: JNativeLayout; Bundle: JBundle);
begin
  if FViewShown or FViewShowing then
  begin
    InvokeOnMap(MapView, procedure (Map: JGoogleMap)
      begin
        Map.setOnMapLoadedCallback(nil);
        Map.setOnCameraChangeListener(nil);
        Map.setOnMarkerClickListener(nil);
        Map.setOnMarkerDragListener(nil);
        Map.setOnMapClickListener(nil);
        Map.setOnMapLongClickListener(nil);
      end);
    FViewShown := False;
    FViewShowing := False;
    MapView.onSaveInstanceState(Bundle);
    MapView.onPause;
    NativeLayout.setControl(nil);
  end;
end;

procedure TAndroidMapView_UIThread.AnimateCameraToPosition;
begin
  InvokeOnMap(procedure (Map: JGoogleMap) begin
    TJMapsInitializer.JavaClass.initialize(TAndroidHelper.Activity);  // workaround for older version of gms
    Map.animateCamera(TJCameraUpdateFactory.JavaClass.newCameraPosition(FMapView.FCameraPosition));
  end);
end;

procedure TAndroidMapView_UIThread.GetCameraPosition;
begin
  InvokeOnMap(procedure (Map: JGoogleMap) begin
    TJMapsInitializer.JavaClass.initialize(TAndroidHelper.Activity);  // workaround for older version of gms
    FCameraPosition := Map.getCameraPosition;
  end);
end;

procedure TAndroidMapView_UIThread.SetMapType;
var
  Map: JGoogleMap;
begin
  Map := FMapView.FJMapView.getMap;
  if Map <> nil then
    Map.setMapType(FMapView.GetGoogleMapType);
end;

procedure TAndroidMapView_UIThread.OptionsChanged;
begin
  if (TMapOptionSet.Layer in FMapView.FUpdateOptions) and SetLayers then
    Exclude(FMapView.FUpdateOptions, TMapOptionSet.Layer);
  if (TMapOptionSet.Control in FMapView.FUpdateOptions) and SetControls then
    Exclude(FMapView.FUpdateOptions, TMapOptionSet.Control);
  if (TMapOptionSet.Gesture in FMapView.FUpdateOptions) and SetGestures then
    Exclude(FMapView.FUpdateOptions, TMapOptionSet.Gesture);
end;

function TAndroidMapView_UIThread.InvokeOnMap(const MapView: JMapViewWithGestures; const Proc: TProc<JGoogleMap>): Boolean;
var
  Map: JGoogleMap;
begin
  Result := False;
  if MapView <> nil then
  begin
    Map := MapView.getMap;
    if Map <> nil then
    try
      Proc(Map);
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TAndroidMapView_UIThread.InvokeOnMap(const Proc: TProc<JGoogleMap>): Boolean;
begin
  Result := InvokeOnMap(FMapView.FJMapView, Proc);
end;

function TAndroidMapView_UIThread.ApplyToMap<TResult>(const Func: TFunc<JGoogleMap,TResult>): TResult;
var
  Map: JGoogleMap;
  MapView: JMapView;
begin
  MapView := FMapView.FJMapView;
  if MapView <> nil then
  begin
    Map := MapView.getMap;
    if Map <> nil then
      Result := Func(Map);
  end;
end;

function TAndroidMapView_UIThread.InvokeOnUISettings(const Proc: TProc<JUiSettings>): Boolean;
begin
  Result := InvokeOnMap(procedure(Map: JGoogleMap)
    var
      UiSettings: JUiSettings;
    begin
      UiSettings := Map.getUiSettings;
      if UiSettings <> nil then
        Proc(UiSettings)
      else
        raise Exception.Create('Map.getUiSettings is nil');
    end);
end;

function TAndroidMapView_UIThread.SetLayers: Boolean;
begin
  Result := InvokeOnMap(procedure (Map: JGoogleMap) begin
    Map.setBuildingsEnabled(TMapLayerOption.Buildings in FMapView.FHostControl.LayerOptions);
    Map.setTrafficEnabled(TMapLayerOption.Traffic in FMapView.FHostControl.LayerOptions);
    Map.setMyLocationEnabled(TMapLayerOption.UserLocation in FMapView.FHostControl.LayerOptions);

  end);
end;


function TAndroidMapView_UIThread.SetControls: Boolean;
begin
  Result := InvokeOnUISettings(procedure(UISettings: JUiSettings)
    begin
      UISettings.setCompassEnabled(TMapControlOption.Compass in FMapView.FHostControl.ControlOptions);
      UISettings.setZoomControlsEnabled(TMapControlOption.Zoom in FMapView.FHostControl.ControlOptions);
      UISettings.setMyLocationButtonEnabled(TMapControlOption.MyLocation in FMapView.FHostControl.ControlOptions);
    end);
end;

function TAndroidMapView_UIThread.SetGestures: Boolean;
begin
  Result := InvokeOnUISettings(procedure(UISettings: JUiSettings)
    begin
      UISettings.setZoomGesturesEnabled(TMapGestureOption.Zoom in FMapView.FHostControl.GestureOptions);
      UISettings.setTiltGesturesEnabled(TMapGestureOption.Tilt in FMapView.FHostControl.GestureOptions);
      UISettings.setScrollGesturesEnabled(TMapGestureOption.Scroll in FMapView.FHostControl.GestureOptions);
      UISettings.setRotateGesturesEnabled(TMapGestureOption.Rotate in FMapView.FHostControl.GestureOptions);
    end);
end;

function TAndroidMapView_UIThread.BuildGoogleMapOptions: JGoogleMapOptions;
begin
  Result := TFunc<TCustomMapView, JGoogleMapOptions>(function(Host: TCustomMapView): JGoogleMapOptions
    begin
      Result := TJGoogleMapOptions.JavaClass.init().camera(FMapView.BuildCameraPosition)
        .zoomGesturesEnabled(TMapGestureOption.Zoom in Host.GestureOptions)
        .tiltGesturesEnabled(TMapGestureOption.Tilt in Host.GestureOptions)
        .scrollGesturesEnabled(TMapGestureOption.Scroll in Host.GestureOptions)
        .rotateGesturesEnabled(TMapGestureOption.Rotate in Host.GestureOptions)
        .zoomControlsEnabled(TMapControlOption.Zoom in Host.ControlOptions)
        .compassEnabled(TMapControlOption.Compass in Host.ControlOptions)
        .mapType(FMapView.GetGoogleMapType);
    end)(FMapView.FHostControl);
end;

function TAndroidMapView_UIThread.BuildMarkerOptions(const D: TMapMarkerDescriptor): JMarkerOptions;
begin
  Result := TJMarkerOptions.JavaClass.init.alpha(D.Opacity)
    .anchor(D.Origin.X, D.Origin.Y)
    .draggable(D.Draggable)
    .flat(D.Appearance = TMarkerAppearance.Flat)
    .position(CoordToLatLng(D.Position))
    .rotation(D.Rotation)
    .snippet(StringToJString(D.Snippet))
    .title(StringToJString(D.Title))
    .visible(D.Visible);
  if D.Icon <> nil then
    Result := Result.icon(CreateBitmapDescriptorFromBitmap(D.Icon));
end;

function TAndroidMapView_UIThread.BuildCircleOptions(const D: TMapCircleDescriptor): JCircleOptions;
begin
  Result := TJCircleOptions.JavaClass.init
    .center(CoordToLatLng(D.Center))
    .fillColor(D.FillColor)
    .radius(D.Radius)
    .strokeWidth(D.StrokeWidth)
    .strokeColor(D.StrokeColor)
    .zIndex(D.ZIndex);
end;

function TAndroidMapView_UIThread.BuildPolygonOptions(const D: TMapPolygonDescriptor): JPolygonOptions;
var
  Vertex: TMapCoordinate;
  Hole: TMapPolygonPolyvertex;
  List: JArrayList;
begin
  Result := TJPolygonOptions.JavaClass.init
    .fillColor(D.FillColor)
    .strokeWidth(D.StrokeWidth)
    .strokeColor(D.StrokeColor)
    .zIndex(D.ZIndex);

  List := TJArrayList.JavaClass.init;
  for Vertex in D.Outline.Points do
    List.add(CoordToLatLng(Vertex));
  Result.addAll(JIterable(List));

  for Hole in D.Holes do
  begin
    List.clear;
    for Vertex in Hole.Points do
      List.add(CoordToLatLng(Vertex));
    Result.addHole(JIterable(List));
  end;
end;

function TAndroidMapView_UIThread.BuildPolylineOptions(const D: TMapPolylineDescriptor): JPolylineOptions;
var
  List: JArrayList;
  Vertex: TMapCoordinate;
begin
  Result := TJPolylineOptions.JavaClass.init
    .width(D.StrokeWidth)
    .color(D.StrokeColor)
    .zIndex(D.ZIndex);

  List := TJArrayList.JavaClass.init;
  for Vertex in D.Points.Points do
    List.add(CoordToLatLng(Vertex));
  Result.addAll(JIterable(List));
end;

function TAndroidMapView_UIThread.AddMarker(const D: TMapMarkerDescriptor): JMarker;
begin
  Result := ApplyToMap<JMarker>(function(Map: JGoogleMap): JMarker
    begin
      Result := Map.addMarker(BuildMarkerOptions(D));
    end);
end;

function TAndroidMapView_UIThread.AddCircle(const D: TMapCircleDescriptor): JCircle;
begin
  Result := ApplyToMap<JCircle>(function(Map: JGoogleMap): JCircle
    begin
      Result := Map.addCircle(BuildCircleOptions(D));
    end);
end;

function TAndroidMapView_UIThread.AddPolygon(const D: TMapPolygonDescriptor): JPolygon;
begin
  Result := ApplyToMap<JPolygon>(function(Map: JGoogleMap): JPolygon
    begin
      Result := Map.addPolygon(BuildPolygonOptions(D));
    end);
end;

function TAndroidMapView_UIThread.AddPolyline(const D: TMapPolylineDescriptor): JPolyline;
begin
  Result := ApplyToMap<JPolyline>(function(Map: JGoogleMap): JPolyline
    begin
      Result := Map.addPolyline(BuildPolylineOptions(D));
    end);
end;

{ TCameraCallback }

constructor TCameraCallback.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TCameraCallback.onCameraChange(listener: JCameraChangeListener);
begin
  FMapView.FTilt := listener.getTilt;
  FMapView.FBearing := listener.getBearing;
  FMapView.FZoom := listener.getZoom;
  FMapView.FLocation := TMapCoordinate.Create(listener.getLatitude, listener.getLongitude);
  FMapView.PostMapEvent(TMapEvent.Create(TMapEventKind.CameraChanged));
end;

{ TMapEvent }

class function TMapEvent.Create(Marker: JMarker; Kind: TMapEventKind): TMapEvent;
begin
  Result.Marker := Marker;
  Result.Kind := Kind;
end;

class function TMapEvent.Create(Kind: TMapEventKind): TMapEvent;
begin
  Result.Kind := Kind;
end;

class function TMapEvent.Create(Kind: TMapEventKind; const LatLng: TMapCoordinate): TMapEvent;
begin
  Result.Marker := nil;
  Result.Kind := Kind;
  Result.LatLng := LatLng;
end;

{ TMarkerListener }

constructor TMarkerDragListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMarkerDragListener.onMarkerDragStart(P1: JMarker);
begin
  FMapView.PostMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerDragStart));
end;

procedure TMarkerDragListener.onMarkerDrag(P1: JMarker);
begin
  FMapView.PostMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerDrag));
end;

procedure TMarkerDragListener.onMarkerDragEnd(P1: JMarker);
begin
  FMapView.PostMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerDragEnd));
end;

{ TMarkerClickListener }
constructor TMarkerClickListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

function TMarkerClickListener.onMarkerClick(P1: JMarker): Boolean;
begin
  FMapView.PostMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerClick));
  Result := False;
end;

{ TMapClickListener }

constructor TMapClickListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMapClickListener.onMapClick(P1: JLatLng);
begin
  FMapView.PostMapEvent(TMapEvent.Create(TMapEventKind.MapClick, TMapCoordinate.Create(P1.latitude, P1.longitude)));
end;

{ TMapLongClickListener }

constructor TMapLongClickListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMapLongClickListener.onMapLongClick(P1: JLatLng);
begin
  FMapView.PostMapEvent(TMapEvent.Create(TMapEventKind.MapLongClick, TMapCoordinate.Create(P1.latitude, P1.longitude)));
end;

function TAndroidMapView_UIThread.Snapshot(Recipient: TMapScreenshotRecipient): Boolean;
begin
  Result := InvokeOnMap(procedure(Map: JGoogleMap) begin
    FSnapshotReadyCallback := TSnapshotReadyCallback.Create(FMapView, Recipient);
    Map.snapshot(FSnapshotReadyCallback);
  end);
end;

{ TSnapshotReadyCallback }

constructor TSnapshotReadyCallback.Create(MapView: TAndroidMapView; const Recipient: TMapScreenshotRecipient);
begin
  inherited Create;
  FMapView := MapView;
  FRecipient := Recipient;
end;

procedure TSnapshotReadyCallback.onSnapshotReady(P1: JBitmap);
begin
  if Assigned(FRecipient) then
  begin
    FBitmapResult := P1;
    TThread.Queue(nil, procedure
      var
        Surface: TBitmapSurface;
        Bitmap: TBitmap;
      begin
        Surface := TBitmapSurface.Create;
        Bitmap := nil;
        try
          if JBitmapToSurface(FBitmapResult, Surface) then
          begin
            Bitmap := TBitmap.Create;
            Bitmap.Assign(Surface);
            if Assigned(FRecipient) then
              FRecipient(Bitmap);
          end;
        finally
          Surface.Free;
          Bitmap.Free;
        end;
      end);
  end;
end;

{ TAndroidMapMarker }

constructor TAndroidMapMarker.Create(const Descriptor: TMapMarkerDescriptor);
begin
  inherited;
end;

destructor TAndroidMapMarker.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapMarker.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapMarker.SetJMarker(Marker: JMarker);
begin
  FJavaMarker := Marker;
end;

procedure TAndroidMapMarker.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JMarker>(procedure (M: JMarker)
    begin
      M.remove;
    end, FJavaMarker);
  FMapView.RemoveMapObject(JStringToString(FJavaMarker.getId));
end;

procedure TAndroidMapMarker.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JMarker>(procedure (M: JMarker) begin
      M.setVisible(Value);
    end, FJavaMarker);
end;

function TAndroidMapMarker.ToString: string;
begin
  Result := Format('%s[Pos:%s;Title:%s,Visible=%s]', [inherited, Descriptor.Position.ToString, Descriptor.Title,
    BoolToStr(Descriptor.Visible, True)]);
end;

{ TAndroidMapCircle }

destructor TAndroidMapCircle.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapCircle.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapCircle.SetJCircle(Circle: JCircle);
begin
  FJavaCircle := Circle;
end;

procedure TAndroidMapCircle.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JCircle>(procedure (C: JCircle) begin
      C.remove;
    end, FJavaCircle);
  FMapView.RemoveMapObject(JStringToString(FJavaCircle.getId));
end;

procedure TAndroidMapCircle.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JCircle>(procedure (C: JCircle) begin
      C.setVisible(Value)
    end, FJavaCircle);
end;

function TAndroidMapCircle.ToString: string;
begin
  Result := Format('%s[Center:%3.4f;%3.4f;R:%3.4f]', [inherited, Descriptor.Center.Latitude, Descriptor.Center.Longitude,
    Descriptor.Radius]);
end;

{ TAndroidMapPolygon }

destructor TAndroidMapPolygon.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapPolygon.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapPolygon.SetJPolygon(Polygon: JPolygon);
begin
  FJavaPolygon := Polygon;
end;

procedure TAndroidMapPolygon.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolygon>(procedure (P: JPolygon) begin
      P.remove;
    end, FJavaPolygon);
  FMapView.RemoveMapObject(JStringToString(FJavaPolygon.getId));
end;

procedure TAndroidMapPolygon.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolygon>(procedure (P: JPolygon) begin
      P.setVisible(Value);
    end, FJavaPolygon);
  FMapView.RemoveMapObject(JStringToString(FJavaPolygon.getId));
end;

function TAndroidMapPolygon.ToString: string;
begin
  Result := Format('%s[|Points|=%d;|Holes|=%d;Geo=%d]', [inherited, Length(Descriptor.Outline.Points),
    Length(Descriptor.Holes), BoolToStr(Descriptor.Geodesic, True)]);
end;

{ TAndroidMapPolyline }

destructor TAndroidMapPolyline.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapPolyline.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapPolyline.SetJPolyline(Polyline: JPolyline);
begin
  FJavaPolyline := Polyline;
end;

procedure TAndroidMapPolyline.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolyline>(procedure (P: JPolyline) begin
      P.remove;
    end, FJavaPolyline);
  FMapView.RemoveMapObject(JStringToString(FJavaPolyline.getId));
end;

procedure TAndroidMapPolyline.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolyline>(procedure (P: JPolyline) begin
      P.setVisible(Value);
    end, FJavaPolyline);
end;

function TAndroidMapPolyline.ToString: string;
begin
  Result := Format('%s[|Points|=%d;Geo=%d]', [inherited, Length(Descriptor.Points.Points),
    BoolToStr(Descriptor.Geodesic, True)]);
end;

{ TDoubleTapListener }

constructor TDoubleTapListener.Create(const MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

function TDoubleTapListener.onDoubleTap(e: JMotionEvent): Boolean;
var
  P: JPoint;
  LatLng: JLatLng;
begin
  P := TJPoint.JavaClass.init(Round(e.getX), Round(e.getY));
  LatLng := FMapView.FJMapView.getMap.getProjection.fromScreenLocation(P);
  FMapView.PostMapEvent(TMapEvent.Create(TMapEventKind.MapDoubleClick,
    TMapCoordinate.Create(LatLng.latitude, LatLng.longitude)));
  Result := False;
end;

function TDoubleTapListener.onDoubleTapEvent(e: JMotionEvent): Boolean;
begin
  Result := False;
end;

function TDoubleTapListener.onSingleTapConfirmed(e: JMotionEvent): Boolean;
begin
  Result := False;
end;
{$ENDIF ANDROID}

end.

