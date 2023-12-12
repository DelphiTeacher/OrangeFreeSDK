unit iOSApi.QsSdkRoleInfo;

interface

{$IFDEF IOS}
uses
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	//typedef enum {
	    //QsSdkUploadRoleCreate,      //创建角色
	    //QsSdkUploadRoleLogin,       //角色登录
	    //QsSdkUploadRoleLevelUp,       //角色升级
	    //QsSdkUploadRoleLogout,      //角色登出
	    //QsSdkUploadChooseServer,    //选择区服
	    //QsSdkUploadChooseRole,      //选择角色
	    //QsSdkUploadEnterParty,      //加入工会
	    //QsSdkUploadOrderSuccess     //支付成功
	//} QsSdkUploadType;
	//typedef enum {
	QsSdkUploadType_=(
	    QsSdkUploadRoleCreate,      //创建角色
	    QsSdkUploadRoleLogin,       //角色登录
	    QsSdkUploadRoleLevelUp,       //角色升级
	    QsSdkUploadRoleLogout,      //角色登出
	    QsSdkUploadChooseServer,    //选择区服
	    QsSdkUploadChooseRole,      //选择角色
	    QsSdkUploadEnterParty,      //加入工会
	    QsSdkUploadOrderSuccess     //支付成功
	);
	QsSdkUploadType=Integer;
	
	
	
	
	
	//@interface QsSdkRoleInfo : NSObject
	//@interface QsSdkRoleInfo : NSObject
	QsSdkRoleInfo=interface(NSObject)//
	['{BEF416DA-58E8-46FD-8A3B-FBCCC95C86A3}']
		
		//@property (nonatomic, strong) NSString *roleIdQsSdk;            //角色ID
		function roleIdQsSdk:NSString;cdecl;//角色ID
		procedure setRoleIdQsSdk(roleIdQsSdk:NSString);cdecl;//角色ID
		//@property (nonatomic, strong) NSString *roleNameQsSdk;          //角色名
		function roleNameQsSdk:NSString;cdecl;//角色名
		procedure setRoleNameQsSdk(roleNameQsSdk:NSString);cdecl;//角色名
		//@property (nonatomic, strong) NSString *roleLevelQsSdk;         //角色等级
		function roleLevelQsSdk:NSString;cdecl;//角色等级
		procedure setRoleLevelQsSdk(roleLevelQsSdk:NSString);cdecl;//角色等级
		//@property (nonatomic, strong) NSString *serverIdQsSdk;          //区服ID
		function serverIdQsSdk:NSString;cdecl;//区服ID
		procedure setServerIdQsSdk(serverIdQsSdk:NSString);cdecl;//区服ID
		//@property (nonatomic, strong) NSString *serverNameQsSdk;        //区服名
		function serverNameQsSdk:NSString;cdecl;//区服名
		procedure setServerNameQsSdk(serverNameQsSdk:NSString);cdecl;//区服名
		//@property (nonatomic, strong) NSString *roleCreateTimeQsSdk;    //角色创建时间
		function roleCreateTimeQsSdk:NSString;cdecl;//角色创建时间
		procedure setRoleCreateTimeQsSdk(roleCreateTimeQsSdk:NSString);cdecl;//角色创建时间
		
		//@property (nonatomic, strong) NSString *roleVipLevelQsSdk;      //角色VIP等级
		function roleVipLevelQsSdk:NSString;cdecl;//角色VIP等级
		procedure setRoleVipLevelQsSdk(roleVipLevelQsSdk:NSString);cdecl;//角色VIP等级
		//@property (nonatomic, strong) NSString *rolePowerQsSdk;         //角色战力值
		function rolePowerQsSdk:NSString;cdecl;//角色战力值
		procedure setRolePowerQsSdk(rolePowerQsSdk:NSString);cdecl;//角色战力值
		//@property (nonatomic, strong) NSString *rolePartyQsSdk;         //角色工会/帮派
		function rolePartyQsSdk:NSString;cdecl;//角色工会/帮派
		procedure setRolePartyQsSdk(rolePartyQsSdk:NSString);cdecl;//角色工会/帮派
		//@property (nonatomic, strong) NSString *roleBalanceQsSdk;       //角色元宝余额
		function roleBalanceQsSdk:NSString;cdecl;//角色元宝余额
		procedure setRoleBalanceQsSdk(roleBalanceQsSdk:NSString);cdecl;//角色元宝余额
		//@property (nonatomic, strong) NSString *roleReincarnationQsSdk; //角色转生等级
		function roleReincarnationQsSdk:NSString;cdecl;//角色转生等级
		procedure setRoleReincarnationQsSdk(roleReincarnationQsSdk:NSString);cdecl;//角色转生等级
		//@property (nonatomic, strong) NSDictionary  *extQsSdk;          //扩展参数
		function extQsSdk:PNSDictionary;cdecl;//扩展参数
		procedure setExtQsSdk(extQsSdk:PNSDictionary);cdecl;//扩展参数
		
	end;
	
	QsSdkRoleInfoClass=interface(NSObjectClass)//
	['{80A966BA-A678-429B-97E3-CDF06526527D}']
	end;
	
	TQsSdkRoleInfo=class(TOCGenericImport<QsSdkRoleInfoClass,QsSdkRoleInfo>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkRoleInfo_FakeLoader : QsSdkRoleInfo; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkRoleInfo';
{$O+}



{$ENDIF}

end.

