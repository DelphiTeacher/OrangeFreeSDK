# Hifond_Card_Simple

#### 介绍
读卡aar

####读卡方法
参数说明
 type  卡类型 A-接触，B-非接 C-磁条，D-扫码，E-身份证
 addr  卡的块地址
 pwd   卡的密码
 m1Tag  特殊卡的标识

1.打开默认的所有读卡
HifondCardInterface.openModule()
  1.1.打开部分读卡
    HifondCardInterface.openModule("AB");

2.打开接触卡
  //普通二代社保卡/银行卡
 HifondCardInterface.openModule("A");

3.打开非接卡，需要配置块地址和块密码  块地址:4，块密码:FFFFFFFFFFFF
    HifondCardInterface.openModule("B","4","FFFFFFFFFFFF");
  3.1.打开特殊块地址和块密码的非接卡 （m1Tag =DG，这里根据业务处理）
    HifondCardInterface.openModule("B","2","A9F0B26F3C32","DG");
  3.2.读取卡的id
    HifondCardInterface.openModule("B");

4.打开磁条
 HifondCardInterface.openModule("C");

5.打开扫码
 HifondCardInterface.openModule("D");

6.打开身份证
 HifondCardInterface.openModule("E");

####关闭读卡
//关闭所有模块
HifondCardInterface.closeModule();

####读卡返回结果
以广播的形式
Action:com.hifond.CARD_DATA
StringExtra:cardData
//结果返回说明  json
{"cardName":"吴*玲",  //姓名
"cardNo":"123456",   //卡号
"cardType":"1",    //1-接触式芯片卡, 2-非接触式芯片卡, 3-磁条卡, 4-条形码, 5-身份证
"cardTypeZH":"接触卡",
"districtCode":"320400", //社保卡的地区代码
"idCardNo":"3425************0029",  //证件身份证号码
"resultCode":"00000",  //"00000"-读卡成功，"99999"-读卡失败
"sex":"女",     //性别
"backup01":"base64",  //身份证头像bitmap的base64编码数据
"uid":"d6e52521"    //M1卡的卡标识号（default）
}


####PSAM卡读取指令通道
1.重置/上电
HifondCardInterface.resetPSAM(int code);
 参数:
    code psam卡槽1234
2.发送apdu操作指令
 HifondCardInterface.readPSAM(int code,String apdu);
 参数:
    apdu:PSAM卡对应的psam指令
3.下电
 HifondCardInterface.powerDownPSAM(int code);



####读卡板子更新升级
注意事项：
     1.升级与读卡冲突，请确保读卡关闭
     2.升级之前有20秒左右等待时间，请耐心等待
     3.升级过程中请勿断开。升级完成后请重启
     4.需要文件权限
1  串口参数
  HifondCardInterface.init(context,115200,"dev/ttyS1");
2  调用升级方法
  //filePath:Hex文件的绝对路径
  HifondCardInterface.updateHex(String filePath);
3.升级进度返回
  //以广播的形式
  //进度条取值范围（1-101   101表示升级完成。继续等待5秒时间等待硬件板子更新重置）
  Action:com.hifond.CARD_HEX_UPDATE
  StringExtra:CARD_UPDATE_HEX_PERCENT


####板子模块检测和硬件信息读取
1  串口参数
  HifondCardInterface.init(context,115200,"dev/ttyS1");
2 调用方法
  HifondCardInterface.checkModule();
3 返回
    Action:com.hifond.CARD_CHECK
    StringExtra:cardData




