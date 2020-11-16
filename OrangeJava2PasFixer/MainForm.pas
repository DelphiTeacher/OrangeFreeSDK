unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  UnitOrangeUIJava2PasFixer,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TJavaInterfaceType=class
  public
    InterfaceName:String;
    ParentName:String;
    CodeLines:TStringList;
    IsBadInterface:Boolean;
  public
    constructor Create;
    destructor Destroy;override;
  end;



  TfrmMain = class(TForm)
    memOrigin: TMemo;
    Panel1: TPanel;
    memConverted: TMemo;
    btnConvert: TButton;
    procedure btnConvertClick(Sender: TObject);
    procedure memOriginDblClick(Sender: TObject);
    procedure memConvertedDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

//function IsBadInterfaceName(AInterfaceName:String):Boolean;
//var
//  AEndIndex:Integer;
//  AInterfaceNameSuffix:String;
//begin
//  Result:=False;
//  if Length(AInterfaceName)=2 then  //JA,JB
//  begin
//    Result:=True;
//  end
//  else if Length(AInterfaceName)=3 then  //JAA,JBA
//  begin
//    Result:=True;
//  end
//  else if Pos('_',AInterfaceName)=3 then  //JA_a,JB_1
//  begin
//    Result:=True;
//  end
//  else
//  begin
//
//    //JLocationClientOption_1 = interface;
//    AEndIndex:=Pos('_',AInterfaceName,1);
//    while Pos('_',AInterfaceName,AEndIndex+1)>0 do
//    begin
//      AEndIndex:=Pos('_',AInterfaceName,AEndIndex+1);
//    end;
//    if AEndIndex>0 then
//    begin
//      AInterfaceNameSuffix:=Copy(AInterfaceName,AEndIndex+1,MaxInt);
//      if (AInterfaceNameSuffix>='a') and (AInterfaceNameSuffix<='z')
//        or (AInterfaceNameSuffix>='1') and (AInterfaceNameSuffix<='9') then
//      begin
//        Result:=True;
//      end;
//    end;
//
//  end;
//
//end;


procedure TfrmMain.btnConvertClick(Sender: TObject);
var
//  I,J: Integer;
//  ACodeLine:String;
//  AStartIndex:Integer;
//  AEndIndex:Integer;
//  AInterfaceName:String;
//  AInterfaceParentName:String;
//  AIsInterfaceOneLineEnd:Boolean;
//  AIsBadInterface:Boolean;
//  AInterfaceNameSuffix:String;
  AOriginCodes:TStringList;
//
//  ADeclaredTypes:TStringList;
////  ADeclaredTypeParents:TStringList;
//
//  AJavaInterfaceTypeList:TList;
//
//  ABeginCodes:TStringList;
//  AIsBegin:Boolean;
//  AJavaInterfaceType:TJavaInterfaceType;
//  BJavaInterfaceType:TJavaInterfaceType;
//  AIsFoundParent:Boolean;
begin
  AOriginCodes:=TStringList.Create;
  AOriginCodes.Assign(Self.memOrigin.Lines);
  ConvertFix(AOriginCodes,
            True,
            True,
            True,
            False
            );
  Self.memConverted.Lines.Assign(AOriginCodes);
  AOriginCodes.Free;

//  AJavaInterfaceTypeList:=TList.Create;
//  ABeginCodes:=TStringList.Create;
//
//  ADeclaredTypes:=TStringList.Create;
////  //父类型
////  ADeclaredTypeParents:=TStringList.Create;
//
//
//  AOriginCodes:=TStringList.Create;
//  AOriginCodes.Assign(Self.memOrigin.Lines);
////  Self.memOrigin.Lines.BeginUpdate;
//
//
//  AIsBegin:=True;
//  I:=0;
//  while I < AOriginCodes.Count do
//  begin
//    ACodeLine:=Trim(AOriginCodes[I]);
//    AIsBadInterface:=False;
//
//
//    //  JListPreloaderClass = interface(JObjectClass)
//    //  ['{3AB64FC0-57B6-485C-A9EA-58499EDC4D67}']
//    //    { static Property Methods }
//    //
//    //    { static Methods }
//    //    {class} function init(requestManager: JRequestManager; preloadModelProvider: JListPreloader_PreloadModelProvider; preloadDimensionProvider: JListPreloader_PreloadSizeProvider; maxPreload: Integer): JListPreloader; cdecl; //(Lcom/bumptech/glide/RequestManager;Lcom/bumptech/glide/ListPreloader$PreloadModelProvider;Lcom/bumptech/glide/ListPreloader$PreloadSizeProvider;I)V
//    //
//    //    { static Property }
//    //  end;
//    //
//    //  [JavaSignature('com/bumptech/glide/ListPreloader')]
//    //  JListPreloader = interface(JObject)
//    //  ['{9CC44C5B-A259-45F0-9DF1-546EA862B35F}']
//    //    { Property Methods }
//    //
//    //    { methods }
//    //    procedure onScrollStateChanged(absListView: JAbsListView; scrollState: Integer); cdecl; //(Landroid/widget/AbsListView;I)V
//    //    procedure onScroll(absListView: JAbsListView; firstVisible: Integer; visibleCount: Integer; totalCount: Integer); cdecl; //(Landroid/widget/AbsListView;III)V
//    //
//    //    { Property }
//    //  end;
//    //
//    //  TJListPreloader = class(TJavaGenericImport<JListPreloaderClass, JListPreloader>) end;
//
//
//    if AIsBegin then
//    begin
//      ABeginCodes.Add(AOriginCodes[I]);
//    end;
//
//
//    //是接口
//    AStartIndex:=Pos(' = interface',ACodeLine);
//    AIsInterfaceOneLineEnd:=Pos(' = interface;',ACodeLine)>0;
//
//
//    if (AStartIndex>0) then
//    begin
//        //有空格
//        //判断是接口还是类声明
//        //JListPreloader = interface(JObject)
//        AInterfaceName:=Copy(ACodeLine,1,AStartIndex-1);
//        AInterfaceParentName:='';
//        if Copy(AInterfaceName,Length(AInterfaceName)-5+1,5)='Class' then
//        begin
//          //JListPreloaderClass = interface(JObjectClass)
//          AInterfaceName:=Copy(AInterfaceName,1,Length(AInterfaceName)-5);
//          AInterfaceParentName:=Copy(ACodeLine,
//                                      AStartIndex+Length(' = interface')+1,
//                                      Length(ACodeLine)-AStartIndex-Length(' = interface')-1);
//          //JObjectClass)
//          AEndIndex:=Pos(')',AInterfaceParentName);
//          //JObjectClass
//          AInterfaceParentName:=Copy(AInterfaceParentName,1,AEndIndex-1);
//          //JObject
//          AInterfaceParentName:=Copy(AInterfaceParentName,1,Length(AInterfaceParentName)-5);
//
//            if AIsBegin then
//            begin
//              if ABeginCodes.Count>0 then
//              begin
//                ABeginCodes.Delete(ABeginCodes.Count-1);
//              end;
//              AIsBegin:=False;
//            end;
//        end;
//
//
//
//        //以J开始
//        if Copy(AInterfaceName,1,1)='J' then
//        begin
//            //是否是混淆过的类名,Ja,Jb,Jc等
//            AIsBadInterface:=IsBadInterfaceName(AInterfaceName);
//
////            if AIsBadInterface then
////            begin
////                //注释掉
////                AOriginCodes[I]:='//'+AOriginCodes[I];
//
//
//
//
//                if AIsInterfaceOneLineEnd then
//                begin
//                    //单行接口预声明，直接注释就完了
//
//                end
//                else
//                begin
//                    //不是单行的预声明
////                    if ADeclaredTypes.IndexOf(AInterfaceName)=-1 then
////                    begin
////                      ADeclaredTypes.Add(AInterfaceName);
////                    end;
//
//
//                    //正常声明
//                    AJavaInterfaceType:=TJavaInterfaceType.Create;
//                    AJavaInterfaceTypeList.Add(AJavaInterfaceType);
//
//                    AJavaInterfaceType.InterfaceName:=AInterfaceName;
//                    AJavaInterfaceType.ParentName:=AInterfaceParentName;
//                    AJavaInterfaceType.IsBadInterface:=AIsBadInterface;
//
//                    if (I-1>0) and (Pos('[JavaSignature',AOriginCodes[I-1])>0) then
//                    begin
////                      AOriginCodes[I-1]:='//'+AOriginCodes[I-1];
//                      AJavaInterfaceType.CodeLines.Add(AOriginCodes[I-1]);
//                    end;
//                    AJavaInterfaceType.CodeLines.Add(AOriginCodes[I]);
//
//
//                    //多行接口
//                    repeat
//                      Inc(I);
//                      ACodeLine:=Trim(AOriginCodes[I]);
////                      AOriginCodes[I]:='//'+AOriginCodes[I];
//                      AJavaInterfaceType.CodeLines.Add(AOriginCodes[I]);
//
////                    until ACodeLine='end;';
//                      //声明结束
//                    //  TJListPreloader = class(TJavaGenericImport<JListPreloaderClass, JListPreloader>) end;
//                    until Copy(ACodeLine,1,Length(AInterfaceName)+1)='T'+AInterfaceName;
//
//
//                end;
////            end
////            else
////            begin
////                if not AIsInterfaceOneLineEnd then
////                begin
////
////                    //不是单行的预声明
////                    if ADeclaredTypes.IndexOf(AInterfaceName)=-1 then
////                    begin
////                      ADeclaredTypes.Add(AInterfaceName);
////                    end;
////
////                end;
////
////            end;
//
//
//        end;
//
//    end;
//
//
//
////    //是类
////    //TJListPreloader = class(TJavaGenericImport<JListPreloaderClass, JListPreloader>) end;
////    AStartIndex:=Pos(' = class',ACodeLine);
////    if (AStartIndex>0) then
////    begin
////      //有空格
////      //判断是接口还是类声明
//////      TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;
////      AInterfaceName:=Copy(ACodeLine,2,AStartIndex-2);
////
////      AIsBadInterface:=IsBadInterfaceName(AInterfaceName);
////
////      if AIsBadInterface then
////      begin
////        AOriginCodes[I]:='//'+AOriginCodes[I];
////      end;
////
////    end;
//
//
//    Inc(I);
//  end;
//
//
//
//  //将声明的顺序调整过来
//  I:=0;
//  while I<=AJavaInterfaceTypeList.Count-2 do
//  begin
//      //找到所有的声明类型
//      AJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[I]);
//
//      ADeclaredTypes.Add(AJavaInterfaceType.InterfaceName);
//
//      if AJavaInterfaceType.ParentName<>'JObject' then
//      begin
//
//          //父类不为JObject才需要处理
//          AIsFoundParent:=False;
//          for J := I+1 to AJavaInterfaceTypeList.Count-1 do
//          begin
//              BJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[J]);
//              if AJavaInterfaceType.ParentName=BJavaInterfaceType.InterfaceName then
//              begin
//                  AIsFoundParent:=True;
//                  Break;
//              end;
//          end;
//          if AIsFoundParent then
//          begin
//            //把B移到A前面来
//            AJavaInterfaceTypeList.Delete(J);
//            AJavaInterfaceTypeList.Insert(I,BJavaInterfaceType);
//
//            if BJavaInterfaceType.ParentName<>'JObject' then
//            begin
//                //父类还需要处理
//                //父类是否之前就声明过
//                if ADeclaredTypes.IndexOf(BJavaInterfaceType.ParentName)<>-1 then
//                begin
//
//                end
//                else
//                begin
//                  //父类之前没有声明过,还在下面,要重新处理
//                  I:=I-1;
//                end;
//            end;
//
//          end;
//
//
//      end;
//
//      Inc(I);
//  end;
//
//
//
//
////  Self.memConverted.Lines.Assign(AOriginCodes);
//
//  Self.memConverted.Lines.BeginUpdate;
//  try
//    Self.memConverted.Lines.Assign(ABeginCodes);
//    Self.memConverted.Lines.Add('');
//    Self.memConverted.Lines.Add('');
//    for I := 0 to AJavaInterfaceTypeList.Count-1 do
//    begin
//      //找到所有的声明类型
//      AJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[I]);
//      if AJavaInterfaceType.IsBadInterface then
//      begin
//        for J := 0 to AJavaInterfaceType.CodeLines.Count-1 do
//        begin
//          AJavaInterfaceType.CodeLines[J]:=
//            '//'+AJavaInterfaceType.CodeLines[J];
//        end;
//      end;
//      Self.memConverted.Lines.AddStrings(AJavaInterfaceType.CodeLines);
//      Self.memConverted.Lines.Add('');
//    end;
//    Self.memConverted.Lines.Add('{$ENDIF}');
//    Self.memConverted.Lines.Add('');
//    Self.memConverted.Lines.Add('implementation');
//    Self.memConverted.Lines.Add('');
//    Self.memConverted.Lines.Add('end.');
//  finally
//    Self.memConverted.Lines.EndUpdate;
//  end;
//
//
//
////  Self.memConverted.Lines.AddStrings(ADeclaredTypes);
//
//
//
//  AOriginCodes.Free;
//  ADeclaredTypes.Free;
////  ADeclaredTypeParents.Free;
//  AJavaInterfaceTypeList.Free;
end;

procedure TfrmMain.memConvertedDblClick(Sender: TObject);
begin
  Self.memConverted.SelectAll;
end;

procedure TfrmMain.memOriginDblClick(Sender: TObject);
begin
  Self.memOrigin.SelectAll;
end;

{ TJavaInterfaceType }

constructor TJavaInterfaceType.Create;
begin
  CodeLines:=TStringList.Create;

end;

destructor TJavaInterfaceType.Destroy;
begin
  FreeAndNil(CodeLines);
  inherited;
end;

end.
