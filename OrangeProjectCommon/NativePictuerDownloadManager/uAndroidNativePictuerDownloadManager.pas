unit uAndroidNativePictuerDownloadManager;

interface

uses
  Classes,
  SysUtils,
  Math,
  Types,


  {$IFDEF FMX}
  UITypes,
  FMX.Types,
  FMX.Graphics,
  {$ENDIF}

  uFuncCommon,
  uBaseLog,
  uBaseHttpControl,
  uBaseList,
  uBinaryObjectList,
  uTimerTask,
  uBinaryTreeDoc,
//  uDrawEngine,

  uFileCommon,
  uUrlPicture,
  uDrawPicture;


type
  TAndroidNativeDownloadPictureManager=class(TBaseDownloadPictureManager)
  public
    function DownloadPicture( //链接
                              const AUrl:String;
                              //图片
                              const ADrawPicture:TObject=nil;
                              //附加数据
                              const AData:Pointer=nil;
                              //图片所保存的文件路径
                              const ASavedFilePath:String='';
                              //文件后缀
                              const AFileExt:String='';
                              const ALogCaption:String='';
                              AOnDownloadStateChange:TDownloadPictureStateChangeEvent=nil//;
//                              //是否剪载成圆形
//                              AIsClipRound:Boolean=False;
//                              AClipRoundXRadis:Double=0;
//                              AClipRoundYRadis:Double=0
                              ):TUrlPicture;override;

  end;


implementation




{ TAndroidNativeDownloadPictureManager }

function TAndroidNativeDownloadPictureManager.DownloadPicture( //链接
                                                        const AUrl:String;
                                                        //图片
                                                        const ADrawPicture:TObject=nil;
                                                        //附加数据
                                                        const AData:Pointer=nil;
                                                        //图片所保存的文件路径
                                                        const ASavedFilePath:String='';
                                                        //文件后缀
                                                        const AFileExt:String='';
                                                        const ALogCaption:String='';
                                                        AOnDownloadStateChange:TDownloadPictureStateChangeEvent=nil//;
                          //                              //是否剪载成圆形
                          //                              AIsClipRound:Boolean=False;
                          //                              AClipRoundXRadis:Double=0;
                          //                              AClipRoundYRadis:Double=0
                                                        ):TUrlPicture;
begin
  //


end;

end.
