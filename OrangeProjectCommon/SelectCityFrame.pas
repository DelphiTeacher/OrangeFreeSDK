//convert pas to utf8 by ¥

unit SelectCityFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  uSkinItems,
  uFuncCommon,

//  MessageBoxFrame,
//  WaitingFrame,

  uFrameContext,
  uUIFunction,

  uSkinFireMonkeyControl, uSkinFireMonkeyPanel, uSkinFireMonkeyScrollControl,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyListBox, uSkinMaterial,
  uSkinScrollControlType, uSkinVirtualListType, uSkinListBoxType,
  uSkinFireMonkeyButton, FMX.Objects, uSkinButtonType, uSkinFireMonkeyLabel,
  uSkinCustomListType, uSkinFireMonkeyCustomList, uBaseSkinControl,
  uSkinPanelType, uDrawCanvas;

const
  {$region '省份城市常量'}
  CONST_PROVINCES: string =
  '安徽省,北京市,福建省,甘肃省,广东省,广西壮族自治区,贵州省,海南省,河北省,河南省,' +
  '黑龙江省,湖北省,湖南省,吉林省,江苏省,江西省,辽宁省,内蒙古自治区,宁夏回族自治区,' +
  '青海省,山东省,山西省,陕西省,上海市,四川省,天津市,西藏自治区,新疆维吾尔自治区,' +
  '云南省,浙江省,重庆市,香港,澳门,台湾省';

  CONST_CITYS: array[0..33] of string =
    ('安庆市,蚌埠市,亳州市,巢湖市,滁州市,阜阳市,合肥市,淮北市,淮南市,黄山市,六安市,马鞍山市,宿州市,太湖市,铜陵市,芜湖市,歙县,宣城市,池城市',
     '昌平区,朝阳区,崇文区,大兴区,东城区,房山区,丰台区,海淀区,怀柔区,门头沟区,密云县,平谷区,石景山区,顺义区,通州区,西城区,宣武区,延庆县,燕山区',
     '福州市,龙岩市,南平市,宁德市,莆田市,泉州市,三明市,邵武市,石狮市,厦门市,永安市,漳州市',
     '白银市,定西市,甘南藏族自治区,嘉峪关市,金昌市,酒泉市,兰州市,临夏市,陇南市,平凉市,庆阳市,天水市,武威市,西峰市,玉门市,张掖市',
     '潮州市,潮阳市,东莞市,佛山市,广州市,河源市,惠州市,江门市,揭阳,茂名市,梅州市,清远市,汕头市,汕尾市,韶关市,深圳市,顺德,阳江市,云浮,湛江市,肇庆市,中山市,珠海,恩平市',
     '百色市,北海市,崇左市,防城港市,贵港市,桂林市,合山市,河池市,贺州市,来宾市,柳州市,南宁市,凭祥市,钦州市,梧州市,玉林市',
     '安顺市,毕节市,赤水市,都匀市,贵阳市,凯里市,六盘水市,铜仁市,兴义市,遵义市',
     '白沙黎族自治县,保亭黎族苗族自治县,昌江黎族自治县,澄迈县,儋州市,定安县,东方,海口市,乐东黎族自治县,临高县,陵水黎族自治县,琼海,琼中黎族苗族自治县,三亚市,通什市,屯昌县,万宁,文昌,五指山',
     '保定市,泊头市,沧州市,承德市,定州市,邯郸市,衡水市,廊坊市,南宫市,秦皇岛市,任丘市,沙河市,石家庄市,唐山市,辛集市,邢台市,张家口市,涿州市',
     '安阳市,鹤壁市,济源,焦作市,开封市,缧河市,洛阳市,南阳市,平顶山市,濮阳市,三门峡市,商丘市,新乡市,信阳市,许昌市,义马市,郑州市,周口市,驻马店市',
     '阿城市,北安市,大庆市,大兴安岭,哈尔滨市,鹤岗市,黑河市,鸡西市,佳木斯市,牡丹江市,七台河市,齐齐哈尔市,双鸭山市,绥汾河市,绥化市,同江市,五大连池市,伊春市,肇东市',
     '安陆市,丹江口市,鄂州市,恩施市,恩施土家族苗族自治州,洪湖市,黄冈市,黄石市,江汉市,荆门市,荆沙市,荆州,老河口市,利川市,麻城市,蒲圻市,潜江,神农架林区,十堰市,石首市,随州市,天门市,武汉市,武穴市,仙桃市,咸宁,咸宁市,襄樊市,孝感市,宜昌市,应城市,枝城市',
     '长沙市,常德市,郴州市,衡阳市,洪江市,怀化市,吉首市,津市,耒阳市,冷水江市,冷水滩市,涟源市,娄底市,汨罗市,邵阳市,湘潭市,湘西土家族苗族自治州,湘乡市,益阳市,永州市,岳阳市,张家界市,株洲市',
     '白城市,白山市,长春市,敦化市,扶余市,公主岭市,桦甸市,浑江市,吉林市,集安市,九台市,辽源市,龙井市,梅河口市,四平市,松原,洮南市,通化市,图们市,延吉市,晖春市',
     '常熟市,常州市,丹阳市,东台市,淮安市,淮阴市,江阴市,姜堰市,金坛市,连云港市,南京市,南通市,启东,苏州市,宿迁市,泰州市,无锡市,吴江市,兴化市,徐州市,盐城市,扬州市,仪征市,宜兴市,张家港,镇江市,海门市',
     '抚州市,赣州市,吉安市,井冈山市,景德镇市,九江市,临川市,庐山市,南昌市,萍乡市,上饶市,新余市,宜春市,鹰潭市',
     '鞍山市,北票市,本溪市,长海市,朝阳市,大连市,丹东市,抚顺市,阜新市,海城市,葫芦岛,锦西市,锦州市,辽阳市,盘锦市,沈阳市,铁法市,铁岭市,瓦房店市,兴城市,营口市',
     '阿拉善盟,巴彦淖尔盟,包头市,赤峰市,东胜市,鄂尔多斯,二连浩特市,海拉尔市,呼和浩特市,呼伦贝尔,霍林郭勒市,集宁市,临河市,满洲里市,通辽市,乌海市,乌兰察布盟,乌兰浩特市,锡林郭勒盟,锡林浩特市,兴安盟,牙克石市,扎兰屯市',
     '固原市,青铜峡市,石嘴山市,吴忠市,银川市,中卫市',
     '德令哈市,格尔木市,共和市,果洛藏族自治州,海北藏族自治州,海东市,海南藏族自治州,海西蒙古族藏族自治州,海晏市,黄南藏族自治州,玛沁市,门源市,同仁市,西宁市,玉树藏族自治州,玉树市',
     '滨州市,德州市,东营市,荷泽市,济南市,济宁市,莱芜市,聊城市,临清市,临沂市,青岛市,青州市,曲阜市,日照市,泰安市,滕州市,威海市,潍坊市,文登市,新泰市,烟台市,枣庄市,诸城市,淄博市,莱州市',
     '长治市,大同市,侯马市,晋城市,晋中,临汾市,吕梁,朔州,太原市,忻州市,阳泉市,榆次市,运城市',
     '安康市,宝鸡市,汉中市,商洛,商州市,铜川市,渭南市,西安市,咸阳市,延安市,榆林市',
     '宝山区,长宁区,崇明县,川沙县,奉贤区,虹口区,黄浦区,嘉定区,金山区,静安区,卢湾区,闵行区,南汇区,浦东新区,普陀区,青浦区,松江区,徐汇区,杨浦区,闸北区',
     '阿坝藏族羌族自治州,巴中,成都市,达县市,德阳市,涪陵市,甘孜藏族自治州,广安,广元市,华蓥市,乐山市,凉山彝族自治州,泸州市,马尔康市,眉山,绵阳市,内江市,南充市,攀枝花市,遂宁市,万县市,西昌市,雅安市,宜宾市,资阳,自贡市',
     '宝坻区,北辰区,东丽区,汉沽区,和平区,河北区,河东区,河西区,红桥区,津南区,静海县,南开区,宁河县,西青区,大港区,塘沽区,蓟县,武清县',
     '阿里市,昌都市,拉萨市,林芝市,那曲市,日喀则市,山南市',
     '阿克苏市,阿拉尔,阿勒泰市,阿图什市,巴音郭楞蒙古自治州,博尔塔拉蒙古自治州,博乐市,昌吉回族自治州,昌吉市,哈密市,和田市,喀什市,克拉玛依,克拉玛依市,克孜勒苏柯尔克孜自治州,库尔勒市,奎屯市,石河子市,塔城市,吐鲁番市,乌鲁木齐市,五家渠,伊犁哈萨克自治州,伊宁市',
     '保山市,楚雄市,楚雄彝族自治州,大理白族自治州,大理市,德宏傣族景颇族自治州,迪庆藏族自治州,东川市,个旧市,红河哈尼族彝族自治州,景洪市,开远市,昆明市,丽江市,临沧市,六库市,潞西市,怒江傈傈族自治州,曲靖市,思茅市,文山市,文山壮族苗族自治州,西双版纳傣族自治州,' + '玉溪市,昭通市,中甸市',
     '慈溪,东阳市,海宁市,杭州市,湖州市,嘉兴市,江山市,椒江市,金华市,兰溪市,丽水市,临海市,宁波市,衢州市,瑞安市,上虞市,绍兴市,嵊泗,嵊州市,台州,桐乡市,温州市,萧山市,永康市,义乌市,余姚市,舟山市,诸暨市',
     '巴南区,北碚区,璧山县,长寿区,城口县,大足县,垫江县,渡口区,丰都县,奉节县,涪陵区,涪陵市,合川市,江北区,江津市,九龙坡区,开县,梁平县,南岸区,南川市,彭水苗族土家族自治县,綦江县,黔江区,荣昌县,沙坪坝区,石柱土家族自治县,双桥区,铜梁县,潼南县,万盛区,万县市,万州区' + ',巫山县,巫溪县,武隆县,秀山土家族苗族自治县,永川市,酉阳土家族苗族自治县,渝北区,云阳县,忠县,渝中区',
     '香港',
     '澳门',
     '台湾');
  {$endregion}


type
  TFrameSelectCity = class(TFrame)
    lbSelectValueMaterial: TSkinListBoxDefaultMaterial;
    pnlToolBar: TSkinFMXPanel;
    pnlBackColor: TSkinFMXPanel;
    lbProvince: TSkinFMXListBox;
    lbCity: TSkinFMXListBox;
    btnOK: TSkinFMXButton;
    btnReturn: TSkinFMXButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure lbProvinceSelectedItem(Sender: TObject;AItem:TSkinItem);
    procedure btnReturnClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    { Private declarations }
  private
    //加载字符串列表到ListBox中
    procedure LoadCommaText(AListBox:TSkinFMXListBox;ACommaText:String);
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
  public
    FSelectedProvince:String;
    FSelectedCity:String;
    FSelectedArea:String;
    procedure Init(ASelectedProvince:String;
                    ASelectedCity:String;
                    ASelectedArea:String='');
    { Public declarations }
  end;

var
  GlobalSelectCityFrame:TFrameSelectCity;



implementation

{$R *.fmx}

procedure TFrameSelectCity.btnCancelClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(FrameHistroy);
end;

procedure TFrameSelectCity.btnOKClick(Sender: TObject);
begin

  if Self.lbProvince.Prop.CenterItem<>nil then
  begin
    FSelectedProvince:=Self.lbProvince.Prop.CenterItem.Caption;
  end;
  if Self.lbCity.Prop.CenterItem<>nil then
  begin
    FSelectedCity:=Self.lbProvince.Prop.CenterItem.Caption;
  end;

  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(FrameHistroy);
end;

procedure TFrameSelectCity.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);

end;

constructor TFrameSelectCity.Create(AOwner: TComponent);
begin
  inherited;


  //设置主题颜色
  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;
  Self.lbSelectValueMaterial.DrawCenterItemRectParam.BorderColor.Color:=SkinThemeColor;

  Self.lbProvince.Properties.VertControlGestureManager.MinVelocity:=80;
  Self.lbCity.Properties.VertControlGestureManager.MinVelocity:=80;

  //添加到省份
  LoadCommaText(lbProvince,CONST_PROVINCES);


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

procedure TFrameSelectCity.FrameResize(Sender: TObject);
begin
  //平分两个ListBox
  Self.lbProvince.Width:=Self.Width/2;
  Self.lbCity.Width:=Self.Width/2;
end;

procedure TFrameSelectCity.Init(ASelectedProvince:String;
                                ASelectedCity:String;
                                ASelectedArea:String);
begin
  FSelectedProvince:=ASelectedProvince;
  FSelectedCity:=ASelectedCity;
  FSelectedArea:=ASelectedArea;
  Self.lbProvince.Properties.CenterItem:=Self.lbProvince.Properties.Items.FindItemByCaption(ASelectedProvince);
  Self.lbCity.Properties.CenterItem:=Self.lbCity.Properties.Items.FindItemByCaption(ASelectedCity);

end;

procedure TFrameSelectCity.lbProvinceSelectedItem(Sender: TObject;AItem:TSkinItem);
begin
  //加载城市
  LoadCommaText(lbCity,CONST_CITYS[AItem.Index]);
end;

procedure TFrameSelectCity.LoadCommaText(AListBox: TSkinFMXListBox;ACommaText: String);
var
  I: Integer;
  AStringList:TStringList;
begin
  AStringList:=TStringList.Create;
  AListBox.Prop.Items.BeginUpdate;
  try
      AListBox.Prop.Items.Clear(True);
      AStringList.CommaText:=ACommaText;
      for I := 0 to AStringList.Count-1 do
      begin
        AListBox.Prop.Items.Add.Caption:=AStringList[I];
      end;
      //默认选择第一个项
      AListBox.Prop.Items[0].Selected:=True;
      //初始位置
      AListBox.VertScrollBar.Prop.Position:=0;
  finally
    AListBox.Prop.Items.EndUpdate();
    FreeAndNil(AStringList);
  end;
end;

end.
