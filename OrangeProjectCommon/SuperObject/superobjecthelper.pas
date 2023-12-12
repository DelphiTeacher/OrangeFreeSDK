unit superobjecthelper;

interface

uses
  superobject;


type
//  TSuperArray=TSuperObject;
  TSuperArray=class(TSuperObject)
  public
    class function Create(AString:String='[]'):ISuperArray;
  end;



implementation


{ TSuperArray }

class function TSuperArray.Create(AString: String): ISuperArray;
var
  ASuperObject:TSuperObject;
begin
  if AString='' then AString:='[]';
  ASuperObject:=TSuperObject.ParseString(PWideChar(AString),True).AsTSuperObject;
  Result:=ASuperObject;

end;

end.

