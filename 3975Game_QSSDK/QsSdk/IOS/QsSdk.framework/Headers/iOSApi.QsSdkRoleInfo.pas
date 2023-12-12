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
	    //QsSdkUploadRoleCreate,      //������ɫ
	    //QsSdkUploadRoleLogin,       //��ɫ��¼
	    //QsSdkUploadRoleLevelUp,       //��ɫ����
	    //QsSdkUploadRoleLogout,      //��ɫ�ǳ�
	    //QsSdkUploadChooseServer,    //ѡ������
	    //QsSdkUploadChooseRole,      //ѡ���ɫ
	    //QsSdkUploadEnterParty,      //���빤��
	    //QsSdkUploadOrderSuccess     //֧���ɹ�
	//} QsSdkUploadType;
	//typedef enum {
	QsSdkUploadType_=(
	    QsSdkUploadRoleCreate,      //������ɫ
	    QsSdkUploadRoleLogin,       //��ɫ��¼
	    QsSdkUploadRoleLevelUp,       //��ɫ����
	    QsSdkUploadRoleLogout,      //��ɫ�ǳ�
	    QsSdkUploadChooseServer,    //ѡ������
	    QsSdkUploadChooseRole,      //ѡ���ɫ
	    QsSdkUploadEnterParty,      //���빤��
	    QsSdkUploadOrderSuccess     //֧���ɹ�
	);
	QsSdkUploadType=Integer;
	
	
	
	
	
	//@interface QsSdkRoleInfo : NSObject
	//@interface QsSdkRoleInfo : NSObject
	QsSdkRoleInfo=interface(NSObject)//
	['{BEF416DA-58E8-46FD-8A3B-FBCCC95C86A3}']
		
		//@property (nonatomic, strong) NSString *roleIdQsSdk;            //��ɫID
		function roleIdQsSdk:NSString;cdecl;//��ɫID
		procedure setRoleIdQsSdk(roleIdQsSdk:NSString);cdecl;//��ɫID
		//@property (nonatomic, strong) NSString *roleNameQsSdk;          //��ɫ��
		function roleNameQsSdk:NSString;cdecl;//��ɫ��
		procedure setRoleNameQsSdk(roleNameQsSdk:NSString);cdecl;//��ɫ��
		//@property (nonatomic, strong) NSString *roleLevelQsSdk;         //��ɫ�ȼ�
		function roleLevelQsSdk:NSString;cdecl;//��ɫ�ȼ�
		procedure setRoleLevelQsSdk(roleLevelQsSdk:NSString);cdecl;//��ɫ�ȼ�
		//@property (nonatomic, strong) NSString *serverIdQsSdk;          //����ID
		function serverIdQsSdk:NSString;cdecl;//����ID
		procedure setServerIdQsSdk(serverIdQsSdk:NSString);cdecl;//����ID
		//@property (nonatomic, strong) NSString *serverNameQsSdk;        //������
		function serverNameQsSdk:NSString;cdecl;//������
		procedure setServerNameQsSdk(serverNameQsSdk:NSString);cdecl;//������
		//@property (nonatomic, strong) NSString *roleCreateTimeQsSdk;    //��ɫ����ʱ��
		function roleCreateTimeQsSdk:NSString;cdecl;//��ɫ����ʱ��
		procedure setRoleCreateTimeQsSdk(roleCreateTimeQsSdk:NSString);cdecl;//��ɫ����ʱ��
		
		//@property (nonatomic, strong) NSString *roleVipLevelQsSdk;      //��ɫVIP�ȼ�
		function roleVipLevelQsSdk:NSString;cdecl;//��ɫVIP�ȼ�
		procedure setRoleVipLevelQsSdk(roleVipLevelQsSdk:NSString);cdecl;//��ɫVIP�ȼ�
		//@property (nonatomic, strong) NSString *rolePowerQsSdk;         //��ɫս��ֵ
		function rolePowerQsSdk:NSString;cdecl;//��ɫս��ֵ
		procedure setRolePowerQsSdk(rolePowerQsSdk:NSString);cdecl;//��ɫս��ֵ
		//@property (nonatomic, strong) NSString *rolePartyQsSdk;         //��ɫ����/����
		function rolePartyQsSdk:NSString;cdecl;//��ɫ����/����
		procedure setRolePartyQsSdk(rolePartyQsSdk:NSString);cdecl;//��ɫ����/����
		//@property (nonatomic, strong) NSString *roleBalanceQsSdk;       //��ɫԪ�����
		function roleBalanceQsSdk:NSString;cdecl;//��ɫԪ�����
		procedure setRoleBalanceQsSdk(roleBalanceQsSdk:NSString);cdecl;//��ɫԪ�����
		//@property (nonatomic, strong) NSString *roleReincarnationQsSdk; //��ɫת���ȼ�
		function roleReincarnationQsSdk:NSString;cdecl;//��ɫת���ȼ�
		procedure setRoleReincarnationQsSdk(roleReincarnationQsSdk:NSString);cdecl;//��ɫת���ȼ�
		//@property (nonatomic, strong) NSDictionary  *extQsSdk;          //��չ����
		function extQsSdk:PNSDictionary;cdecl;//��չ����
		procedure setExtQsSdk(extQsSdk:PNSDictionary);cdecl;//��չ����
		
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

