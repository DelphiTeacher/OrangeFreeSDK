unit uImageCode;

interface

uses
  SysUtils,Math,FMX.Graphics,System.Types,System.UITypes,FMX.Types,System.Classes;

const
  DEFAULT_CODE_LENGTH = 4;  //验证码的长度  这里是4位
  DEFAULT_FONT_SIZE = 80;   //字体大小
  DEFAULT_LINE_NUMBER = 10;  //多少条干扰线
  DEFAULT_WIDTH = 400;      //默认宽度.图片的总宽
  DEFAULT_HEIGHT = 100;     //默认高度.图片的总高
  DEFAULT_COLOR = $FFE1FFFF;  //默认背景颜色值
  BASE_PADDING_LEFT = 20; //左边距
  RANGE_PADDING_LEFT = 95;//左边距范围值
  BASE_PADDING_TOP = 40;//上边距
  RANGE_PADDING_TOP = 15;//上边距范围值

Type
  TImageCode=class
  private
    //左边距     上边距
    FPaddingLeft,FPaddingTop:Integer;
    //生成的验证码
    FStringCode:String;
    //字符数组
    FArray:array of Char;
    //生成图片
    FBitmap:TBitmap;
    //随即左边距
    procedure RandomPadding();
    //随机颜色
    function RandomColor():Integer;
    //生成验证码
    function CreateCode():String;
  public
    //返回生成的验证码
    function GetImageCode():String;
    //生成验证码图片
    function CreateBitmap():TBitmap;
    //释放Bitmap
    procedure FreeBitmap();
  end;

implementation

{ TImageCode }

function TImageCode.CreateBitmap: TBitmap;
var
  I:Integer;
//  ABitmap:TBitmap;
begin
  FPaddingLeft:= 0; //每次生成验证码图片时初始化
  FPaddingTop:= 0;

  FBitmap:=TBitmap.Create;
  FBitmap.Width:=DEFAULT_WIDTH;
  FBitmap.Height:=DEFAULT_HEIGHT;

  //生成随即验证码
  Self.CreateCode;

  if FBitmap.Canvas.BeginScene then
  try
    //字体大小
    FBitmap.Canvas.Font.Size:= DEFAULT_FONT_SIZE;
    //背景色
    FBitmap.Canvas.Clear(DEFAULT_COLOR);

    //设置验证码每个字母或数字  随即的颜色 左边距
    for I := 0 to Self.CreateCode.Length-1 do
    begin
      //更新左边距
      RandomPadding;
      //字体颜色
      FBitmap.Canvas.Fill.Color:=RandomColor;
      //设置随机字体
      FBitmap.Canvas.Font.Style:=[TFontStyle(Random(3))];
      //绘制文本
      FBitmap.Canvas.FillText(RectF(FPaddingLeft,0,DEFAULT_WIDTH,DEFAULT_HEIGHT),FStringCode.SubString(I,1),False,1, [], TTextAlign.Leading, TTextAlign.Center);
    end;

    //添加干扰线
    for I := 0 to DEFAULT_LINE_NUMBER-1 do
    begin
      //干扰线的随机颜色
      FBitmap.Canvas.Stroke.Color:=RandomColor;
      //设置干扰线的随机开始点 结束点
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





