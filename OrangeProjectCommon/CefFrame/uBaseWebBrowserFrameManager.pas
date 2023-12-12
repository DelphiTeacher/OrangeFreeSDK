unit uBaseWebBrowserFrameManager;

interface

uses
  SysUtils,
  BaseWebBrowserFrame,
  uBaseList;

type
  TBaseWebBrowserFrameItem=class
    FName:String;
    FFrame:TFrameBaseWebBrowser;
  end;

  TBaseWebBrowserFrameList=class(TBaseList)
  private
    function GetItem(Index: Integer): TBaseWebBrowserFrameItem;
  public
    procedure Add(AName:String;AFrame:TFrameBaseWebBrowser);
    procedure Remove(AFrame:TFrameBaseWebBrowser);
    procedure HideWithout(ABaseWebBrowserFrame:TFrameBaseWebBrowser);overload;
    procedure HideWithout(AName:String);overload;
    property Items[Index:Integer]:TBaseWebBrowserFrameItem read GetItem;default;
  end;


var
  GlobalWebBrowserFrameList:TBaseWebBrowserFrameList;

implementation

{ TBaseWebBrowserFrameList }

procedure TBaseWebBrowserFrameList.Add(AName: String;
  AFrame: TFrameBaseWebBrowser);
var
  AItem:TBaseWebBrowserFrameItem;
begin
  AItem:=TBaseWebBrowserFrameItem.Create;
  AItem.FName:=AName;
  AItem.FFrame:=AFrame;
  Inherited Add(AItem);
end;

function TBaseWebBrowserFrameList.GetItem(Index: Integer): TBaseWebBrowserFrameItem;
begin
  Result:=TBaseWebBrowserFrameItem(Inherited Items[Index]);
end;

procedure TBaseWebBrowserFrameList.HideWithout(AName: String);
var
  I: Integer;
begin
  for I := 0 to Count-1 do
  begin
    if Items[I].FName=AName then
    begin
      Items[I].FFrame.ShowBrowser;
    end
    else
    begin
      Items[I].FFrame.HideBrowser;
    end;

  end;


end;

procedure TBaseWebBrowserFrameList.Remove(AFrame: TFrameBaseWebBrowser);
var
  I: Integer;
begin
  for I := 0 to Count-1 do
  begin
    if Items[I].FFrame=AFrame then
    begin
      Self.Delete(I);
      Exit;
    end;
  end;
end;

procedure TBaseWebBrowserFrameList.HideWithout(ABaseWebBrowserFrame: TFrameBaseWebBrowser);
var
  I: Integer;
begin
  for I := 0 to Count-1 do
  begin
    if Items[I].FFrame=ABaseWebBrowserFrame then
    begin
      Items[I].FFrame.ShowBrowser;
    end
    else
    begin
      Items[I].FFrame.HideBrowser;
    end;

  end;

end;

initialization
  GlobalWebBrowserFrameList:=TBaseWebBrowserFrameList.Create;

finalization
  FreeAndNil(GlobalWebBrowserFrameList);


end.
