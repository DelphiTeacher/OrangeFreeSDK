unit uBaseOAuthLogin;

interface

uses
  XSuperObject;

type
  TBaseOAuthLogin=class
  public
    FTokenJson:ISuperObject;
    FUserInfoJson:ISuperObject;

    //get access token
    function Login(var ADesc:String):Boolean;virtual;abstract;
    //get user info
    function GetUserInfo(var ADesc:String):Boolean;virtual;abstract;
    //remoke access token
    procedure Logout(var ADesc:String);virtual;abstract;
    //refresh access token
    function RefreshToken(var ADesc:String):Boolean;virtual;abstract;

    procedure SaveTokenToFile(AFilePath:String);virtual;abstract;
    procedure LoadTokenFromFile(AFilePath:String);virtual;abstract;

//    procedure SaveUserInfoToFile(AFilePath:String);virtual;abstract;
//    procedure LoadUserInfoFromFile(AFilePath:String);virtual;abstract;
  end;


implementation

end.
