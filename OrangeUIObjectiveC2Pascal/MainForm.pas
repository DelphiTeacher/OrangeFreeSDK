unit MainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  StrUtils,

  uOCParseToPascal,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    memOCCodeLines: TMemo;
    btnConvertOCHeaderFile: TButton;
    Panel1: TPanel;
    edtStaticLibPath: TEdit;
    lblStaticLibPath: TLabel;
    pnlButtons: TPanel;
    btnConvertOCProcedure: TButton;
    btnConvertOCProtocol: TButton;
    btnConvertOCProperty: TButton;
    btnConvertClass: TButton;
    btnConvertEnum: TButton;
    btnConvertAnsiCProcedure: TButton;
    edtUnitNamePrefix: TEdit;
    Label3: TLabel;
    btnConvertTypedef: TButton;
    btnConvertStruct: TButton;
    memODCodeLines: TMemo;
    Label1: TLabel;
    edtUnitName: TEdit;
    Label2: TLabel;
    edtUnitNameSuffix: TEdit;
    Label4: TLabel;
    lblUnitName: TLabel;
    btnSaveToFile: TButton;
    OpenDialog1: TOpenDialog;
    chkIsAutoNameLibInc: TCheckBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    edtStaticLibPathIncContent: TEdit;
    edtStaticLibFileName: TEdit;
    memNeedConvertFilePath: TListBox;
    Button2: TButton;
    btnClear: TButton;
    procedure FormResize(Sender: TObject);
    procedure btnConvertOCHeaderFileClick(Sender: TObject);
    procedure memOCCodeLinesDblClick(Sender: TObject);
    procedure memODCodeLinesDblClick(Sender: TObject);
    procedure btnConvertOCProcedureClick(Sender: TObject);
    procedure btnConvertOCProtocolClick(Sender: TObject);
    procedure btnConvertOCPropertyClick(Sender: TObject);
    procedure btnConvertClassClick(Sender: TObject);
    procedure btnConvertEnumClick(Sender: TObject);
    procedure btnConvertImportHeaderClick(Sender: TObject);
    procedure btnConvertAnsiCProcedureClick(Sender: TObject);
    procedure btnConvertTypedefClick(Sender: TObject);
    procedure btnConvertStructClick(Sender: TObject);
    procedure btnConvertToUnitClick(Sender: TObject);
    procedure edtUnitNameChange(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memNeedConvertFilePathDblClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadFile(AFilePath:String);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


procedure TfrmMain.btnConvertClassClick(Sender: TObject);
var
  I: Integer;
  AOCClassStruct:TOCClassStruct;
begin
  //ת������
  Self.memODCodeLines.Lines.Clear;
  AOCClassStruct:=TOCClassStruct.Create;
  AOCClassStruct.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
  Self.memODCodeLines.Lines.AddStrings(AOCClassStruct.GenerateODCodeLines);
  AOCClassStruct.Free;
end;

procedure TfrmMain.btnConvertOCHeaderFileClick(Sender: TObject);
var
  AOCHeaderFile:TOCHeaderFile;
begin
  AOCHeaderFile:=TOCHeaderFile.Create;
  AOCHeaderFile.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
  Self.memODCodeLines.Lines.Assign(AOCHeaderFile.GenerateODCodeLines);
  AOCHeaderFile.Free;
end;

procedure TfrmMain.btnConvertOCProcedureClick(Sender: TObject);
var
  I: Integer;
  AOCProcedureStruct:TOCProcedureStruct;
begin
  //ת������
  Self.memODCodeLines.Lines.Clear;
  AOCProcedureStruct:=TOCProcedureStruct.Create;

//  memOCCodeLines.Lines.Add();

  for I := 0 to Self.memOCCodeLines.Lines.Count-1 do
  begin
    AOCProcedureStruct.ParseOCCodeLine(Self.memOCCodeLines.Lines[I]);
    Self.memODCodeLines.Lines.AddStrings(AOCProcedureStruct.PreDatatypeDeclareStringList);
    Self.memODCodeLines.Lines.AddStrings(AOCProcedureStruct.GenerateODCodeLines);
  end;
  AOCProcedureStruct.Free;
end;

procedure TfrmMain.btnConvertOCPropertyClick(Sender: TObject);
var
  I: Integer;
  AOCPropertyStruct:TOCPropertyStruct;
begin
  //ת������
  Self.memODCodeLines.Lines.Clear;


//  //����
//  memOCCodeLines.Lines.Add('@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;');
//  memOCCodeLines.Lines.Add('@property(nonatomic, getter=isBuildingsEnabled) BOOL buildingsEnabled;');
//  memOCCodeLines.Lines.Add('@property (nonatomic, strong) id <BMKAnnotation> annotation;');
//  memOCCodeLines.Lines.Add('@property (nonatomic, getter=isDraggable) BOOL draggable __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2);');
//  memOCCodeLines.Lines.Add('@property (nonatomic, strong) NSArray<SuperPlayerUrl *> *multiVideoURLs;');


  for I := 0 to Self.memOCCodeLines.Lines.Count-1 do
  begin
    AOCPropertyStruct:=TOCPropertyStruct.Create;
    AOCPropertyStruct.ParseOCCodeLine(Self.memOCCodeLines.Lines[I]);
    Self.memODCodeLines.Lines.AddStrings(AOCPropertyStruct.NoteLines);
    Self.memODCodeLines.Lines.AddStrings(AOCPropertyStruct.PreDatatypeDeclareStringList);
    Self.memODCodeLines.Lines.AddStrings(AOCPropertyStruct.GenerateODCodeLines);
    AOCPropertyStruct.Free;
  end;
end;

procedure TfrmMain.btnConvertOCProtocolClick(Sender: TObject);
var
  AOCProtocolStruct:TOCProtocolStruct;
begin
  //ת��Э����
  Self.memODCodeLines.Lines.Clear;
  AOCProtocolStruct:=TOCProtocolStruct.Create;
  AOCProtocolStruct.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
  Self.memODCodeLines.Lines.AddStrings(AOCProtocolStruct.GenerateODCodeLines);
  AOCProtocolStruct.Free;
end;

procedure TfrmMain.btnConvertTypedefClick(Sender: TObject);
var
  I: Integer;
  AOCTypedefStruct:TOCTypedefStruct;
begin
  //ת����������
  Self.memODCodeLines.Lines.Clear;
  AOCTypedefStruct:=TOCTypedefStruct.Create;
  for I := 0 to Self.memOCCodeLines.Lines.Count-1 do
  begin
    AOCTypedefStruct.ParseOCCodeLine(Self.memOCCodeLines.Lines[I]);
    Self.memODCodeLines.Lines.AddStrings(AOCTypedefStruct.PreDatatypeDeclareStringList);
    Self.memODCodeLines.Lines.AddStrings(AOCTypedefStruct.GenerateODCodeLines);
  end;
  AOCTypedefStruct.Free;
end;

procedure TfrmMain.btnSaveToFileClick(Sender: TObject);
var
  I: Integer;
  AOCHeaderFile:TOCHeaderFile;
  AFrameworkLibIncFile:TStringList;
begin
  for I := 0 to memNeedConvertFilePath.Items.Count-1 do
  begin
      OutputDebugString(PWideChar('frmMain.btnSaveToFileClick '+memNeedConvertFilePath.Items[I]));

      //��һ���ļ�ֱ�Ӵ�Memo�л�ȡ
      if I>0 then
      begin
        Self.memOCCodeLines.Lines.LoadFromFile(memNeedConvertFilePath.Items[I],TEncoding.UTF8);
      end;



      Self.edtUnitName.Text:=ExtractFileName(memNeedConvertFilePath.Items[I]);
      Self.edtUnitName.Text:=ReplaceStr(Self.edtUnitName.Text,'+','_');


      //��ȡ�����յ��ļ���,����ǰ׺��׺
      if LowerCase(Copy(Self.edtUnitName.Text,Length(Self.edtUnitName.Text)-1,2))='.h' then
      begin
        Self.edtUnitName.Text:=Copy(Self.edtUnitName.Text,1,Length(Self.edtUnitName.Text)-2);
      end;




      //����
      AOCHeaderFile:=TOCHeaderFile.Create;
      //����
      AOCHeaderFile.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
      //����
      Self.memODCodeLines.Lines.Assign(
                    AOCHeaderFile.GetUnitCodeLines(Self.edtUnitName.Text,
                                                  Self.edtStaticLibPath.Text,
                                                  Self.edtUnitNamePrefix.Text,
                                                  Self.edtUnitNameSuffix.Text)
                                      );
      //����
      Self.memODCodeLines.Lines.SaveToFile(
                      ExtractFilePath(memNeedConvertFilePath.Items[I])
                      +Self.lblUnitName.Caption
                      );
      AOCHeaderFile.Free;




      if (I=0) then
      begin
        if Self.edtStaticLibFileName.Text<>'' then
        begin
          //����FrameworkLibPath_***.inc
          AFrameworkLibIncFile:=TStringList.Create;
          AFrameworkLibIncFile.Add(Self.edtStaticLibPathIncContent.Text);
          AFrameworkLibIncFile.SaveToFile(
                          ExtractFilePath(memNeedConvertFilePath.Items[I])
                          +Self.edtStaticLibFileName.Text
                          );
        end;

      end;

  end;

end;

procedure TfrmMain.Button2Click(Sender: TObject);
//var
//  AIndex:Integer;
//  AIndex1:Integer;
//  AFrameworkName:String;
begin
  if Self.OpenDialog1.Execute then
  begin
    Self.memNeedConvertFilePath.Items.Assign(OpenDialog1.Files);
    Self.memNeedConvertFilePath.Items.SaveToFile('NeedConvertFilePaths.txt');


    //�Զ����ص�һ���ļ�
    LoadFile(OpenDialog1.FileName);




//    Self.memOCCodeLines.Lines.LoadFromFile(OpenDialog1.FileName,TEncoding.UTF8);
//    Self.edtUnitName.Text:=ExtractFileName(OpenDialog1.FileName);
//
//
//    if LowerCase(Copy(Self.edtUnitName.Text,Length(Self.edtUnitName.Text)-1,2))='.h' then
//    begin
//      Self.edtUnitName.Text:=Copy(Self.edtUnitName.Text,1,Length(Self.edtUnitName.Text)-2);
//    end;
//
//
//    AIndex:=Pos('.framework',Self.OpenDialog1.FileName);
//    if (Self.chkIsAutoNameLibInc.Checked)
//      and (AIndex>0) then
//    begin
//
//        AFrameworkName:=Copy(Self.OpenDialog1.FileName,1,AIndex-1);
//        AIndex:=0;
//        while Pos('\',AFrameworkName,AIndex+1)>0 do
//        begin
//          AIndex:=Pos('\',AFrameworkName,AIndex+1);
//        end;
//        AFrameworkName:=Copy(AFrameworkName,AIndex+1,MaxInt);
//
//
//        //ȡ·������****.framework��Ŀ¼
//        //���ɵ�unit����Ŀ¼
//        Self.edtStaticLibFileName.Text:=
//            'FrameworkDylibPath_'+AFrameworkName+'.inc';
//        Self.edtStaticLibPath.Text:=
//            '{$I '+Self.edtStaticLibFileName.Text+'}';
//        Self.edtStaticLibPathIncContent.Text:=
//            ''''+AFrameworkName+'.framework'+'\'+AFrameworkName+'''';
//
//    end;

  end;
end;

procedure TfrmMain.edtUnitNameChange(Sender: TObject);
begin
  if Trim(Self.edtUnitName.Text)<>'' then
  begin
    //����ǰ׺��׺
    Self.lblUnitName.Caption:=
        Self.edtUnitNamePrefix.Text
          +ReplaceStr(Self.edtUnitName.Text,'+','_')
          +Self.edtUnitNameSuffix.Text+'.pas';
  end;
end;

procedure TfrmMain.btnConvertStructClick(Sender: TObject);
var
  AOCStructStruct:TOCStructStruct;
begin
  //ת��ö��
  Self.memODCodeLines.Lines.Clear;
  AOCStructStruct:=TOCStructStruct.Create;
  AOCStructStruct.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
  Self.memODCodeLines.Lines.AddStrings(AOCStructStruct.GenerateODCodeLines);
  AOCStructStruct.Free;
end;

procedure TfrmMain.btnConvertToUnitClick(Sender: TObject);
//var
//  I: Integer;
//  AOCHeaderFile:TOCHeaderFile;
begin
//  AOCHeaderFile:=TOCHeaderFile.Create;
//  AOCHeaderFile.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
//  Self.memODCodeLines.Lines.Assign(AOCHeaderFile.GetUnitCodeLines(Self.edtUnitName.Text,
//                                                                  Self.edtStaticLibPath.Text,
//                                                                  Self.edtUnitNamePrefix.Text,
//                                                                  Self.edtUnitNameSuffix.Text));
//  AOCHeaderFile.Free;
end;

procedure TfrmMain.btnConvertImportHeaderClick(Sender: TObject);
var
  I: Integer;
  AOCImportHeaderStruct:TOCImportHeaderStruct;
begin
  //ת������ͷ�ļ�
  Self.memODCodeLines.Lines.Clear;
  AOCImportHeaderStruct:=TOCImportHeaderStruct.Create;
  for I := 0 to Self.memOCCodeLines.Lines.Count-1 do
  begin
    AOCImportHeaderStruct.ParseOCCodeLine(Self.memOCCodeLines.Lines[I]);
    Self.memODCodeLines.Lines.AddStrings(AOCImportHeaderStruct.GenerateODCodeLines);
  end;
  AOCImportHeaderStruct.Free;

end;

procedure TfrmMain.btnConvertEnumClick(Sender: TObject);
var
  AOEnumStruct:TOCEnumStruct;
begin
  //ת��ö��
  Self.memODCodeLines.Lines.Clear;
  AOEnumStruct:=TOCEnumStruct.Create;
  AOEnumStruct.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
  Self.memODCodeLines.Lines.AddStrings(AOEnumStruct.GenerateODCodeLines);
  AOEnumStruct.Free;
end;

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  Self.memOCCodeLines.Clear;
end;

procedure TfrmMain.btnConvertAnsiCProcedureClick(Sender: TObject);
var
  ACProcedureStruct:TCProcedureStruct;
begin
  //ת����׼C����
  Self.memODCodeLines.Lines.Clear;
  ACProcedureStruct:=TCProcedureStruct.Create;
  ACProcedureStruct.ParseObjectiveCCodeLines(Self.memOCCodeLines.Lines);
  Self.memODCodeLines.Lines.AddStrings(ACProcedureStruct.GenerateODCodeLines);
  ACProcedureStruct.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if FileExists('NeedConvertFilePaths.txt') then
  begin
    Self.memNeedConvertFilePath.Items.LoadFromFile('NeedConvertFilePaths.txt');
  end;


//  if Not DirectoryExists('E:\MyFiles\') then
//  begin
//    Self.pnlButtons.Visible:=False;
//    Self.btnSaveToFile.Visible:=False;
//    Self.OpenDialog1.Options:=Self.OpenDialog1.Options-[ofAllowMultiSelect];
//  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Self.memOCCodeLines.Width:=Self.ClientWidth div 2;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
//  if FormatDateTime('YYYY-MM-DD',Now)>'2018-04-01' then
//  begin
//    Self.Panel1.Enabled:=False;
//    ShowMessage('�����ѹ��ڣ����QQȺ670563729��ȡ���°汾!');
//  end;
end;

procedure TfrmMain.LoadFile(AFilePath: String);
var
  AIndex:Integer;
  AIndex1:Integer;
  AFrameworkName:String;
begin

    Self.memOCCodeLines.Lines.LoadFromFile(AFilePath,TEncoding.UTF8);
    Self.edtUnitName.Text:=ExtractFileName(AFilePath);
    Self.edtUnitName.Text:=ReplaceStr(Self.edtUnitName.Text,'+','_');


    if LowerCase(Copy(Self.edtUnitName.Text,Length(Self.edtUnitName.Text)-1,2))='.h' then
    begin
      Self.edtUnitName.Text:=Copy(Self.edtUnitName.Text,1,Length(Self.edtUnitName.Text)-2);
    end;


    AIndex:=Pos('.framework',AFilePath);
    if (Self.chkIsAutoNameLibInc.Checked)
      and (AIndex>0) then
    begin

        AFrameworkName:=Copy(AFilePath,1,AIndex-1);
        AIndex:=0;
        while Pos('\',AFrameworkName,AIndex+1)>0 do
        begin
          AIndex:=Pos('\',AFrameworkName,AIndex+1);
        end;
        AFrameworkName:=Copy(AFrameworkName,AIndex+1,MaxInt);


        //ȡ·������****.framework��Ŀ¼
        //���ɵ�unit����Ŀ¼
        Self.edtStaticLibFileName.Text:=
            'FrameworkDylibPath_'+AFrameworkName+'.inc';
        Self.edtStaticLibPath.Text:=
            '{$I '+Self.edtStaticLibFileName.Text+'}';
        Self.edtStaticLibPathIncContent.Text:=
            ''''+AFrameworkName+'.framework'+'\'+AFrameworkName+'''';

    end;


end;

procedure TfrmMain.memNeedConvertFilePathDblClick(Sender: TObject);
begin
  if Self.memNeedConvertFilePath.ItemIndex>-1 then
  begin
    LoadFile(Self.memNeedConvertFilePath.Items[memNeedConvertFilePath.ItemIndex]);
  end;

end;

procedure TfrmMain.memOCCodeLinesDblClick(Sender: TObject);
begin
  Self.memOCCodeLines.SelectAll;
end;

procedure TfrmMain.memODCodeLinesDblClick(Sender: TObject);
begin
  Self.memODCodeLines.SelectAll;

end;
//
//initialization
//  RegisterClass(TPanel);
//
//finalization



end.
