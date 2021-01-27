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
    function DownloadPicture( //����
                              const AUrl:String;
                              //ͼƬ
                              const ADrawPicture:TObject=nil;
                              //��������
                              const AData:Pointer=nil;
                              //ͼƬ��������ļ�·��
                              const ASavedFilePath:String='';
                              //�ļ���׺
                              const AFileExt:String='';
                              const ALogCaption:String='';
                              AOnDownloadStateChange:TDownloadPictureStateChangeEvent=nil//;
//                              //�Ƿ���س�Բ��
//                              AIsClipRound:Boolean=False;
//                              AClipRoundXRadis:Double=0;
//                              AClipRoundYRadis:Double=0
                              ):TUrlPicture;override;

  end;


implementation




{ TAndroidNativeDownloadPictureManager }

function TAndroidNativeDownloadPictureManager.DownloadPicture( //����
                                                        const AUrl:String;
                                                        //ͼƬ
                                                        const ADrawPicture:TObject=nil;
                                                        //��������
                                                        const AData:Pointer=nil;
                                                        //ͼƬ��������ļ�·��
                                                        const ASavedFilePath:String='';
                                                        //�ļ���׺
                                                        const AFileExt:String='';
                                                        const ALogCaption:String='';
                                                        AOnDownloadStateChange:TDownloadPictureStateChangeEvent=nil//;
                          //                              //�Ƿ���س�Բ��
                          //                              AIsClipRound:Boolean=False;
                          //                              AClipRoundXRadis:Double=0;
                          //                              AClipRoundYRadis:Double=0
                                                        ):TUrlPicture;
begin
  //


end;

end.
