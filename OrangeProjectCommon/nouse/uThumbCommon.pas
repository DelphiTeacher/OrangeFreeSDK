//convert pas to utf8 by ¥

unit uThumbCommon;

interface


const
  //缩略图的前缀
  Const_ThumbPrefix='thumb_';


const
  //2019-03-06改成300*300
//  MaxWidth = 500 ;
//  MaxHigth = 500 ;
  MaxWidth = 300 ;
  MaxHigth = 300 ;


function GetThumbFilePrefix(const AIsThumb:Boolean): String;


implementation

function GetThumbFilePrefix(const AIsThumb:Boolean): String;
begin
  Result:='';
  if AIsThumb then Result:=Const_ThumbPrefix;
end;


end.