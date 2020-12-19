unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  VideoFrame,
  VideoForm,
  WebbrowserControlUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    btnOK: TButton;
    cmbMonitor: TComboBox;
    Label1: TLabel;
    cmbVideo: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FVideoFrameList:TList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnOKClick(Sender: TObject);
var
  AVideoForm:TFrmVideo;
begin
  //Self.Left:=Screen.Monitors[Self.ComboBox1.ItemIndex].Left;
  AVideoForm:=TFrmVideo.Create(Self);
  AVideoForm.Show;
  //要Show之后才能调整位置
  AVideoForm.Left:=Screen.Monitors[Self.cmbMonitor.ItemIndex].Left;
  AVideoForm.Load(TFrameVideo(FVideoFrameList[Self.cmbVideo.ItemIndex]).lblCaption.Caption,
                    TFrameVideo(FVideoFrameList[Self.cmbVideo.ItemIndex]).FVideoFilePath);
  AVideoForm.WindowState:=wsMaximized;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  I: Integer;
  AVideoFrame:TFrameVideo;
begin
  WebbrowserControlUtils.SetIEFeatureModeCorrespond;

  FVideoFrameList:=TList.Create;

  //加载显示器到下拉框
  Self.cmbMonitor.Items.Clear;
  for I := 0 to Screen.MonitorCount-1 do
  begin
    Self.cmbMonitor.Items.Add(IntToStr(Screen.Monitors[I].MonitorNum+1));
  end;
  Self.cmbMonitor.ItemIndex:=0;


  Self.cmbVideo.Items.Clear;
  for I := 0 to 3 do
  begin
    Self.cmbVideo.Items.Add(IntToStr(I));

    //创建多个视频窗口
    AVideoFrame:=TFrameVideo.Create(Self);
    AVideoFrame.Parent:=Self.GridPanel1;
    AVideoFrame.Visible:=True;
    AVideoFrame.Align:=alClient;
    AVideoFrame.Load(IntToStr(I),ExtractFilePath(Application.ExeName)+IntToStr(I)+'.mp4');
    AVideoFrame.Name:='VideoFrame'+IntToStr(I);
    FVideoFrameList.Add(AVideoFrame);
  end;
  Self.cmbVideo.ItemIndex:=0;


end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FVideoFrameList.Free;
end;

end.
