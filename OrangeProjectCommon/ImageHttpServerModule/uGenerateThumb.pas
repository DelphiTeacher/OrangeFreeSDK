//convert pas to utf8 by ¥
unit uGenerateThumb;

interface

uses
  SysUtils,
  Classes,
  Math,
  {$IFDEF LINUX}
  {$ELSE}
  JPEG,
  PngImage,
//  uGraphicCommon,
  Graphics,
  {$ENDIF}


  Types//,
//  uThumbCommon
  ;

const
   //2019-03-06改成300*300
//  MaxWidth = 500 ;
//  MaxHigth = 500 ;
  MaxWidth = 300 ;
  MaxHigth = 300 ;



{$IFDEF LINUX}
{$ELSE}
//生成缩略图
procedure GenerateThumbJpegFile(AJpegStream:TStream;AThumbFilePath:String);overload;
procedure GenerateThumbJpegFile(AJpegFilePath:String;AThumbFilePath:String);overload;

function GetJpegFileSize(AJpegFilePath:String):TSize;
function GetPictureFileSize(AJpegFilePath:String):TSize;


function GenerateThumbBmpFile(AJpegStream:TStream;AThumbFilePath:String):Boolean;
{$ENDIF}


implementation

{$IFDEF LINUX}
{$ELSE}


function GetPictureFileSize(AJpegFilePath:String):TSize;
var
  AFileExt:String;
var
  SourceJpg: TJPEGImage;
  SourcePng: TPngImage;
begin
  Result.cx:=0;
  Result.cy:=0;
  AFileExt:=ExtractFileExt(AJpegFilePath);

  if SameText(AFileExt,'.jpg') then
  begin
      SourceJpg := TJPEGImage.Create;
      try
        try
           //读取源文件
           SourceJpg.LoadFromFile(AJpegFilePath);
           //计算缩小比例
           Result.cx:=SourceJpg.Width;
           Result.cy:=SourceJpg.Height;
        except

        end;
      finally
         SourceJpg.Free;
      end;
  end;


  if SameText(AFileExt,'.png') then
  begin
      SourcePng := TPngImage.Create;
      try
        try
           //读取源文件
           SourcePng.LoadFromFile(AJpegFilePath);
           //计算缩小比例
           Result.cx:=SourcePng.Width;
           Result.cy:=SourcePng.Height;
        except

        end;
      finally
         SourcePng.Free;
      end;
  end;


end;

function GetJpegFileSize(AJpegFilePath:String):TSize;
var
   SourceJpg: TJPEGImage;
begin
  Result.cx:=0;
  Result.cy:=0;
  SourceJpg := TJPEGImage.Create;
  try
    try
       //读取源文件
       SourceJpg.LoadFromFile(AJpegFilePath);
       //计算缩小比例
       Result.cx:=SourceJpg.Width;
       Result.cy:=SourceJpg.Height;
    except

    end;
  finally
     SourceJpg.Free;
  end;
end;

procedure GenerateThumbJpegFile(AJpegFilePath:String;AThumbFilePath:String);overload;
var
  AFileExt:String;
  AFileStream:TFileStream;
begin
  AFileExt:=ExtractFileExt(AJpegFilePath);
  if not SameText(AFileExt,'.jpg') and not SameText(AFileExt,'.jpeg') then
  begin
    Exit;
  end;
  
  AFileStream:=TFileStream.Create(AJpegFilePath,fmOpenRead);
  try
    GenerateThumbJpegFile(AFileStream,AThumbFilePath);
  finally
    FreeAndNil(AFileStream);
  end;

end;

procedure GenerateThumbJpegFile(AJpegStream:TStream;AThumbFilePath:String);
var
   jpg: TJPEGImage;
   bmp: TBitmap;
   SourceJpg: TJPEGImage;
   Width, Height: Integer;
   tmpInt:Double;
begin
   try
       bmp := TBitmap.Create;
       SourceJpg := TJPEGImage.Create;
       Jpg:= TJPEGImage.Create;
       //读取源文件
       SourceJpg.LoadFromStream(AJpegStream);
       //计算缩小比例
       if SourceJpg.Width >= SourceJpg.Height then
          tmpInt := Round(SourceJpg.Width / MaxWidth)
       else
          tmpInt := Round(SourceJpg.Height / MaxHigth) ;

       if tmpInt<1 then tmpInt:=1;

       Width  := Ceil(SourceJpg.Width  / tmpInt) ;
       Height := Ceil(SourceJpg.Height / tmpInt) ;
       //缩小
       bmp.Width := Width;
       bmp.Height := Height;
       bmp.PixelFormat := pf24bit;
       bmp.Canvas.StretchDraw(Rect(0,0,Width,Height), SourceJpg);
       //保存
       jpg.Assign(bmp);
       jpg.CompressionQuality:=60;
       jpg.SaveToFile(AThumbFilePath);
   finally
     bmp.Free;
     jpg.Free;
     SourceJpg.Free;
   end;

end;


function GenerateThumbBmpFile(AJpegStream:TStream;AThumbFilePath:String):Boolean;
var
   jpg: TJPEGImage;
   bmp: TBitmap;
   SourceJpg: TJPEGImage;
   Width, Height: Integer;
   tmpInt:Double;
begin
    Result:=False;
    try
      try
        bmp := TBitmap.Create;
        SourceJpg := TJPEGImage.Create;
        Jpg:= TJPEGImage.Create;
        //读取源文件
        SourceJpg.LoadFromStream(AJpegStream);
        //计算缩小比例
        if SourceJpg.Width >= SourceJpg.Height then
            tmpInt := Round(SourceJpg.Width / MaxWidth)
        else
            tmpInt := Round(SourceJpg.Height / MaxHigth) ;

        if tmpInt<1 then tmpInt:=1;

        Width  := Ceil(SourceJpg.Width  / tmpInt) ;
        Height := Ceil(SourceJpg.Height / tmpInt) ;
        //缩小
        bmp.Width := Width;
        bmp.Height := Height;
        bmp.PixelFormat := pf24bit;
        bmp.Canvas.StretchDraw(Rect(0,0,Width,Height), SourceJpg);
        //保存
        //jpg.Assign(bmp);
        //jpg.CompressionQuality:=60;
        bmp.SaveToFile(AThumbFilePath);

        Result:=True;
      except

      end;
    finally
        bmp.Free;
        jpg.Free;
        SourceJpg.Free;
    end;

end;
{$ENDIF}


end.