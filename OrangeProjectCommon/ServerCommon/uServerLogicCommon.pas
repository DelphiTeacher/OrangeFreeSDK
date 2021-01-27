//convert pas to utf8 by ¥
//数据库操作基类//
unit uServerLogicCommon;

interface

uses
  Windows,
  SysUtils,
  Classes,


  DB,


  uBaseDBHelper,

  DateUtils,
  Variants,
  Messages,
  Controls;



//朋友圈项目中使用
function GetMaxFID(ASQLDBHelper:TBaseDBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;


implementation




function GetMaxFID(ASQLDBHelper:TBaseDBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;
begin
  Result:=-1;
  if ANeedLock then ASQLDBHelper.Lock;
  ASQLDBHelper.StartTransaction;
  try


    if ASQLDBHelper.SelfQuery('SELECT * FROM tblmaxfid WHERE TableName=:TableName',
                                      ['TableName'],
                                      [ATableName],
                                      asoOpen) then
    begin
      if not ASQLDBHelper.Query.Eof then
      begin
        //tblmaxfid中存在

        Result:=ASQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;
        //修改
        ASQLDBHelper.SelfQuery('UPDATE tblmaxfid SET MaxFID=:MaxFID WHERE TableName=:TableName',
                                      ['TableName','MaxFID'],
                                      [ATableName,Result],
                                      asoExec);
      end
      else
      begin
        //tblmaxfid中不存在

        //添加
        if ASQLDBHelper.SelfQuery('SELECT MAX('+AFieldName+') as MaxFID FROM '+ATableName+'',
                                          [],
                                          [],
                                          asoOpen) then
        begin
          Result:=ASQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;

          ASQLDBHelper.SelfQuery('INSERT INTO tblmaxfid(TableName,MaxFID) VALUES(:TableName,:MaxFID)',
                                        ['TableName','MaxFID'],
                                        [ATableName,Result],
                                        asoExec);
        end;

      end;
    end;

  finally
    if ANeedLock then ASQLDBHelper.UnLock;
    ASQLDBHelper.CommitTransaction;
  end;
end;





end.

