unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, System.IOUtils,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure MemoAdd(AText: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses FlyFmxUtils, FlyFilesUtils,
  FMX.Styles.Objects;

procedure TForm1.FormResize(Sender: TObject);
var
  TestStr: string;
  AP: TPointF;
begin
  Memo1.Lines.Clear;
{$IFDEF ANDROID}
  TestStr := FlyFilesUtils.GetScreenInches.ToString;
  MemoAdd('安卓专用 GetScreenInches：' + TestStr);
{$ENDIF}
  AP := GetScreenPixelsXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetScreenPixelsXY（屏幕像素）：' + TestStr);
  AP := GetScreenPixelsXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetScreenClientPixelsXY（屏幕可用区域像素）：' + TestStr);
  AP := GetScreenInchXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetScreenInchXY（屏幕英寸长宽）：' + TestStr);
  TestStr := FlyFmxUtils.GetScreenInches(Self).ToString;
  MemoAdd('GetScreenInches（屏幕对角线）：' + TestStr);
  AP := GetScreenDPIXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetScreenDPIXY（屏幕DPI/PPI）：' + TestStr);
  TestStr := GetScreenDPI(Self).ToString;
  MemoAdd('GetScreenDPI（屏幕统一DPI/PPI）：' + TestStr);
  MemoAdd('');

  AP := GetFormXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetFormXY（窗体的 高宽）：' + TestStr);
  AP := GetFormClientXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetFormClientXY（窗体的 可用高宽）：' + TestStr);
  MemoAdd('');

  TestStr := IScene(Self).GetSceneScale.ToString;
  MemoAdd('SceneScale：' + TestStr);
  TestStr := Canvas.Scale.ToString;
  MemoAdd('CanvasScale：' + TestStr);
  TestStr := TCustomStyleObject.ScreenScaleToStyleScale(IScene(Self).GetSceneScale).ToString;
  MemoAdd('StyleScale：' + TestStr);
  MemoAdd('');

  AP := GetFormPixelsXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetFormPixelsXY（窗体的像素高宽）：' + TestStr);
  AP := GetFormClientPixelsXY(Self);
  TestStr := 'X：' + AP.X.ToString + '  Y：' + AP.Y.ToString;
  MemoAdd('GetFormClientPixelsXY（窗体的像素可用高宽）：' + TestStr);
  MemoAdd('');
end;

procedure TForm1.MemoAdd(AText: string);
begin
  Memo1.Lines.Add(AText);
  Memo1.GoToTextEnd;
  Application.ProcessMessages;
end;

end.
