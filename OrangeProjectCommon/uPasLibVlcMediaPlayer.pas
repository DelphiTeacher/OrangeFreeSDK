unit uPasLibVlcMediaPlayer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  Forms,
//  Vcl.MPlayer,
  PasLibVlcClassUnit,
  PasLibVlcUnit,
  PasLibVlcPlayerUnit,

  uFileCommon,
  uBasePageStructure,
  uComponentType,
  uPageStructure,

  DateUtils;


type
  TPasLibVlcMediaPlayer=class(TPasLibVlcPlayer,IControlForPageFramework)
  protected
    FValue:String;
    FFilePath:String;
    //���ҳ���ܵĿؼ��ӿ�
    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;
    //��ȡ�������Զ�������
    function GetPropJsonStr:String;
    procedure SetPropJsonStr(AJsonStr:String);
    //��ȡ�ύ��ֵ,�ǲ��Ǵ��ڶ��ֵ
    function GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
                            var AErrorMessage:String):Variant;
    //����ֵ
    procedure SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;
                            AImageServerUrl:String;
                            AValue:Variant;AValueCaption:String;
                            //Ҫ���ö��ֵ,�����ֶεļ�¼
                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue
                            );
//    //��������
//    function GetProp(APropName:String):Variant;
//    procedure SetProp(APropName:String;APropValue:Variant);
    procedure DoReturnFrame(AFromFrame:TFrame);
  public
    constructor Create(AOwner:TComponent);override;
  end;



implementation




{ TPasLibVlcMediaPlayer }

constructor TPasLibVlcMediaPlayer.Create(AOwner: TComponent);
begin
  inherited;
  //��ʼVLC���·��
  Self.VLC.Path:=GetApplicationPath+'vlc-3.0.16-win32\';

end;

procedure TPasLibVlcMediaPlayer.DoReturnFrame(AFromFrame: TFrame);
begin

end;

function TPasLibVlcMediaPlayer.GetPostValue(ASetting: TFieldControlSetting;
  APageDataDir: String; ASetRecordFieldValueIntf: ISetRecordFieldValue;
  var AErrorMessage: String): Variant;
begin
  Result:=FValue;
end;

//function TPasLibVlcMediaPlayer.GetProp(APropName: String): Variant;
//begin
//  Result:='';
//end;

function TPasLibVlcMediaPlayer.GetPropJsonStr: String;
begin
  Result:='';
end;

function TPasLibVlcMediaPlayer.LoadFromFieldControlSetting(
  ASetting: TFieldControlSetting;AFieldControlSettingMap:TObject): Boolean;
begin

  Result:=True;
end;

procedure TPasLibVlcMediaPlayer.SetControlValue(
  ASetting: TFieldControlSetting; APageDataDir, AImageServerUrl: String;
  AValue: Variant; AValueCaption: String;
  AGetDataIntfResultFieldValueIntf: IGetDataIntfResultFieldValue);
var
  AFilePath:String;
begin
  FValue:=AValue;
  AFilePath:=APageDataDir+AValue;
  if not FileExists(AFilePath) then
  begin
    if IsPlay then
    begin
      Self.Stop;
    end;
    Exit;
  end;
  //C:\MyFiles\OrangeUIProduct\��������\python_project\client\Upload\content_video
  //C:\MyFiles\OrangeUIProduct\��������\python_project\client\Upload\content_pic\rTCnOflVugKRBRSR.mp4'
//  Self.Close;
//  Self.Auto
//  Self.FileName:=APageDataDir+AValue;
//  Self.Open;
  if FFilePath<>AFilePath then
  begin
    FFilePath:=AFilePath;
//    Self.Play(AFilePath);
  end;
end;

//procedure TPasLibVlcMediaPlayer.SetProp(APropName: String;
//  APropValue: Variant);
//begin
//
//end;

procedure TPasLibVlcMediaPlayer.SetPropJsonStr(AJsonStr: String);
begin
  //

end;



initialization
  GetGlobalFrameworkComponentTypeClasses.Add('media_player',TPasLibVlcMediaPlayer,'ý�岥����');

end.
