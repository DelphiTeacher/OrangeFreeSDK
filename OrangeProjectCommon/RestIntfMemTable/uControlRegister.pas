unit uControlRegister;

interface

uses
  Classes,
  Controls,
  uRestIntfMemTable,
  DesignIntf,
  DesignMenus,
  DesignEditors;

type
  TRestMemTableEditor=class(TDefaultEditor)
  public
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;



procedure Register;



implementation


procedure Register;
begin
  RegisterComponents('OrangeUI',[TRestMemTable]);

  RegisterComponentEditor(TRestMemTable,TRestMemTableEditor);

end;


{ TRestMemTableEditor }

procedure TRestMemTableEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:TRestMemTable(Component).GetFieldDefs();
  end;

end;

function TRestMemTableEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0:Result:='获取表结构';
  end;
end;

function TRestMemTableEditor.GetVerbCount: Integer;
begin
  Result:=1;
end;

end.
