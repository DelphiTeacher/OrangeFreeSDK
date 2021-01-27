unit uServiceLog;


interface

uses
  Windows,SysUtils,Classes,Forms,Messages,Controls,uBaseLog;

Const
  CONST_SERVICELOG_FILENAME='Service.log';


procedure HandleException(AException: Exception;const AModuleName, AUnitName, AMethodName, APosition: String;const AID:String='---';const AData:Pointer=nil);

var
  SERVICELog:TBaseLog;

implementation



procedure HandleException(AException: Exception;const AModuleName, AUnitName, AMethodName, APosition: String;const AID:String='---';const AData:Pointer=nil);
begin
//  if SERVICELog=nil then
//  begin
//    SERVICELog:=TBaseLog.Create(CONST_SERVICELOG_FILENAME);
//  end;
  if SERVICELog<>nil then SERVICELog.HandleException(AException, AModuleName, AUnitName, AMethodName, APosition,AID,AData);
end;

Initialization
  SERVICELog:=nil;
  SERVICELog:=TBaseLog.Create(CONST_SERVICELOG_FILENAME);


Finalization
  FreeAndNil(SERVICELog);

end.



