unit ALIOSSOPT;

{
  OSS (Open Storage Services) Delphi SDK v1.0.0 - Options

  The MIT License (MIT)
  Copyright (c) 2012 Guangzhou Cloudstrust Software Development Co., Ltd
  http://cloudstrust.com/

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

interface

uses IniFiles;

type
  TAliOssOption = class(THashedStringList)
  private
    function GetList(const Index: String): TAliOssOption;

    function GetValue(const Name: string): string;
    procedure SetValue(const Name, Value: string);

//    function GetObject(const Name: string): TObject;
//    procedure SetObject(const Name:String; Value: TObject);
  public
    property Lists[const Index: String]: TAliOssOption read GetList;
    property Values[const Name: string]: string read GetValue write SetValue;
//    property Objects[const Name: string]: TObject read GetObject write SetObject;

    procedure Merge(other: TAliOssOption);
    function MergeQueries: String;
    procedure RemoveEmpty;
    constructor Create;
    destructor Destroy; override;
end;

implementation

uses SysUtils;

{ TAliOssOption }

procedure TAliOssOption.Merge(other: TAliOssOption);
var
  I: Integer;
  key: String;
  val: String;
  obj: TObject;
  opt: TAliOssOption;
begin
  if other = nil then
    exit;

  for I := 0 to other.Count - 1 do
  begin
    key := other.Names[I];
    obj := other.Objects[I];
    val := other.ValueFromIndex[I];

    if obj <> nil then
    begin
      if obj is TAliOssOption then
      begin
        key := other.Get(I);
        opt := TAliOssOption.Create;
        opt.Assign(TAliOssOption(obj));
        self.AddObject(key, opt);
      end
      else
      begin
        self.Values[key] := val;
        self.Objects[self.IndexOfName(key)] := obj;

      end;
    end
    else
      self.Values[key] := val;

  end;
end;

function TAliOssOption.MergeQueries: String;
var
  I: Integer;
begin
  //assume all items are string
  for I := 0 to self.Count - 1 do
  begin
    if I <> 0 then
      result := result + '&';

    result := result + self.Names[I] + '=' + self.ValueFromIndex[I];
  end;
end;

procedure TAliOssOption.RemoveEmpty;
var
  I: Integer;
  val: String;
begin
  for I := self.Count - 1 downto 0 do
  begin
    val := self.ValueFromIndex[I];
    if (val = '') or (val = #0) then
      self.Delete(I);
  end;
end;

//procedure TAliOssOption.SetObject(const Name: String; Value: TObject);
//begin
//  inherited Objects[Name] := Value;
//end;

procedure TAliOssOption.SetValue(const Name, Value: string);
var
  val: string;
begin
  val := Value;
  if val = '' then
    val := #0;
  inherited Values[Name] := val;
end;

function TAliOssOption.GetList(const Index: String): TAliOssOption;
var
  p: Integer;
  obj: TObject;
  option: TAliOssOption;
begin
  p := self.IndexOf(Index);
  if p = -1 then
  begin
    option := TAliOssOption.Create;
    self.AddObject(Index, option);
    result := option;
  end
  else
  begin
    obj := self.Objects[p];
    option := nil;
    if obj is TAliOssOption then
      option := TAliOssOption(obj);

    result := option;
  end;
end;

//function TAliOssOption.GetObject(const Name: string): TObject;
//begin
//  Result:=inherited Objects[Name];
//end;

function TAliOssOption.GetValue(const Name: string): string;
begin
  result := inherited Values[Name];
  if result = #0 then
    result := '';
end;

constructor TAliOssOption.Create;
begin
  inherited Create;
end;

destructor TAliOssOption.Destroy;
begin
  inherited Destroy;
end;

end.
