unit uListItemStyleJsonHelper;

interface

uses
  SysUtils,
  Classes,

  Graphics,
//  FMX.Controls,
  Types,
  uSkinItems,
  Variants,
  uBinaryTreeDoc,
  uGraphicCommon,
  uSkinListLayouts,
  uSkinVirtualListType,
  uSkinListViewType,
  uDrawTextParam,
  uSkinBufferBitmap,
  uDrawCanvas,

  {$IF CompilerVersion <= 21.0} // XE or older
  SuperObject,
  superobjecthelper,
  {$ELSE}
    {$IFDEF SKIN_SUPEROBJECT}
    uSkinSuperObject,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}

  Math,
  uSkinItemJsonHelper,
  uSkinScrollControlType;



var
  GlobalCustomerTagColorArray:Array[0..10] of TColor;
var
  GlobalTags:ISuperArray;
  GlobalTagsJsonStr:String;

//procedure LoadItems(ARecordListArray:ISuperArray;AVirtualList:TSkinVirtualList);
procedure LoadItem(AItemCaption:String;
                    AItemColor:TColor;
                    ATagJson:ISuperObject;
                    ASkinItem:TSkinItem;
                    AVirtualList:TSkinVirtualList);
procedure LoadTags(ATags: ISuperArray;
                  AListView:TSkinListView);

procedure LoadSelectedTags(ATags, ASelectedTagIDs: ISuperArray;
                          AListView:TSkinListView;
                          AIsInsert:Boolean);

//procedure LoadTestTags(ASelectedTagIDs: ISuperArray;
//                          AListView:TSkinListView;
//                          AIsInsert:Boolean);



implementation


uses
  ListItemStyle_CustomerTag;

//procedure LoadTestTags(ASelectedTagIDs: ISuperArray;
//                          AListView:TSkinListView;
//                          AIsInsert:Boolean);
//var
//  ATagsJsonStr:String;
//begin
//  LoadSelectedTags(GlobalTags,ASelectedTagIDs,AListView,AIsInsert);
//end;


procedure LoadTags(ATags: ISuperArray;AListView:TSkinListView);
var
  I:Integer;
  ATag:ISuperObject;
  ASkinItem:TSkinItem;
begin

  AListView.Prop.Items.BeginUpdate;
  try
    //'{"code":"0","data":[{"cid":1952698,"color":1,"createCtid":261249021,"createDate":"2021-07-09 18:25:17","description":"²âÊÔ","labelEnName":"HignQuality",
    //"labelId":10159,"labelName":"¸ßÖÊÁ¿","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1}],"lMsg":{"data":{},"key":"api.1528716915759"},
    //"msg":"²éÑ¯³É¹¦","ApiTime":0.022,"version":"a71ed318d6dd979dc6a75054ad842018"}'


    //'{"code":"0","data":
    //[{"cid":1952698,"color":1,"createCtid":261249021,"createDate":"2021-07-09 18:25:17","description":"²âÊÔ","labelEnName":"HignQuality","labelId":10159,"labelName":"¸ßÖÊÁ¿",
    //"labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":2,"createCtid":261249021,"createDate":"2021-07-09 18:44:58",
    //"description":"²âÊÔ","labelEnName":"China","labelId":10259,"labelName":"ÖÐ¹ú¿Í»§","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},
    //{"cid":1952698,"color":9,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"Test9","labelId":10979,"labelName":"²âÊÔ±êÇ©9","labelType":2,
    //"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":8,"createCtid":261249021,"createDate":"2021-07-09 18:44:59",
    //"description":"²âÊÔ","labelEnName":"Test8","labelId":10827,"labelName":"²âÊÔ±êÇ©8","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},
    //{"cid":1952698,"color":7,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"Test7","labelId":10765,"labelName":"²âÊÔ±êÇ©7","labelType":2,
    //"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":6,"createCtid":261249021,"createDate":"2021-07-09 18:44:59",
    //"description":"²âÊÔ","labelEnName":"Test6","labelId":10649,"labelName":"²âÊÔ±êÇ©6","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},
    //{"cid":1952698,"color":5,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"Test5","labelId":10547,"labelName":"²âÊÔ±êÇ©5","labelType":2,
    //"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":4,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ",
    //"labelEnName":"Test4","labelId":10474,"labelName":"²âÊÔ±êÇ©4","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":3,
    //"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"USA","labelId":10392,"labelName":"ÃÀ¹ú¿Í»§","labelType":2,"modifyCtid":261249021,
    //"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":10,"createCtid":261249021,"createDate":"2021-07-09 18:45:00","description":"²âÊÔ",
    //"labelEnName":"Test10","labelId":11016,"labelName":"²âÊÔ±êÇ©10","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1}],
    //"lMsg":{"data":{},
    //"key":"api.1528716915759"},"msg":"²éÑ¯³É¹¦","ApiTime":0.016,"version":"a71ed318d6dd979dc6a75054ad842018"}'
    AListView.Prop.Items.ClearItemsByType(sitDefault);
    for I := 0 to ATags.Length-1 do
    begin
      ATag:=ATags.O[I];
      ASkinItem:=AListView.Prop.Items.Add;
      LoadItem(ATag.S['labelName'],
                                          GlobalCustomerTagColorArray[ATag.I['color']],
                                          ATag,
                                          ASkinItem,
                                          AListView);
    end;
//    AListView.Height:=AListView.Prop.CalcContentHeight+AListView.Prop.ItemHeight;
  finally
    AListView.Prop.Items.EndUpdate();
  end;

end;


function LocateJsonArrayI(AJsonArray:ISuperArray;
                        AName:String;
                        AValue:Integer;
                        AStartIndex:Integer=0):ISuperObject;
var
  I:Integer;
begin
  Result:=nil;
  for I := AStartIndex to AJsonArray.Length-1 do
  begin
    //±éÀúËùÓÐkey
    if (AJsonArray.O[I].I[AName]=AValue) then
    begin
      Result:=AJsonArray.O[I];
      Break;
    end;
  end;

end;

procedure LoadSelectedTags(ATags, ASelectedTagIDs: ISuperArray;AListView:TSkinListView;AIsInsert:Boolean);
var
  I:Integer;
  ATag:ISuperObject;
  ASkinItem:TSkinItem;
begin

  //[10159]
  AListView.Prop.Items.BeginUpdate;
  try
    AListView.Prop.Items.ClearItemsByType(sitDefault);
    for I := 0 to ASelectedTagIDs.Length-1 do
    begin
      ATag:=LocateJsonArrayI(ATags,'labelId',ASelectedTagIDs.I[I]);
      if AIsInsert then
      begin
        ASkinItem:=AListView.Prop.Items.Insert(I);
      end
      else
      begin
        ASkinItem:=AListView.Prop.Items.Add;
      end;
      LoadItem(ATag.S['labelName'],
                                          GlobalCustomerTagColorArray[ATag.I['color']],
                                          ATag,
                                          ASkinItem,
                                          AListView);

    end;
//    AListView.Height:=AListView.Prop.CalcContentHeight+AListView.Prop.ItemHeight;
  finally
    AListView.Prop.Items.EndUpdate;
  end;


end;


procedure LoadItem(AItemCaption:String;
                    AItemColor:TColor;
                    ATagJson:ISuperObject;
                    ASkinItem:TSkinItem;
                    AVirtualList:TSkinVirtualList);
var
  AItemWidth:Double;
begin
  ASkinItem.Json:=ATagJson;
  ASkinItem.Caption:=AItemCaption;//ARecordDataJson.S['ItemCaption'];
  GetGlobalDrawTextParam.IsWordWrap:=False;
  GetGlobalDrawTextParam.FontSize:=9;
  //Õý³£µÄ¿í¶È
  AItemWidth:=uSkinBufferBitmap.GetStringWidth(ASkinItem.Caption,
                                              GetGlobalDrawTextParam.FontSize);
  AItemWidth:=Ceil((AItemWidth+10*Const_BufferBitmapScale)/Const_BufferBitmapScale);
  ASkinItem.Width:=Ceil(AItemWidth/Const_BufferBitmapScale);
  ASkinItem.Color:=AItemColor;//AColorArray[I mod Length(AColorArray)];

end;


initialization

  GlobalTagsJsonStr:=
    '[{"cid":1952698,"color":1,"createCtid":261249021,"createDate":"2021-07-09 18:25:17","description":"²âÊÔ","labelEnName":"HignQuality","labelId":10159,"labelName":"¸ßÖÊÁ¿",'
    +'"labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":2,"createCtid":261249021,"createDate":"2021-07-09 18:44:58", '
    +'"description":"²âÊÔ","labelEnName":"China","labelId":10259,"labelName":"ÖÐ¹ú¿Í»§","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},  '
    +'{"cid":1952698,"color":9,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"Test9","labelId":10979,"labelName":"²âÊÔ±êÇ©9","labelType":2,'
    +'"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":8,"createCtid":261249021,"createDate":"2021-07-09 18:44:59",'
    +'"description":"²âÊÔ","labelEnName":"Test8","labelId":10827,"labelName":"²âÊÔ±êÇ©8","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},'
    +'{"cid":1952698,"color":7,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"Test7","labelId":10765,"labelName":"²âÊÔ±êÇ©7","labelType":2,'
    +'"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":6,"createCtid":261249021,"createDate":"2021-07-09 18:44:59",'
    +'"description":"²âÊÔ","labelEnName":"Test6","labelId":10649,"labelName":"²âÊÔ±êÇ©6","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},'
    +'{"cid":1952698,"color":5,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"Test5","labelId":10547,"labelName":"²âÊÔ±êÇ©5","labelType":2,'
    +'"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":4,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ", '
    +'"labelEnName":"Test4","labelId":10474,"labelName":"²âÊÔ±êÇ©4","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":3,'
    +'"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"²âÊÔ","labelEnName":"USA","labelId":10392,"labelName":"ÃÀ¹ú¿Í»§","labelType":2,"modifyCtid":261249021,'
    +'"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":10,"createCtid":261249021,"createDate":"2021-07-09 18:45:00","description":"²âÊÔ",'
    +'"labelEnName":"Test10","labelId":11016,"labelName":"²âÊÔ±êÇ©10","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1}]'
    ;
  GlobalTags:=TSuperArray.Create(GlobalTagsJsonStr);

//  GlobalCustomerTagColorArray[0]:=$000C7FF2;
//  GlobalCustomerTagColorArray[1]:=$006A71FB;
//  GlobalCustomerTagColorArray[2]:=$00EF8399;
//  GlobalCustomerTagColorArray[3]:=$00DECE3B;
//  GlobalCustomerTagColorArray[4]:=$0070D68B;
//  GlobalCustomerTagColorArray[5]:=$00C591F9;
//  //GlobalCustomerTagColorArray[6]:=$006571FF;
//  GlobalCustomerTagColorArray[7]:=$00F2809B ;
//  GlobalCustomerTagColorArray[8]:=$0037CBE3;
//  GlobalCustomerTagColorArray[9]:=$00999390;
  //ºÍMXÍ³Ò»µÄÑÕÉ«
  GlobalCustomerTagColorArray[0]:=$006571FF;
  GlobalCustomerTagColorArray[1]:=$00F6A35E;
  GlobalCustomerTagColorArray[2]:=$0017BFBF;
  GlobalCustomerTagColorArray[3]:=$00C48EFD;
  GlobalCustomerTagColorArray[4]:=$00263676;
  GlobalCustomerTagColorArray[5]:=$00F2809B;
  GlobalCustomerTagColorArray[6]:=$0067D88B;
  GlobalCustomerTagColorArray[7]:=$0037CBE3 ;
  GlobalCustomerTagColorArray[8]:=$0035B7FF;
  GlobalCustomerTagColorArray[9]:=$00999390;
  GlobalCustomerTagColorArray[10]:=$000C7FF2;


end.
