unit uSelectContactor;

interface

//IOS下需要在SDKManager中添加ContactsUI的框架
//VersionInfo中设置 是否允许此App访问你的通讯录？

//Android需要权限<uses-permission android:name="android.permission.READ_CONTACTS"/>

uses
  SysUtils,
  System.Types,
  FMX.Types,
  FMX.Forms,

  {$IFDEF IOS}
  Macapi.Helpers,
  iOSapi.Foundation,
  iOSapi.CNContact,
  iOSApi.CNContactPickerViewController,
  FMX.Platform.iOS,
  Macapi.ObjectiveC,
  iOSApi.CNLabeledValue,
  iOSApi.CNPhoneNumber,
  {$ENDIF IOS}


  {$IFDEF ANDROID}
    Androidapi.JNI.JavaTypes,
    Androidapi.JNI.Telephony,
    Androidapi.JNI.Net,
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.Helpers,
    FMX.Helpers.Android,
    Androidapi.JNI.Embarcadero,
    {$IF RTLVersion>=33}// 10.3+
      System.Permissions, // 动态权限单元
    {$ENDIF}
//    uOpenCommon,
//    uAndroidPermission_D10_2,
    Androidapi.JNI.Os,
    Androidapi.JNI.App, Androidapi.JNIBridge,
    System.SyncObjs,
    FMX.Platform.Android,
    Androidapi.JNI.Provider,
  {$ENDIF}
    System.Messaging,


  Classes;

const
  READ_CONTACT = 1000;

type
  TSelectedPhoneEvent=procedure(Sender:TObject;APhone:String;AName:String) of object;

  TSelectContactor=class
  private
    {$IFDEF IOS}
    FCNContactPickerViewController:CNContactPickerViewController;
    FCNContactPickerDelegate:TCNContactPickerDelegate;
    FNSPredicate:NSPredicate;

    procedure DoIOSSelectedContact(AContact:CNContact);
    procedure DoOncontactPickerdidSelectContact(picker:CNContactPickerViewController{*};contact:CNContact{*});
	  procedure DoOncontactPickerdidSelectContacts(picker:CNContactPickerViewController{*};contacts:NSArray{<CNContact*>}{*});
    {$ENDIF IOS}

  private
    {$IFDEF ANDROID}
    FMessageSubscriptionID: integer;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    Function OnActivityResult(RequestCode, ResultCode: integer;Data: JIntent): Boolean;
    {$ENDIF ANDROID}
  private
    procedure DoSelectedContact(APhone, AName: String);
  public
    OnSelectedPhone:TSelectedPhoneEvent;
    procedure Open;
    procedure Close;
    constructor Create;
    procedure RequestPermission;
  end;


var
  GlobalSelectContactor:TSelectContactor;


implementation

{ TSelectContactor }


{$IFDEF IOS}

procedure TSelectContactor.DoOncontactPickerdidSelectContact(picker: CNContactPickerViewController; contact: CNContact);
var
  AContact:CNContact;
begin
  try
      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContact Begin');
    //  ShowMessage('选择了一个联系人');

      AContact:=TCNContact.Wrap(contact);
      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContact 1');
      DoIOSSelectedContact(AContact);

      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContact End');
  except
    on E:Exception do
    begin
      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContact Error '+E.Message);
    end;
  end;
end;

procedure TSelectContactor.DoOncontactPickerdidSelectContacts(picker: CNContactPickerViewController; contacts: NSArray);
var
  AContact:CNContact;
begin
  try
      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContacts Begin');
    //  ShowMessage('选择了多个联系人');

      if contacts.count>0 then
      begin
        AContact:=TCNContact.Wrap(contacts.objectAtIndex(0));
        FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContact 1');
        DoIOSSelectedContact(AContact);
      end
      else
      begin
        FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContact No Selected');
      end;
  

    //  ShowMessage('选择了联系人'+NSStrToStr(ACNPhoneNumber.stringValue));
      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContacts End');
  except
    on E:Exception do
    begin
      FMX.Types.Log.d('OrangeUI DoOncontactPickerdidSelectContacts Error '+E.Message);
    end;
  end;
end;


procedure TSelectContactor.DoIOSSelectedContact(AContact: CNContact);
var
  ACNLabeledValue:CNLabeledValue;
  ACNPhoneNumber:CNPhoneNumber;
  APhoneNumber:String;
begin
  FMX.Types.Log.d('OrangeUI DoSelectedContact Begin');
//  ShowMessage('选择了多个联系人');

  APhoneNumber:='';
  if AContact.phoneNumbers.count>0 then
  begin
    ACNLabeledValue:=TCNLabeledValue.Wrap(AContact.phoneNumbers.objectAtIndex(0));
    FMX.Types.Log.d('OrangeUI DoSelectedContact 2');
    ACNPhoneNumber:=TCNPhoneNumber.Wrap(ACNLabeledValue.value);
    APhoneNumber:=NSStrToStr(ACNPhoneNumber.stringValue);
  end
  else
  begin
    FMX.Types.Log.d('OrangeUI DoSelectedContact 2 No PhoneNumber');

  end;

  DoSelectedContact(APhoneNumber,
                    NSStrToStr(AContact.familyName)+NSStrToStr(AContact.givenName));

  FMX.Types.Log.d('OrangeUI DoSelectedContact End');
end;
{$ENDIF IOS}


procedure TSelectContactor.DoSelectedContact(APhone, AName: String);
begin
  if Assigned(Self.OnSelectedPhone) then
  begin
    OnSelectedPhone(Self,APhone,AName);
  end;
end;

procedure TSelectContactor.Close;
begin
  {$IFDEF ANDROID}
  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, FMessageSubscriptionID);
  FMessageSubscriptionID := 0;
  {$ENDIF ANDROID}
end;

constructor TSelectContactor.Create;
begin

end;

{$IFDEF ANDROID}
procedure TSelectContactor.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
begin
  if M is TMessageResultNotification then
    OnActivityResult(TMessageResultNotification(M).RequestCode,
      TMessageResultNotification(M).ResultCode,
      TMessageResultNotification(M).Value);
end;

function TSelectContactor.OnActivityResult(RequestCode, ResultCode: integer;
  Data: JIntent): Boolean;
var
  contactName, phoneNum: string;
  Uri: Jnet_Uri;
  DataCursor: JCursor;
  Projection: TJavaObjectArray<JString>;
begin
  Result := False;
  contactName := '';
  phoneNum := '';
  if RequestCode = READ_CONTACT then
  begin

    if ResultCode = TJActivity.JavaClass.RESULT_OK then
    begin
      if Assigned(Data) then
      begin
        Uri := Data.getData;
        try
          Projection := CreateJavaStringArray(['display_name', 'data1']);
          DataCursor := TAndroidHelper.ContentResolver.query(Uri, Projection,
            nil, nil, nil);

          if DataCursor <> nil then
            try
              while DataCursor.moveToNext do
              begin
                contactName := JStringToString(DataCursor.getString(0));
                phoneNum := JStringToString(DataCursor.getString(1));

                Break;
              end;
            finally
              DataCursor.close;
            end;
        Except
          on E: Exception do
          begin
            FMX.Types.Log.d('OrangeUI OnActivityResult'+E.Message);
          end;
        end;
//        FcontactName := contactName;
//        FphoneNum := phoneNum;
        DoSelectedContact(phoneNum,contactName);

      end;
//     FFrameResult :=True;
    end
    else if ResultCode = TJActivity.JavaClass.RESULT_CANCELED then
    begin
//     FFrameResult :=False;
    end;
    Result := True;
  end;
//  HideFrame(self,hfcttBeforeShowFrame,ufsefNone);
//  ReturnFrame(CurrentFrameHistroy);

  Close;
end;
{$ENDIF ANDROID}





procedure TSelectContactor.Open;
{$IFDEF ANDROID}
var
  LIntent: JIntent;
{$ENDIF ANDROID}
begin
  {$IFDEF IOS}
  try
    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 1');
    FNSPredicate:=TNSPredicate.Wrap(TNSPredicate.OCClass.predicateWithFormat(StrToNSStr('phoneNumbers.@count == 1')));

    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 2');
    FCNContactPickerViewController:=TCNContactPickerViewController.Create;
    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 3');
    FCNContactPickerDelegate:=TCNContactPickerDelegate.Create;
    FCNContactPickerDelegate.OncontactPickerdidSelectContact:=DoOncontactPickerdidSelectContact;
    FCNContactPickerDelegate.OncontactPickerdidSelectContacts:=DoOncontactPickerdidSelectContacts;

    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 4');
    FCNContactPickerViewController.setDelegate((FCNContactPickerDelegate as ILocalObject).GetObjectID);
    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 5');
    FCNContactPickerViewController.setPredicateForEnablingContact(FNSPredicate);
    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 6');
    WindowHandleToPlatform(Application.MainForm.Handle).Wnd.rootViewController.presentViewController(FCNContactPickerViewController,True,nil);
    FMX.Types.Log.d('OrangeUI TSelectContactor.Open 7');
  except
    on E:Exception do
    begin
      FMX.Types.Log.d('OrangeUI TSelectContactor.Open 8 '+E.Message);
    end;
  end;
  {$ENDIF IOS}

// if([[UIDevice currentDevice] systemVersion].floatValue >= 9.0){
//        CNContactPickerViewController *contactController = [CNContactPickerViewController new];
//        contactController.delegate = self;
//        [contactController setPredicateForSelectionOfContact:[NSPredicate predicateWithFormat:@"phoneNumbers.@count == 1"]];
//        [controller presentViewController:contactController animated:YES completion:nil];
//    }else{
//       
//        ABPeoplePickerNavigationController *peoplePickerNavigationController = [ABPeoplePickerNavigationController new];
//        peoplePickerNavigationController.peoplePickerDelegate = self;
//        peoplePickerNavigationController.predicateForSelectionOfPerson = [NSPredicate predicateWithFormat:@"phoneNumbers.@count == 1"];
//        [controller presentViewController:peoplePickerNavigationController animated:YES completion:nil];
//    }


  {$IFDEF ANDROID}
  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);

  FMX.Types.Log.d('OrangeUI TSelectContactor.Open 1');
  LIntent := TJIntent.JavaClass.init;
  LIntent.setAction(TJIntent.JavaClass.ACTION_PICK);

  FMX.Types.Log.d('OrangeUI TSelectContactor.Open 2');
  LIntent.addCategory(TJIntent.JavaClass.CATEGORY_DEFAULT);
  LIntent.setType(StringToJString('vnd.android.cursor.dir/phone_v2'));
  SharedActivity.startActivityForResult(LIntent, READ_CONTACT);
  FMX.Types.Log.d('OrangeUI TSelectContactor.Open 3');
  {$ENDIF ANDROID}




  {$IFDEF MSWINDOWS}
  //Windows下测试
  Self.DoSelectedContact('18957901025','王能');
  {$ENDIF MSWINDOWS}

end;

procedure TSelectContactor.RequestPermission;
begin
  {$IFDEF ANDROID}
  {$IF RTLVersion>=32}// 10.2+
    PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.READ_CONTACTS)],
      procedure(const APermissions: {$IF CompilerVersion >= 35.0}TClassicStringDynArray{$ELSE}TArray<string>{$IFEND};
        const AGrantResults: {$IF CompilerVersion >= 35.0}TClassicPermissionStatusDynArray{$ELSE}TArray<TPermissionStatus>{$IFEND})
      begin
      end);
  {$ENDIF}
  {$ENDIF}

end;

end.
