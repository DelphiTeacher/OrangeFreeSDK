unit uImageCode;

interface

uses
  SysUtils,Math,FMX.Graphics,System.Types,System.UITypes,FMX.Types,System.Classes;

const
  DEFAULT_CODE_LENGTH = 4;  //��֤��ĳ���  ������4λ
  DEFAULT_FONT_SIZE = 80;   //�����С
  DEFAULT_LINE_NUMBER = 10;  //������������
  DEFAULT_WIDTH = 400;      //Ĭ�Ͽ��.ͼƬ���ܿ�
  DEFAULT_HEIGHT = 100;     //Ĭ�ϸ߶�.ͼƬ���ܸ�
  DEFAULT_COLOR = $FFE1FFFF;  //Ĭ�ϱ�����ɫֵ
  BASE_PADDING_LEFT = 20; //��߾�
  RANGE_PADDING_LEFT = 95;//��߾෶Χֵ
  BASE_PADDING_TOP = 40;//�ϱ߾�
  RANGE_PADDING_TOP = 15;//�ϱ߾෶Χֵ

Type
  TImageCode=class
  private
    //��߾�     �ϱ߾�
    FPaddingLeft,FPaddingTop:Integer;
    //���ɵ���֤��
    FStringCode:String;
    //�ַ�����
    FArray:array of Char;
    //����ͼƬ
    FBitmap:TBitmap;
    //�漴��߾�
    procedure RandomPadding();
    //�����ɫ
    function RandomColor():Integer;
    //������֤��
    function CreateCode():String;
  public
    //�������ɵ���֤��
    function GetImageCode():String;
    //������֤��ͼƬ
    function CreateBitmap():TBitmap;
    //�ͷ�Bitmap
    procedure FreeBitmap();
  end;

implementation

{ TImageCode }

function TImageCode.CreateBitmap: TBitmap;
var
  I:Integer;
//  ABitmap:TBitmap;
begin
  FPaddingLeft:= 0; //ÿ��������֤��ͼƬʱ��ʼ��
  FPaddingTop:= 0;

  FBitmap:=TBitmap.Create;
  FBitmap.Width:=DEFAULT_WIDTH;
  FBitmap.Height:=DEFAULT_HEIGHT;

  //�����漴��֤��
  Self.CreateCode;

  if FBitmap.Canvas.BeginScene then
  try
    //�����С
    FBitmap.Canvas.Font.Size:= DEFAULT_FONT_SIZE;
    //����ɫ
    FBitmap.Canvas.Clear(DEFAULT_COLOR);

    //������֤��ÿ����ĸ������  �漴����ɫ ��߾�
    for I := 0 to Self.CreateCode.Length-1 do
    begin
      //������߾�
      RandomPadding;
      //������ɫ
      FBitmap.Canvas.Fill.Color:=RandomColor;
      //�����������
      FBitmap.Canvas.Font.Style:=[TFontStyle(Random(3))];
      //�����ı�
      FBitmap.Canvas.FillText(RectF(FPaddingLeft,0,DEFAULT_WIDTH,DEFAULT_HEIGHT),FStringCode.SubString(I,1),False,1, [], TTextAlign.Leading, TTextAlign.Center);
    end;

    //��Ӹ�����
    for I := 0 to DEFAULT_LINE_NUMBER-1 do
    begin
      //�����ߵ������ɫ
      FBitmap.Canvas.Stroke.Color:=RandomColor;
      //���ø����ߵ������ʼ�� ������
      FBitmap.Canvas.DrawLine(PointF(Random(DEFAULT_WIDTH),Random(DEFAULT_HEIGHT)), PointF(Random(DEFAULT_WIDTH),Random(DEFAULT_HEIGHT)), $FF);
    end;

  finally
    FBitmap.Canvas.EndScene;
//    FBitmap.Canvas.Free;
  end;

  Result:=FBitmap;
end;

function TImageCode.CreateCode: String;
var
  AString,ACode:String;
  I:Integer;
begin
  AString:='123456789abcdefghijkmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ';
  SetLength(FArray,Length(AString)+1);
  StrPCopy(@FArray[0],AString);

  ACode:='';
  for I := 0 to DEFAULT_CODE_LENGTH-1 do
  begin
    ACode:=ACode+FArray[Random(Length(FArray)-1)];
  end;
  FStringCode:=ACode;

  Result:=ACode;
end;

procedure TImageCode.FreeBitmap;
begin
  FBitmap.Free;
end;

function TImageCode.GetImageCode: String;
begin
  Result:=FStringCode;
end;

function TImageCode.RandomColor: Integer;
var
//  AString,ATemp:String;
//  AArray:Array of char;
//  I: Integer;

  AStringList:TStringList;
begin
//  AString:='0123456789abcdefABCDEF';
//  SetLength(AArray,Length(AString)+1);
//  StrPCopy(@AArray[0],AString);
//
//  ATemp:='';
//  for I := 0 to 3 do
//  begin
//    Randomize;
//    ATemp:=ATemp+AArray[Random(Length(AArray))];
//  end;
//
//  Result:=StrToInt('$FF'+ATemp+'FF');

   AStringList:=TStringList.Create;
   AStringList.Add('$FFFF1493');
   AStringList.Add('$FF800080');
   AStringList.Add('$FFBA55D3');
   AStringList.Add('$FF9400D3');
   AStringList.Add('$FF8A2BE2');
   AStringList.Add('$FF7B68EE');
   AStringList.Add('$FF6A5ACD');
   AStringList.Add('$FF483D8B');
   AStringList.Add('$FF3CB371');
   AStringList.Add('$FF228B22');
   AStringList.Add('$FF808000');
   AStringList.Add('$FFCD5C5C');
   AStringList.Add('$FF800000');

   try
     Randomize;
     Result:=StrToInt(AStringList[Random(AStringList.Count-1)]);
   finally
     FreeAndNil(AStringList);
   end;

end;

procedure TImageCode.RandomPadding;
begin
  FPaddingLeft:=FPaddingLeft+BASE_PADDING_LEFT + 60;//Random(RANGE_PADDING_LEFT);
  if FPaddingLeft>FPaddingLeft-20 then FPaddingLeft:=FPaddingLeft-20;
  FPaddingTop:=BASE_PADDING_TOP + Random(RANGE_PADDING_TOP);
end;

end.





