(*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * Any non-GPL usage of this software or parts of this software is strictly
 * forbidden.
 *
 * The "appropriate copyright message" mentioned in section 2c of the GPLv2
 * must read: "Code from FAAD2 is copyright (c) Nero AG, www.nero.com"
 *
 *)

//{$I ..\..\source\compiler.inc}

unit SelectOutputDeviceFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSelectOutputDeviceForm = class(TForm)
    OutputDevicesLB: TListBox;
    OkBtn: TButton;
    CancelBtn: TButton;
    OutputDevicesLabel: TLabel;
    procedure OkBtnClick(Sender: TObject);
    procedure OutputDevicesLBDblClick(Sender: TObject);
    procedure OutputDevicesLBDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectOutputDeviceForm: TSelectOutputDeviceForm;

implementation

{$R *.dfm}

procedure TSelectOutputDeviceForm.OkBtnClick(Sender: TObject);
begin
  if (OutputDevicesLB.ItemIndex < 0) then
  begin
    ModalResult := mrCancel;
  end
  else
  begin
    ModalResult := mrOK;
  end;
end;

procedure TSelectOutputDeviceForm.OutputDevicesLBDblClick(Sender: TObject);
begin
  if (OutputDevicesLB.ItemIndex > -1) then
  begin
    ModalResult := mrOK;
  end;
end;

procedure TSelectOutputDeviceForm.OutputDevicesLBDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  str : string;
begin
  with (Control as TListBox).Canvas do
  begin
    FillRect(Rect);
    str := (Control as TListBox).Items[Index];
    TextOut(Rect.Left + 2, Rect.Top + 1, Copy(str, Pos('|', str) + 1, MaxInt));
  end;
end;

end.
