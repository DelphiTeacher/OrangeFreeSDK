//convert pas to utf8 by ¥
unit uPhotoManager.Windows;

interface

{$I FrameWork.inc}




  {$IFDEF MSWINDOWS}
uses
  Classes,
  SysUtils,

  Contnrs,


  uPhotoManager,
  uBaseList,
  uDrawPicture,
  uSkinBufferBitmap,

//  System.Generics.Collections,

  {$IFDEF FMX}
  FMX.Types,
  FMX.Graphics,
  System.IOUtils,
  {$ENDIF}


  uFuncCommon,
  uSkinPicture,
  uBaseLog,

  
  IdGlobalProtocols;


type
  TWindowsPhoto=class(TPhoto)
  public
    //图片唯一标识
    ImageID:String;  
    //相册ID
    BucketID:String;
  public
    //加载缩略图,成功后调用OnGetPhotoThumbBitmap
    procedure LoadThumbBitmap;override;
    //加载原图,成功后调用OnGetPhotoOriginBitmap
    procedure LoadOriginBitmap;override;
  end;

  TWindowsAlbum=class(TAlbum)
  public
    //相册ID
    BucketID:String;
    Dir:String;
  end;

  {$IFDEF FMX}
  TWindowsAlbumManager=class(TAlbumManager)
  private
    //遍历文件夹
    procedure EnumFileInQueue(path: PChar; fileExt: string; fileList: TStringList);
  public
    //提供的接口//
    //刷新相册列表
    procedure SyncAlbumList;override;
    //刷新相册中的图片列表
    procedure SyncPhotoList(AAlbum:TAlbum);override;
  end;
  {$ENDIF}

  {$ENDIF}





implementation

{$IFDEF MSWINDOWS}

{$IFDEF FMX}
function PhotoListSortCompare(Item1, Item2: Pointer): Integer;
var
  AAndroidPhoto1:TWindowsPhoto;
  AAndroidPhoto2:TWindowsPhoto;
  ACreateTime1:TDateTime;
  ACreateTime2:TDateTime;
begin
  AAndroidPhoto1:=TWindowsPhoto(Item1);
  AAndroidPhoto2:=TWindowsPhoto(Item2);

  //最新的显示在最前
  ACreateTime1:=TFile.GetCreationTime(AAndroidPhoto1.OriginFilePath);
  ACreateTime2:=TFile.GetCreationTime(AAndroidPhoto2.OriginFilePath);


  if ACreateTime1<ACreateTime2 then
  begin
    Result:=1;
  end
  else if ACreateTime1=ACreateTime2 then
  begin
    Result:=0;
  end
  else
  begin
    Result:=-1;
  end;
end;


{ TWindowsAlbumManager }

procedure TWindowsAlbumManager.EnumFileInQueue(path: PChar; fileExt: string;
  fileList: TStringList);
var
  searchRec: TSearchRec;
  found: Integer;
  tmpStr: string;
  curDir: string;
  dirs: TQueue;
  pszDir: PChar;
begin
   dirs := TQueue.Create; //创建目录队列
   dirs.Push(path); //将起始搜索路径入队
   pszDir := dirs.Pop;
   curDir := StrPas(pszDir); //出队
   {开始遍历,直至队列为空(即没有目录需要遍历)}
   while (True) do
   begin
      //加上搜索后缀,得到类似'c:\*.*' 、'c:\windows\*.*'的搜索路径
      tmpStr := curDir + '\*.*';
      //在当前目录查找第一个文件、子目录
      found := FindFirst(tmpStr, faAnyFile, searchRec);
      while found = 0 do //找到了一个文件或目录后
      begin
          //如果找到的是个目录
         if (searchRec.Attr and faDirectory) <> 0 then
         begin
          {在搜索非根目录(C:\、D:\)下的子目录时会出现'.','..'的"虚拟目录"
          大概是表示上层目录和下层目录吧。。。要过滤掉才可以}
            if (searchRec.Name <> '.') and (searchRec.Name <> '..') then
            begin
               {由于查找到的子目录只有个目录名，所以要添上上层目录的路径
                searchRec.Name = 'Windows';
                tmpStr:='c:\Windows';
                加个断点就一清二楚了
               }
               tmpStr := curDir + '\' + searchRec.Name;
               {将搜索到的目录入队。让它先晾着。
                因为TQueue里面的数据只能是指针,所以要把string转换为PChar
                同时使用StrNew函数重新申请一个空间存入数据，否则会使已经进
                入队列的指针指向不存在或不正确的数据(tmpStr是局部变量)。}
               dirs.Push(StrNew(PChar(tmpStr)));
            end;
         end
         else //如果找到的是个文件
         begin
             {Result记录着搜索到的文件数。可是我是用CreateThread创建线程
              来调用函数的，不知道怎么得到这个返回值。。。我不想用全局变量}
            //把找到的文件加到Memo控件
            if fileExt = '.*' then
               fileList.Add(curDir + '\' + searchRec.Name)
            else
            begin
               if SameText(RightStr(curDir + '\' + searchRec.Name, Length(fileExt)), fileExt) then
                  fileList.Add(curDir + '\' + searchRec.Name);
            end;
         end;
          //查找下一个文件或目录
         found := FindNext(searchRec);
      end;
      {当前目录找到后，如果队列中没有数据，则表示全部找到了；
        否则就是还有子目录未查找，取一个出来继续查找。}
      if dirs.Count > 0 then
      begin
         pszDir := dirs.Pop;
         curDir := StrPas(pszDir);
         StrDispose(pszDir);
      end
      else
         break;
   end;
   //释放资源
   dirs.Free;
   FindClose(searchRec);
end;

procedure TWindowsAlbumManager.SyncAlbumList;
var
  AWindowsPhoto:TWindowsPhoto;
  AAlbum:TWindowsAlbum;

//  ADir,AFileExt: String;
  AFilePathList,AFileExtList: TStringList;
  I,J: Integer;
  ADelimitedText:String;
begin

  Self.AlbumList.Clear();
  Self.AllPhotoList.Clear();



  AAlbum:=TWindowsAlbum.Create;
  AAlbum.Name:='图片';
  AAlbum.Dir:=Trim(TPath.GetPicturesPath);
  AlbumList.Add(AAlbum);


//  AAlbum:=TWindowsAlbum.Create;
//  AAlbum.Name:='Y下载';
//  AAlbum.Dir:='Y:\下载';
//  AlbumList.Add(AAlbum);


  AFilePathList := TStringList.Create;
  AFileExtList:= TStringList.Create;
  AFileExtList.Delimiter:='|';
  AFileExtList.StrictDelimiter:=True;


  ADelimitedText:='';
  if FIsCanSelectPhoto then
  begin
    ADelimitedText:='.PNG|.JPG|.JPEG';
  end;
  if FIsCanSelectVideo then
  begin
    if ADelimitedText<>'' then ADelimitedText:=ADelimitedText+'|';
    ADelimitedText:=ADelimitedText+'.MP4';
  end;
  AFileExtList.DelimitedText:=ADelimitedText;


  try
    for I := 0 to AlbumList.Count-1 do
    begin
        AAlbum:=TWindowsAlbum(AlbumList[I]);

        AFilePathList.Clear;
        for J := 0 to AFileExtList.Count-1 do
        begin
          //格式不区分大小写
          //遍历目标文件夹  获取所有图片
          EnumFileInQueue(PChar(AAlbum.Dir),AFileExtList[J], AFilePathList);

        end;


        for J := 0 to AFilePathList.Count-1 do
        begin
          //图片加入对应的相册
          AWindowsPhoto:=TWindowsPhoto.Create(AAlbum);
          AWindowsPhoto.ThumbFilePath:=AFilePathList[J];
          AWindowsPhoto.OriginFilePath:=AFilePathList[J];
          AWindowsPhoto.Name:=AFilePathList[J];

          if IsVideoFile(AFilePathList[J]) then
          begin
            AWindowsPhoto.IsVideo:=True;
            AWindowsPhoto.ThumbFilePath:='C:\preview.png';
          end;


          AllPhotoList.Add(AWindowsPhoto);
          AAlbum.PhotoList.Add(AWindowsPhoto);
        end;

    end;
  finally
    AFilePathList.Free;
    AFileExtList.Free;
  end;


  //按时间排序
  for I := 0 to AlbumList.Count-1 do
  begin
    AlbumList[I].PhotoList.Sort(PhotoListSortCompare);
  end;




  TThread.Synchronize(nil,procedure
  begin
    if Assigned(OnGetAlbumList) then
    begin
      OnGetAlbumList(Self);
    end;
  end);

//  ADir := Trim(TPath.GetPicturesPath);
//  AFileExt:='.PNG|.JPG|.JPEG';
//
//  AFileExtList:= TStringList.Create;
//  AFileExtList.Delimiter:='|';
//  AFileExtList.StrictDelimiter:=True;
//  AFileExtList.DelimitedText:=AFileExt;
//
//  try
//    AFilePathList := TStringList.Create;
//    for I := 0 to AFileExtList.Count-1 do
//    begin
//      //格式不区分大小写
//      //遍历目标文件夹  获取所有图片
//      EnumFileInQueue(PChar(ADir),AFileExtList[I], AFilePathList);
//    end;
//  finally
//    //没有获取到图片
//    if AFilePathList.Count<1 then
//    begin
//      AAlbum:=TWindowsAlbum.Create;
//      AlbumList.Add(AAlbum);
//    end;
//
//    AFileExtList.Clear;
//    for I := 0 to AFilePathList.Count-1 do
//    begin
//      AFileExtList.Delimiter:='\';
//      AFileExtList.StrictDelimiter:=True;//精确分割  解决空格分割问题
//      AFileExtList.DelimitedText:=AFilePathList[I];
//      if AlbumList.Count>0 then
//      begin
//        for J := 0 to AlbumList.Count-1 do
//        begin
//          if AlbumList[J].Name=AFileExtList[AFileExtList.Count-2] then
//          begin
//            //相册已存在
//            AAlbum:=TWindowsAlbum(AlbumList[J]);
//            //图片加入对应的相册
//            AWindowsPhoto:=TWindowsPhoto.Create(AAlbum);
//            AWindowsPhoto.OriginFilePath:=AFilePathList[I];
//            AWindowsPhoto.Name:=AFileExtList[AFileExtList.Count-1];
//
//            AllPhotoList.Add(AWindowsPhoto);
//            AAlbum.PhotoList.Add(AWindowsPhoto);
//
//            Break;
//          end
//          else if J=AlbumList.Count-1 then
//          begin
//            //相册不存在
//            AAlbum:=TWindowsAlbum.Create;
//            AAlbum.Name:=AFileExtList[AFileExtList.Count-2];
//            AlbumList.Add(AAlbum);
//
//            //图片加入对应的相册
//            AWindowsPhoto:=TWindowsPhoto.Create(AAlbum);
//            AWindowsPhoto.OriginFilePath:=AFilePathList[I];
//            AWindowsPhoto.Name:=AFileExtList[AFileExtList.Count-1];
//
//            AllPhotoList.Add(AWindowsPhoto);
//            AAlbum.PhotoList.Add(AWindowsPhoto);
//
//            Break;
//          end;
//        end;
//      end
//      else
//      begin
//        //相册为空
//        AAlbum:=TWindowsAlbum.Create;
//        AAlbum.Name:=AFileExtList[AFileExtList.Count-2];
//        AlbumList.Add(AAlbum);
//
//        //图片加入对应的相册
//        AWindowsPhoto:=TWindowsPhoto.Create(AAlbum);
//        AWindowsPhoto.OriginFilePath:=AFilePathList[I];
//        AWindowsPhoto.Name:=AFileExtList[AFileExtList.Count-1];
//
//        AllPhotoList.Add(AWindowsPhoto);
//        AAlbum.PhotoList.Add(AWindowsPhoto);
//      end;
//    end;
//    AFilePathList.Free;
//    AFileExtList.Free;
//  end;


end;

procedure TWindowsAlbumManager.SyncPhotoList(AAlbum: TAlbum);
begin

  if Assigned(OnGetAlbumPhotoList) then
  begin
    OnGetAlbumPhotoList(Self,AAlbum);
  end;

end;
{$ENDIF FMX}

{ TWindowsPhoto }

procedure TWindowsPhoto.LoadOriginBitmap;
begin
  
  if Not IsLoadingOriginBitmap
    and Not IsLoadedOriginBitmap then
  begin
  
    IsLoadingOriginBitmap:=True;
    IsLoadedOriginBitmap:=False;
    try

      if FileExists(Self.OriginFilePath) then
      begin 
        OriginBitmap:=TDrawPicture.Create('','');
        OriginBitmap.LoadFromFile(OriginFilePath);
      end;
    
    finally
      IsLoadingOriginBitmap:=False;
      IsLoadedOriginBitmap:=True;

      if Assigned(GetGlobalAlbumManager.OnGetPhotoOriginBitmap) then
        GetGlobalAlbumManager.OnGetPhotoOriginBitmap(Self,Self);
    end;
  
  end;
  
end;

procedure TWindowsPhoto.LoadThumbBitmap;
var
  tmpOriginBitmap:TSkinPicture;
//  AThumbBitmap:TBitmap;
begin
  TThread.Synchronize(nil,procedure
  begin

  if Not IsLoadingThumbBitmap
    and Not IsLoadedThumbBitmap then
  begin
  
    IsLoadingThumbBitmap:=True;
    IsLoadedThumbBitmap:=False;
    try
    
        if FileExists(Self.ThumbFilePath) then
        begin
            ThumbBitmap:=TDrawPicture.Create('','');
            ThumbBitmap.LoadFromFile(ThumbFilePath);
        end
        else
        begin

            //缩络图不存在
            //那么根据原图生成缩略图
            if FileExists(Self.OriginFilePath)
              //
              and not IsVideoFile(OriginFilePath) then
            begin
  //            AThumbBitmap:=nil;
              tmpOriginBitmap:=TSkinPicture.Create;
              try

                  try
                    //有时候加载不了会报错
                    tmpOriginBitmap.LoadFromFile(Self.OriginFilePath);
  //                  AThumbBitmap:=tmpOriginBitmap.CreateThumbnail(ThumbnailWidth,ThumbnailHeight);
  //
                    ThumbBitmap:=TDrawPicture.Create('','');
  //                  ThumbBitmap.Assign(AThumbBitmap);

                    TThread.Synchronize(nil,procedure
                    begin
                      {$IFDEF FMX}
                        CreateThumbBitmap(tmpOriginBitmap,ThumbBitmap,ThumbnailWidth,ThumbnailHeight);
                      {$ENDIF}
                      {$IFDEF VCL}
                        ThumbBitmap.LoadFromFile(Self.OriginFilePath);
                      {$ENDIF}
                    end);

                  except
                    on E:Exception do
                    begin
                      uBaseLog.HandleException(E,'OrangeUI TWindowsPhoto.LoadThumbBitmap '+E.Message);
                    end;
                  end;

              finally
                FreeAndNil(tmpOriginBitmap);
  //              FreeAndNil(AThumbBitmap);
              end;
            end;

        end;
    
    finally
      IsLoadingThumbBitmap:=False;
      IsLoadedThumbBitmap:=True;

      if Assigned(GetGlobalAlbumManager.OnGetPhotoThumbBitmap) then
      begin
        GetGlobalAlbumManager.OnGetPhotoThumbBitmap(Self,Self);
      end;


    end;
  
  end;
  end);

end;


    {$ENDIF}



end.
