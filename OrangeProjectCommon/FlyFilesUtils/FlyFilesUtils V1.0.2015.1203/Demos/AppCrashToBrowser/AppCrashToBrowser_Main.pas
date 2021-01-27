unit AppCrashToBrowser_Main;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2015-08-14　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
{$IFDEF ANDROID}
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  FMX.Helpers.Android,
{$ENDIF ANDROID}
  FlyUtils.App.CrashHandler;

{$R *.fmx}

{$IFDEF ANDROID}
type
  {Class forward declarations}
  JTest = interface;//android.os.Object

  JTestClass = interface(IJavaClass)
    ['{D34DEFB1-0045-4BDF-80CC-AD90F0D62BF2}']
    {class} function init: JTest; cdecl;
  end;

  [JavaSignature('java/lang/Object')]
  JTest = interface(IJavaInstance)
    ['{D09105E4-3B4C-4B45-B567-47B27E479D2C}']
    procedure testtest; cdecl;
  end;
  TJTest = class(TJavaGenericImport<JTestClass, JTest>) end;

{$ENDIF ANDROID}

procedure TFormMain.Button1Click(Sender: TObject);
var
  AForm: TForm;
begin
  AForm := nil;
  AForm.Show;
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  AForm: TForm;
begin
{$IFDEF ANDROID}
  CallInUIThread(procedure begin
    AForm := nil;
    AForm.Show;
  end);
{$ENDIF ANDROID}
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
{$IFDEF ANDROID}
  CallInUIThread(procedure begin
    TJTest.JavaClass.init.testtest;
  end);
{$ENDIF ANDROID}
end;

end.
