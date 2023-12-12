(*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * Any non-GPL usage of this software or parts of this software is strictly
 * forbidden.
 *
 * The "appropriate copyright message" mentioned in section 2c of the GPLv2
 * must read: "Code from FAAD2 is copyright (c) Nero AG, www.nero.com"
 *
 *)

//{$I ..\..\source\compiler.inc}

unit PasListVlcMediaPlayerFrame;

interface

uses
  {$IFDEF UNIX}Unix,{$ENDIF}
  {$IFDEF MSWINDOWS}Windows,{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls,
//  {$IFDEF DELPHI_XE2_UP}
  System.UITypes,
//  {$ENDIF}


  Math,
  DateUtils,
  uBaseLog,
  uFileCommon,
  uBasePageStructure,
  uComponentType,
  uPageStructure,



  PasLibVlcUnit, PasLibVlcClassUnit, PasLibVlcPlayerUnit;

type
  TframePasLibVlcMediaPlayer = class(TFrame,IControlForPageFramework)
    PR: TPanel;
    PlayBtn: TButton;
    PauseBtn: TButton;
    GetWidthBtn: TButton;
    GetHeightBtn: TButton;
    GetStateBtn: TButton;
    ResumeBtn: TButton;
    GetPosLenBtn: TButton;
    Scale10Btn: TButton;
    ScaleFitBtn: TButton;
    SnapShotBtn: TButton;
    NextFrameBtn: TButton;
    GetASpectRatioBtn: TButton;
    SetAsp11Btn: TButton;
    SetAsp43Btn: TButton;
    LB: TListBox;
    MrlEdit: TEdit;
    MrlLab: TLabel;
    GetVolume: TButton;
    SetVolumeUp10: TButton;
    SetVolumeDo10: TButton;
    PopupMenu: TPopupMenu;
    a1: TMenuItem;
    b1: TMenuItem;
    c1: TMenuItem;
    d1: TMenuItem;
    GetPlayRateBtn: TButton;
    SetPlayRate2xBtn: TButton;
    SetPlayRateHalfBtn: TButton;
    PasLibVlcPlayer1: TPasLibVlcPlayer;
    FullScreenYesBtn: TButton;
    DeInterlaceBtn: TButton;
    ProgPanel: TPanel;
    ProgBar: TTrackBar;
    ProgLabel1: TLabel;
    ProgLabel2: TLabel;
    OpenDialog: TOpenDialog;
    GetAudioChannel: TButton;
    SetAudioChannelLeft: TButton;
    SetAudioChannelRight: TButton;
    SetAudioChannelStereo: TButton;
    SaveDialog: TSaveDialog;
    LbPopupMenu: TPopupMenu;
    LbPmClear: TMenuItem;
    LnPmSaveAs: TMenuItem;
    GetAudioOutDevEnumBtn: TButton;
    GetEqPreListBtn: TButton;
    SetEqualizerBtn: TButton;
    ChAudioOut: TButton;
    GetAudioTrackList: TButton;
    Panel1: TPanel;
    procedure PlayClick(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure GetWidthClick(Sender: TObject);
    procedure GetHeightBtnClick(Sender: TObject);
    procedure GetStateClick(Sender: TObject);
    procedure ResumeClick(Sender: TObject);
    procedure GetPosLenClick(Sender: TObject);
    procedure Scale10Click(Sender: TObject);
    procedure ScaleFitClick(Sender: TObject);
    procedure SnapShotClick(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerBackward(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerBuffering(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerEncounteredError(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerEndReached(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerForward(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerNothingSpecial(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerOpening(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerPaused(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerPlaying(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerStopped(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerLengthChanged(Sender: TObject;
      time: Int64);
    procedure PasLibVlcPlayer1MediaPlayerPausableChanged(Sender: TObject;
      val: Boolean);
    procedure PasLibVlcPlayer1MediaPlayerPositionChanged(Sender: TObject;
      position: Single);
    procedure PasLibVlcPlayer1MediaPlayerSeekableChanged(Sender: TObject;
      val: Boolean);
    procedure PasLibVlcPlayer1MediaPlayerTitleChanged(Sender: TObject;
      title: Integer);
    procedure PasLibVlcPlayer1MediaPlayerTimeChanged(Sender: TObject;
      time: Int64);
    procedure PasLibVlcPlayer1MediaPlayerSnapshotTaken(Sender: TObject;
      fileName: string);
    procedure NextFrameClick(Sender: TObject);
    procedure GetASpectRatioClick(Sender: TObject);
    procedure SetAsp11Click(Sender: TObject);
    procedure SetAsp43Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetVolumeClick(Sender: TObject);
    procedure SetVolumeUp10Click(Sender: TObject);
    procedure SetVolumeDo10Click(Sender: TObject);
    procedure PasLibVlcPlayer1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure PasLibVlcPlayer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GetPlayRateBtnClick(Sender: TObject);
    procedure SetPlayRate2xBtnClick(Sender: TObject);
    procedure SetPlayRateHalfBtnClick(Sender: TObject);
    procedure TransPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PasLibVlcPlayer1MouseEnter(Sender: TObject);
    procedure PasLibVlcPlayer1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PasLibVlcPlayer1MouseLeave(Sender: TObject);
    procedure PasLibVlcPlayer1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PasLibVlcPlayer1Click(Sender: TObject);
    procedure PasLibVlcPlayer1DblClick(Sender: TObject);
    procedure FullScreenYesBtnClick(Sender: TObject);
    procedure DeInterlaceBtnClick(Sender: TObject);
    procedure ProgBarChange(Sender: TObject);
    procedure MrlEditClick(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerMediaChanged(Sender: TObject;
      mrl: string);
    procedure GetAudioChannelClick(Sender: TObject);
    procedure SetAudioChannelLeftClick(Sender: TObject);
    procedure SetAudioChannelRightClick(Sender: TObject);
    procedure SetAudioChannelStereoClick(Sender: TObject);
    procedure GetAudioOutListBtnClick(Sender: TObject);
    procedure LbPmClearClick(Sender: TObject);
    procedure LnPmSaveAsClick(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerVideoOutChanged(Sender: TObject;
      video_out: Integer);
    procedure PasLibVlcPlayer1MediaPlayerScrambledChanged(Sender: TObject;
      scrambled: Integer);
    procedure GetAudioOutDevEnumBtnClick(Sender: TObject);
    procedure GetEqPreListBtnClick(Sender: TObject);
    procedure SetEqualizerBtnClick(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerCorked(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerUnCorked(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerUnMuted(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerMuted(Sender: TObject);
    procedure ChAudioOutClick(Sender: TObject);
    procedure GetAudioTrackListClick(Sender: TObject);
    procedure PasLibVlcPlayer1MediaPlayerAudioVolumeChanged(Sender: TObject;
      volume: Single);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FLengthChanged:Boolean;
    FIsPlaying:Boolean;

    lastAudioVolume : string;
    start : DWORD;
    procedure DoResize();
    procedure LbAdd(Item: string; AObject: TObject = NIL);
  public
    FValue:String;
    FFilePath:String;
    //针对页面框架的控件接口
    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;
    //获取与设置自定义属性
    function GetPropJsonStr:String;
    procedure SetPropJsonStr(AJsonStr:String);
    //获取提交的值,是不是存在多个值
    function GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
                            var AErrorMessage:String):Variant;
    //设置值
    procedure SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;
                            AImageServerUrl:String;
                            AValue:Variant;AValueCaption:String;
                            //要设置多个值,整个字段的记录
                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue
                            );
//    //设置属性
//    function GetProp(APropName:String):Variant;
//    procedure SetProp(APropName:String;APropValue:Variant);

    procedure DoReturnFrame(AFromFrame:TFrame);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  end;



var
  framePasLibVlcMediaPlayer: TframePasLibVlcMediaPlayer;

function GetVideoInfo(AFilePath:String;
                      ACoverFilePath:String;
                      var ATimeLong:Integer;
                      var AWidth:Integer;
                      var AHeight:Integer):Boolean;


implementation

{$R *.dfm}

uses
  FullScreenFormUnit,
  SetEqualizerPresetFormUnit,
  SelectOutputDeviceFormUnit;



function GetVideoInfo(AFilePath:String;ACoverFilePath:String;var ATimeLong:Integer;
                      var AWidth:Integer;
                      var AHeight:Integer):Boolean;
var
  APasLibVlcMediaPlayerFrame: TframePasLibVlcMediaPlayer;
  AStartTime:TDateTime;
  I: Integer;
begin
  uBaseLog.HandleException(nil,'GetVideoInfo Begin');

  Result:=False;
  ATimeLong:=0;
  AWidth:=0;
  AHeight:=0;

  APasLibVlcMediaPlayerFrame:=TframePasLibVlcMediaPlayer.Create(nil);
  try
    try
        APasLibVlcMediaPlayerFrame.PasLibVlcPlayer1.Play(AFilePath);

        while not APasLibVlcMediaPlayerFrame.FIsPlaying do
        begin
          Application.ProcessMessages;
        end;

        while not APasLibVlcMediaPlayerFrame.FIsPlaying do
        begin
          Application.ProcessMessages;
        end;


        for I := 0 to 4 do
        begin
          //截图
          AStartTime:=Now;
          while DateUtils.SecondsBetween(AStartTime,Now)<=1 do
          begin
            Application.ProcessMessages;
          end;
          //取第一帧
          if APasLibVlcMediaPlayerFrame.PasLibVlcPlayer1.Snapshot(ACoverFilePath)
            and FileExists(ACoverFilePath) then
          begin
            Break;
          end
          else
          begin
            uBaseLog.HandleException(nil,'GetVideoInfo 取截图次数：'+IntToStr(I));
          end;
        end;



        ATimeLong:=Ceil(APasLibVlcMediaPlayerFrame.PasLibVlcPlayer1.GetVideoLenInMs / 1000);





        //等截图返回

        AWidth:=APasLibVlcMediaPlayerFrame.PasLibVlcPlayer1.GetVideoWidth;
        AHeight:=APasLibVlcMediaPlayerFrame.PasLibVlcPlayer1.GetVideoHeight;


        Result:=True;
    except
      on E:Exception do
      begin
        uBaseLog.HandleException(E,'GetVideoInfo');
      end;
    end;
  finally
    FreeAndNil(APasLibVlcMediaPlayerFrame);
  end;

  uBaseLog.HandleException(nil,'GetVideoInfo End');

end;


////////////////////////////////////////////////////////////////////////////////

procedure TframePasLibVlcMediaPlayer.LbAdd(Item: string; AObject: TObject = NIL);
var
  current : DWORD;
  delta : DWORD;
begin
  if (LB.Items.Count = 0) then
  begin
    start := GetTickCount();
  end;
  current := GetTickCount();
  if (start <= current) then
  begin
    delta := current - start
  end
  else
  begin
    delta := $FFFFFFFF - start + current;
  end; 
  LB.AddItem(IntToStr(delta) + ' ms  ' + Item, AObject);
  LB.ItemIndex := LB.Items.Count-1;
end;

procedure TframePasLibVlcMediaPlayer.LbPmClearClick(Sender: TObject);
begin
  LB.Clear;
end;

procedure TframePasLibVlcMediaPlayer.LnPmSaveAsClick(Sender: TObject);
begin
  if (SaveDialog.Execute) then
    LB.Items.SaveToFile(SaveDialog.FileName);
end;

procedure TframePasLibVlcMediaPlayer.MrlEditClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
    MrlEdit.Text := OpenDialog.FileName;
end;

procedure TframePasLibVlcMediaPlayer.PlayClick(Sender: TObject);
var
  appl_path   : string;
  logo_path   : string;
  logo_file_1 : string;
  logo_file_2 : string;
begin


  PasLibVlcPlayer1.Play(MrlEdit.Text);

//  ProgBar.OnChange := NIL;

  appl_path := ExtractFilePath(Application.ExeName);
  if ((appl_path <> '') and (appl_path[Length(appl_path)] <> PathDelim)) then
  begin
    appl_path := appl_path + PathDelim;
  end;

  logo_path := appl_path + '..'+PathDelim+'..'+PathDelim+'..'+PathDelim+'..'+PathDelim;

  logo_file_1 := logo_path + 'logo1.png';
  logo_file_2 := logo_path + 'logo2.png';

  if (FileExists(logo_file_1) and FileExists(logo_file_2)) then
  begin
    PasLibVlcPlayer1.LogoShowFiles([logo_file_1, logo_file_2]);
  end;
  PasLibVlcPlayer1.MarqueeShowText('marquee test %H:%M:%S');
end;

procedure TframePasLibVlcMediaPlayer.ProgBarChange(Sender: TObject);
begin
  if PasLibVlcPlayer1.CanSeek() then
  begin
    PasLibVlcPlayer1.SetVideoPosInMs(ProgBar.Position);
    ProgLabel1.Caption := PasLibVlcPlayer1.GetVideoPosStr('hh:mm:ss.ms');
  end;
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1Click(Sender: TObject);
begin
  LBAdd('MouseClick');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  LBAdd('ContextPopUp');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1DblClick(Sender: TObject);
begin
  LBAdd('MouseDblClick');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerAudioVolumeChanged(
  Sender: TObject; volume: Single);
var
  newAudioVolume : string;
begin
  newAudioVolume := FloatToStr(volume);
  if (lastAudioVolume <> newAudioVolume) then
  begin
    lastAudioVolume := newAudioVolume;
    LBAdd('MediaPlayerAudioVolume: ' + lastAudioVolume);
  end;
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerBackward(Sender: TObject);
begin
  LBAdd('MediaPlayerBackward');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerBuffering(Sender: TObject);
begin
  LBAdd('MediaPlayerBuffering');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerCorked(Sender: TObject);
begin
  LBAdd('MediaPlayerCorked');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerEncounteredError(
  Sender: TObject);
begin
  LBAdd('MediaPlayerEncounteredError');
  LBAdd({$IFDEF DELPHI_XE2_UP}UTF8ToWideString{$ELSE}UTF8Decode{$ENDIF}(libvlc_errmsg()));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerEndReached(Sender: TObject);
begin
  LBAdd('MediaPlayerEndReached');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerForward(Sender: TObject);
begin
  LBAdd('MediaPlayerForward');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerLengthChanged(Sender: TObject;
  time: Int64);
begin
  LBAdd('MediaPlayerLengthChanged: ' + IntToStr(time) + ', time: ' + PasLibVlcPlayer1.GetVideoLenStr());
  ProgLabel2.Caption := PasLibVlcPlayer1.GetVideoLenStr();
  ProgBar.Max := PasLibVlcPlayer1.GetVideoLenInMs();
  FLengthChanged:=True;
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerMediaChanged(Sender: TObject;
  mrl: string);
begin
  LBAdd('MediaPlayerMediaChanged: ' + mrl);
  Caption := mrl;
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerMuted(Sender: TObject);
begin
  LBAdd('MediaPlayerMuted');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerNothingSpecial(Sender: TObject);
begin
  LBAdd('MediaPlayerNothingSpecial');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerOpening(Sender: TObject);
begin
  LBAdd('MediaPlayerOpening');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerPausableChanged(Sender: TObject;
  val: Boolean);
begin
  LBAdd('MediaPlayerPausableChanged: ' + IntToStr(Ord(val)));  
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerPaused(Sender: TObject);
begin
  LBAdd('MediaPlayerPaused');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerPlaying(Sender: TObject);
begin
  LBAdd('MediaPlayerPlaying');
  FIsPlaying:=True;
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerPositionChanged(Sender: TObject;
  position: Single);
begin
  LBAdd('MediaPlayerPositionChanged: ' + FloatToStr(position));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerScrambledChanged(Sender: TObject;
  scrambled: Integer);
begin
  LBAdd('MediaPlayerScrambledChanged: ' + IntToStr(scrambled));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerSeekableChanged(Sender: TObject;
  val: Boolean);
begin
  LBAdd('MediaPlayerSeekableChanged: ' + IntToStr(Ord(val)));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerSnapshotTaken(Sender: TObject;
  fileName: string);
begin
  LBAdd('MediaPlayerSnapshotTaken: ' + fileName);
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerStopped(Sender: TObject);
begin
  LBAdd('MediaPlayerStopped');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerTimeChanged(Sender: TObject;
  time: Int64);
begin
  LBAdd('MediaPlayerTimeChanged: ' + IntToStr(time));
  ProgLabel1.Caption := PasLibVlcPlayer1.GetVideoPosStr('hh:mm:ss.ms');
  ProgBar.OnChange := NIL;
  try
    ProgBar.Position := PasLibVlcPlayer1.GetVideoPosInMs();
  finally
    ProgBar.OnChange := ProgBarChange;
  end;
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerTitleChanged(Sender: TObject;
  title: Integer);
begin
  LBAdd('MediaPlayerTitleChanged: ' + IntToStr(title));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerUnCorked(Sender: TObject);
begin
  LBAdd('MediaPlayerUnCorked');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerUnMuted(Sender: TObject);
begin
  LBAdd('MediaPlayerUnMuted');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MediaPlayerVideoOutChanged(Sender: TObject;
  video_out: Integer);
begin
  LBAdd('MediaPlayerVideoOutChanged: ' + IntToStr(video_out));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LBAdd('MouseDown(' + IntToStr(X) + ', ' + IntToStr(Y) + ')');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MouseEnter(Sender: TObject);
begin
  LBAdd('MouseEnter');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MouseLeave(Sender: TObject);
begin
  LBAdd('MouseLeave');
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  LBAdd('MouseMove ' + IntToStr(x) + ', ' + IntToStr(y));
end;

procedure TframePasLibVlcMediaPlayer.PasLibVlcPlayer1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LBAdd('MouseUp(' + IntToStr(X) + ', ' + IntToStr(Y) + ')');
end;

procedure TframePasLibVlcMediaPlayer.PauseClick(Sender: TObject);
begin
  PasLibVlcPlayer1.Pause();
//  ProgBar.OnChange := ProgBarChange;
end;

procedure TframePasLibVlcMediaPlayer.GetWidthClick(Sender: TObject);
begin
  MessageDlg(
    'Video width = ' + IntToStr(PasLibVlcPlayer1.GetVideoWidth()),
    mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.NextFrameClick(Sender: TObject);
begin
  PasLibVlcPlayer1.NextFrame();
  LBAdd('Position:'+IntToStr(PasLibVlcPlayer1.GetVideoPosInMs()));
end;

procedure TframePasLibVlcMediaPlayer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PasLibVlcPlayer1.Stop();
end;

procedure TframePasLibVlcMediaPlayer.FormCreate(Sender: TObject);
begin
  // you can set custom path to libvlc.dll before call use PasLibVlcPlayer component
//  PasLibVlcPlayer1.VLC.Path := 'C:\Program Files (x86)\VideoLAN\VLC';
  // MrlEdit.Text := '..'+PathDelim+'..'+PathDelim+'..'+PathDelim+'..'+PathDelim+'_testFiles'+PathDelim+'test.ts';
  MrlEdit.Text :=
    '..'+PathDelim+'..'+PathDelim+'..'+PathDelim+'..'+PathDelim+
    '_testFiles'+PathDelim+'Maximize.mp4';
  DoResize();
  Caption := Caption + ' - ' + {$IFDEF CPUX64}'64'{$ELSE}'32'{$ENDIF} + ' bit';

//  PasLibVlcPlayer1.VLC.Path:=ExtractFilePath(Application.ExeName);
  //初始VLC库的路径
  Self.PasLibVlcPlayer1.VLC.Path:=GetApplicationPath+'vlc-3.0.16-win32\';
end;

procedure TframePasLibVlcMediaPlayer.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LBAdd('FormMouseDown');
end;

procedure TframePasLibVlcMediaPlayer.FormResize(Sender: TObject);
begin
  DoResize();
end;

procedure TframePasLibVlcMediaPlayer.FullScreenYesBtnClick(Sender: TObject);
//var
//  aFullScreenForm : TFullScreenForm;
//  oldL, oldT, oldW, oldH : Integer;
//  oldA : TAlign;
begin
//  MessageDlg('Press any key, to leave full screen mode', mtInformation, [mbOK], 0);
//
//  oldL := PasLibVlcPlayer1.Left;
//  oldT := PasLibVlcPlayer1.Top;
//  oldW := PasLibVlcPlayer1.Width;
//  oldH := PasLibVlcPlayer1.Height;
//  oldA := PasLibVlcPlayer1.Align;
//
//  if (oldA <> alNone) then PasLibVlcPlayer1.Align := alNone;
//
//  aFullScreenForm := TFullScreenForm.Create(SELF);
//  aFullScreenForm.SetBounds(Monitor.Left, Monitor.Top, Monitor.Width, Monitor.Height);
//
//  // PasLibVlcPlayer1.ParentWindow := aFullScreenForm.Handle;
//  {$IFDEF FPC}
//    LCLIntf.SetParent(PasLibVlcPlayer1.Handle, aFullScreenForm.Handle);
//  {$ELSE}
//    {$IFDEF MSWINDOWS}
//      Windows.SetParent(PasLibVlcPlayer1.Handle, aFullScreenForm.Handle);
//    {$ENDIF}
//  {$ENDIF}
//  PasLibVlcPlayer1.SetBounds(0, 0, aFullScreenForm.Width, aFullScreenForm.Height);
//
//  aFullScreenForm.ShowModal;
//
//  PasLibVlcPlayer1.SetBounds(oldL, oldT, oldW, oldH);
//  {$IFDEF FPC}
//    LCLIntf.SetParent(PasLibVlcPlayer1.Handle, SELF.Handle);
//  {$ELSE}
//    {$IFDEF MSWINDOWS}
//      Windows.SetParent(PasLibVlcPlayer1.Handle, SELF.Handle);
//    {$ENDIF}
//  {$ENDIF}
//
//  aFullScreenForm.Free;
//
//  if (oldA <> alNone) then PasLibVlcPlayer1.Align := oldA;
end;

procedure TframePasLibVlcMediaPlayer.GetAspectRatioClick(Sender: TObject);
var
  info : string;
  sar_num, sar_den : LongWord;
begin
  info := 'Aspect ratio = ' + PasLibVlcPlayer1.GetVideoAspectRatio();
  if (PasLibVlcPlayer1.GetVideoSampleAspectRatio(sar_num, sar_den)) then
  begin
    info := info + ', SampleAspectRatio = ' + IntToStr(sar_num) + ':' + IntToStr(sar_den);
  end;
  MessageDlg(
    info,
    mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.GetAudioChannelClick(Sender: TObject);
var
  chname: string;
begin
  chname := 'Unknown';
  case PasLibVlcPlayer1.GetAudioChannel() of
    libvlc_AudioChannel_Error    : chname := 'Error';
    libvlc_AudioChannel_NotAvail : chname := 'Not availiable';
    libvlc_AudioChannel_Stereo   : chname := 'Stereo';
    libvlc_AudioChannel_RStereo  : chname := 'RStereo';
    libvlc_AudioChannel_Left     : chname := 'Left';
    libvlc_AudioChannel_Right    : chname := 'Right';
    libvlc_AudioChannel_Dolbys   : chname := 'Dolbys';
  end;
  MessageDlg(chname, mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.GetAudioOutDevEnumBtnClick(Sender: TObject);
var
  ls1 : TStringList;
  id1 : Integer;
begin
  LBAdd('GetAudioOutputDeviceEnum');
  ls1 := PasLibVlcPlayer1.GetAudioOutputDeviceEnum();
  for id1 := 0 to ls1.Count - 1 do
  begin
    LBAdd('  ' + ls1.Strings[id1]);
  end;
  ls1.Free;
end;

procedure TframePasLibVlcMediaPlayer.GetAudioOutListBtnClick(Sender: TObject);
var
  ls1 : TStringList;
  ls2 : TStringList;
  id1 : Integer;
  id2 : Integer;
begin
  LBAdd('GetAudioOutputList');
  ls1 := PasLibVlcPlayer1.GetAudioOutputList();
  for id1 := 0 to ls1.Count - 1 do
  begin
    LBAdd('  ' + ls1.Strings[id1]);
    ls2 := PasLibVlcPlayer1.GetAudioOutputDeviceList(ls1.Strings[id1]);
    if (ls2.Count < 1) then
    begin
      LBAdd('    no devices found');
    end;
    for id2 := 0 to ls2.Count - 1 do
    begin
      LBAdd('    device: ' + ls2.Strings[id2]);
    end;
    ls2.Free;
  end;
  ls1.Free;
end;

procedure TframePasLibVlcMediaPlayer.GetAudioTrackListClick(Sender: TObject);
var
  ls1 : TStringList;
  id1 : Integer;
begin
  LBAdd('GetAudioTrackList');
  ls1 := PasLibVlcPlayer1.GetAudioTrackList();
  if (ls1.Count < 1) then
  begin
    LBAdd('    no audio tracks found');
  end;
  for id1 := 0 to ls1.Count - 1 do
  begin
    LBAdd('  audio track, ID: ' + IntToStr(Int64(ls1.Objects[id1])) + ' - ' + ls1.Strings[id1]);
  end;
  ls1.Free;
end;

procedure TframePasLibVlcMediaPlayer.GetEqPreListBtnClick(Sender: TObject);
var
  ls1 : TStringList;
  id1 : Integer;
  ebc : Word;
begin
  LBAdd('GetEqualizerPresetList');
  ls1 := PasLibVlcPlayer1.EqualizerGetPresetList();
  for id1 := 0 to ls1.Count - 1 do
  begin
    LBAdd('  ' + IntToStr(Word(ls1.Objects[id1])) + ' - ' + ls1.Strings[id1]);
  end;
  ls1.Free;

  ebc := PasLibVlcPlayer1.EqualizerGetBandCount();

  LBAdd('GetEqualizerBandCount = ' + IntToStr(ebc));

  LBAdd('GetEqualizerBandFrequency');
  for id1 := 0 to ebc - 1 do
  begin
    LBAdd('  ' + IntToStr(id1) + ' - ' + IntToStr(Round(PasLibVlcPlayer1.EqualizerGetBandFrequency(id1))));
  end;
end;

procedure TframePasLibVlcMediaPlayer.GetHeightBtnClick(Sender: TObject);
begin
  MessageDlg(
    'Video height = ' + IntToStr(PasLibVlcPlayer1.GetVideoHeight()),
    mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.GetPlayRateBtnClick(Sender: TObject);
begin
  MessageDlg(
    'Play rate = ' + IntToStr(PasLibVlcPlayer1.GetPlayRate()),
    mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.GetPosLenClick(Sender: TObject);
begin
  MessageDlg(
    'Len = ' + IntToStr(PasLibVlcPlayer1.GetVideoLenInMs()) + ' ms, '+
    'Pos = ' + IntToStr(PasLibVlcPlayer1.GetVideoPosInMs()),
    mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.GetStateClick(Sender: TObject);
var
  stateName: string;
begin
  case PasLibVlcPlayer1.GetState() of
    plvPlayer_NothingSpecial: stateName := 'Idle';
    plvPlayer_Opening:        stateName := 'Opening';
    plvPlayer_Buffering:      stateName := 'Buffering';
    plvPlayer_Playing:        stateName := 'Playing';
    plvPlayer_Paused:         stateName := 'Paused';
    plvPlayer_Stopped:        stateName := 'Stopped';
    plvPlayer_Ended:          stateName := 'Ended';
    plvPlayer_Error:          stateName := 'Error';
    else                      stateName := 'Unknown';
  end;
  MessageDlg('State = ' + stateName, mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.GetVolumeClick(Sender: TObject);
begin
  MessageDlg(
    'Volume level = ' + IntToStr(PasLibVlcPlayer1.GetAudioVolume()),
    mtInformation, [mbOK], 0);
end;

procedure TframePasLibVlcMediaPlayer.ResumeClick(Sender: TObject);
begin
  PasLibVlcPlayer1.Resume();
//  ProgBar.OnChange := NIL;
end;

procedure TframePasLibVlcMediaPlayer.Scale10Click(Sender: TObject);
var
  sc: Single;
begin
  sc := PasLibVlcPlayer1.GetVideoScaleInPercent;
  if (sc < 1) then sc := 100;
  sc := sc - 10;
  if PasLibVlcPlayer1.IsPlay() then
    PasLibVlcPlayer1.SetVideoScaleInPercent(sc);
end;

procedure TframePasLibVlcMediaPlayer.ScaleFitClick(Sender: TObject);
begin
  if PasLibVlcPlayer1.IsPlay() then
    PasLibVlcPlayer1.SetVideoScaleInPercent(0);
end;

procedure TframePasLibVlcMediaPlayer.SetAsp11Click(Sender: TObject);
begin
  PasLibVlcPlayer1.SetVideoAspectRatio('1:1');
end;

procedure TframePasLibVlcMediaPlayer.SetAsp43Click(Sender: TObject);
begin
  PasLibVlcPlayer1.SetVideoAspectRatio('4:3');
end;

procedure TframePasLibVlcMediaPlayer.SetAudioChannelLeftClick(Sender: TObject);
begin
  PasLibVlcPlayer1.SetAudioChannel(libvlc_AudioChannel_Left);
end;

procedure TframePasLibVlcMediaPlayer.SetAudioChannelRightClick(Sender: TObject);
begin
  PasLibVlcPlayer1.SetAudioChannel(libvlc_AudioChannel_Right);
end;

procedure TframePasLibVlcMediaPlayer.SetAudioChannelStereoClick(Sender: TObject);
begin
  PasLibVlcPlayer1.SetAudioChannel(libvlc_AudioChannel_Stereo);
end;

procedure TframePasLibVlcMediaPlayer.SetEqualizerBtnClick(Sender: TObject);
var
  eqf : TSetEqualizerPresetForm;
  prl : TStringList;
begin
  prl := PasLibVlcPlayer1.EqualizerGetPresetList();
  eqf := TSetEqualizerPresetForm.Create(SELF);
  eqf.FVLC := PasLibVlcPlayer1.VLC;
  eqf.PresetListLB.Items.AddStrings(prl);
  if eqf.ShowModal = mrOK then
  begin
    if (eqf.PresetListLB.ItemIndex > -1) then
    begin
      PasLibVlcPlayer1.EqualizerSetPreset(
        Word(prl.Objects[eqf.PresetListLB.ItemIndex])
      );
    end;
  end;
  eqf.Free;
  prl.Free;
end;

procedure TframePasLibVlcMediaPlayer.SetPlayRate2xBtnClick(Sender: TObject);
var
  newPlayRate: Integer;
begin
  newPlayRate := PasLibVlcPlayer1.GetPlayRate() * 2;
  if (newPlayRate > 400) then exit;
  PasLibVlcPlayer1.SetPlayRate(newPlayRate);
end;

procedure TframePasLibVlcMediaPlayer.SetPlayRateHalfBtnClick(Sender: TObject);
var
  newPlayRate: Integer;
begin
  newPlayRate := PasLibVlcPlayer1.GetPlayRate() div 2;
  if (newPlayRate < 25) then exit;
  PasLibVlcPlayer1.SetPlayRate(newPlayRate);
end;

procedure TframePasLibVlcMediaPlayer.SetVolumeDo10Click(Sender: TObject);
begin
  PasLibVlcPlayer1.SetAudioVolume(PasLibVlcPlayer1.GetAudioVolume()-10);
end;

procedure TframePasLibVlcMediaPlayer.SetVolumeUp10Click(Sender: TObject);
begin
  PasLibVlcPlayer1.SetAudioVolume(PasLibVlcPlayer1.GetAudioVolume()+10);
end;

procedure TframePasLibVlcMediaPlayer.SnapShotClick(Sender: TObject);
begin
  PasLibVlcPlayer1.SnapShot(ChangeFileExt(Application.ExeName, '.png'));
end;

procedure TframePasLibVlcMediaPlayer.TransPanel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LBAdd('Trans MouseDown(' + IntToStr(X) + ', ' + IntToStr(Y) + ')');
end;

procedure TframePasLibVlcMediaPlayer.ChAudioOutClick(Sender: TObject);
var
  adLst : TStringList;
  chAdForm : TSelectOutputDeviceForm;
  newAudioDevice : string;
  selIdx : Integer;
begin
  chAdForm := TSelectOutputDeviceForm.Create(SELF);
  try
    chAdForm.OutputDevicesLB.Clear;
    adLst := PasLibVlcPlayer1.GetAudioOutputDeviceEnum(TRUE);
    chAdForm.OutputDevicesLB.Items.AddStrings(adLst);
    chAdForm.OutputDevicesLB.ItemIndex := -1;
    for selIdx := 0 to chAdForm.OutputDevicesLB.Items.Count - 1 do
    begin
      newAudioDevice := chAdForm.OutputDevicesLB.Items.Strings[selIdx];
      if PasLibVlcPlayer1.LastAudioOutputDeviceId = Copy(newAudioDevice, 1, Pos('|', newAudioDevice) - 1) then
      begin
        chAdForm.OutputDevicesLB.ItemIndex := selIdx;
        break;
      end;
    end;
    if (chAdForm.ShowModal = mrOK) then
    begin
      newAudioDevice := chAdForm.OutputDevicesLB.Items.Strings[chAdForm.OutputDevicesLB.ItemIndex];
      newAudioDevice := Copy(newAudioDevice, 1, Pos('|', newAudioDevice) - 1);
      LBAdd('Change Audio Device: ' + newAudioDevice);
      PasLibVlcPlayer1.SetAudioOutputDevice(newAudioDevice);
    end;
    adLst.Free;
  finally
    chAdForm.Free;
  end;
end;

constructor TframePasLibVlcMediaPlayer.Create(AOwner: TComponent);
begin
  inherited;


  FormCreate(Self);
end;

procedure TframePasLibVlcMediaPlayer.DeInterlaceBtnClick(Sender: TObject);
begin
  if (PasLibVlcPlayer1.DeInterlaceFilter = deOFF) then
  begin
    PasLibVlcPlayer1.DeinterlaceMode   := dmX;
    PasLibVlcPlayer1.DeInterlaceFilter := deON;
    LBAdd('DeInterlaceFilter = ON, ' + PasLibVlcPlayer1.DeinterlaceModeName);
  end
  else
  begin
    PasLibVlcPlayer1.DeInterlaceFilter := deOFF;
    LBAdd('DeInterlaceFilter = OFF');
  end;  
end;

destructor TframePasLibVlcMediaPlayer.Destroy;
var
  AAction:TCloseAction;
begin
  AAction:=TCloseAction.caFree;
  Self.FormClose(Self,AAction);
  inherited;
end;

procedure TframePasLibVlcMediaPlayer.DoResize();
begin
  MrlEdit.Width := PR.Left - 16;
  LB.Width := MrlEdit.Width;
  LB.Top := ClientHeight - 8 - LB.Height;
  ProgPanel.Top := LB.Top - 8 - ProgPanel.Height;
  ProgPanel.Width := LB.Width;
  
  PasLibVlcPlayer1.Width := LB.Width;
  PasLibVlcPlayer1.Height := Lb.Top - MrlEdit.Top - MrlEdit.Height - 16 - ProgPanel.Height - 8;
end;


procedure TframePasLibVlcMediaPlayer.DoReturnFrame(AFromFrame: TFrame);
begin

end;

function TframePasLibVlcMediaPlayer.GetPostValue(ASetting: TFieldControlSetting;
  APageDataDir: String; ASetRecordFieldValueIntf: ISetRecordFieldValue;
  var AErrorMessage: String): Variant;
begin
  Result:=FValue;
end;

//function TframePasLibVlcMediaPlayer.GetProp(APropName: String): Variant;
//begin
//  Result:='';
//end;

function TframePasLibVlcMediaPlayer.GetPropJsonStr: String;
begin
  Result:='';
end;

function TframePasLibVlcMediaPlayer.LoadFromFieldControlSetting(
  ASetting: TFieldControlSetting;AFieldControlSettingMap:TObject): Boolean;
begin

  Result:=True;
end;

procedure TframePasLibVlcMediaPlayer.SetControlValue(
  ASetting: TFieldControlSetting; APageDataDir, AImageServerUrl: String;
  AValue: Variant; AValueCaption: String;
  AGetDataIntfResultFieldValueIntf: IGetDataIntfResultFieldValue);
var
  AFilePath:String;
begin
  //视频文件的相对路径或者URL
  FValue:=AValue;

  AFilePath:=APageDataDir+AValue;
  Self.MrlEdit.Text:=AFilePath;
  if not FileExists(AFilePath) then
  begin
    if PasLibVlcPlayer1.IsPlay then
    begin
      Self.PasLibVlcPlayer1.Stop;
    end;
    Exit;
  end;
  //C:\MyFiles\OrangeUIProduct\内容爬虫\python_project\client\Upload\content_video
  //C:\MyFiles\OrangeUIProduct\内容爬虫\python_project\client\Upload\content_pic\rTCnOflVugKRBRSR.mp4'
//  Self.Close;
//  Self.Auto
//  Self.FileName:=APageDataDir+AValue;
//  Self.Open;
  if FFilePath<>AFilePath then
  begin
    FFilePath:=AFilePath;
//    PlayClick(nil);
    //Self.PasLibVlcPlayer1.Play(AFilePath);
  end;
end;

//procedure TframePasLibVlcMediaPlayer.SetProp(APropName: String;
//  APropValue: Variant);
//begin
//
//end;

procedure TframePasLibVlcMediaPlayer.SetPropJsonStr(AJsonStr: String);
begin
  //

end;




initialization
  GetGlobalFrameworkComponentTypeClasses.Add('media_player_frame',TframePasLibVlcMediaPlayer,'媒体播放器');



end.
