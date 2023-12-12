unit uIOSViewController;

interface



uses
  Classes,
  FMX.Forms,
  Types,
  FMX.Controls,
  FMX.Types,

  {$IFDEF IOS}
  iOSapi.UIKit,
  FMX.ZOrder.iOS,
  FMX.Platform.iOS,
  uBaseViewController,
  {$ENDIF}



  FMX.Platform;




  {$IFDEF IOS}

type
  TIOSViewController=class(TBaseViewController)
  private
    FUIView:UIView;
    [Weak] FControl: TControl;
  public
    constructor Create(AControl:TControl;AUIView:UIView);
    destructor Destroy; override;
  public
    //œ‘ æ
    procedure Show;
    //œ‘ æ
    procedure Hide;
    //
    procedure UpdateContentFromControl;
  end;


{$ENDIF}

implementation


  {$IFDEF IOS}

{ TIOSViewController }


constructor TIOSViewController.Create(AControl:TControl;AUIView:UIView);
begin
  FControl:=AControl;
  FUIView:=AUIView;
end;

destructor TIOSViewController.Destroy;
begin
  FControl:=nil;
  FUIView:=nil;
  inherited;
end;

procedure TIOSViewController.Hide;
begin
  if (FUIView <> nil) and (not FUIView.isHidden) then
    FUIView.setHidden(True);
end;


procedure TIOSViewController.Show;
begin
  if (FUIView <> nil) and (FUIView.isHidden) then
    FUIView.setHidden(False);
end;

procedure TIOSViewController.UpdateContentFromControl;
var
  Form: TCommonCustomForm;
  {$IFDEF IOS}
  ZOrderManager: TiOSZOrderManager;
  {$ELSE}
  View: INativeView;
  Bounds: TRectF;
  {$ENDIF}
begin

    if FUIView <> nil then
    begin
      if (FControl <> nil) and not (csDesigning in FControl.ComponentState) and
         (FControl.Root is TCommonCustomForm) then
      begin
        Form := TCommonCustomForm(FControl.Root);
        {$IFDEF IOS}
        ZOrderManager := WindowHandleToPlatform(Form.Handle).ZOrderManager;

            {$IF RTLVersion>=33}// 10.3+
            ZOrderManager.AddOrSetLink(FControl, FUIView, nil);
            ZOrderManager.UpdateOrderAndBounds(FControl);
            {$ELSE}
            ZOrderManager.UpdateOrderAndBounds(FControl, FUIView);
            {$ENDIF}

        {$ELSE}


        Bounds := TRectF.Create(0,0,FControl.Width,FControl.Height);
        Bounds.Fit(FControl.AbsoluteRect);
        View := WindowHandleToPlatform(Form.Handle).View;
        View.addSubview(FUIView);
        if SameValue(Bounds.Width, 0) or SameValue(Bounds.Height, 0) then
          FUIView.setHidden(True)
        else
        begin
          TNativeWebViewHelper.SetBounds(FUIView, Bounds, View.bounds.size.height);
          FUIView.setHidden(not FControl.ParentedVisible);
        end;


        {$ENDIF}
      end
      else
        FUIView.setHidden(True);
    end;


end;


{$ENDIF}

end.
