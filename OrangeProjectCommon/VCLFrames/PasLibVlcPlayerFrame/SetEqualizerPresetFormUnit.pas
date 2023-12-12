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

unit SetEqualizerPresetFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PasLibVlcClassUnit;

type
  TSetEqualizerPresetForm = class(TForm)
    PresetListLB: TListBox;
    OkBtn: TButton;
    CancelBtn: TButton;
    PresetListLabel: TLabel;
    BandInfoLB: TListBox;
    BandInfoLabel: TLabel;
    procedure PresetListLBClick(Sender: TObject);
  private
    { Private declarations }
  public
    FVLC : TPasLibVlc;
  end;

var
  SetEqualizerPresetForm: TSetEqualizerPresetForm;

implementation

{$R *.dfm}

procedure TSetEqualizerPresetForm.PresetListLBClick(Sender: TObject);
var
  equalizer : TPasLibVlcEqualizer;
  index : Integer;
begin
  BandInfoLB.Clear;
  if (PresetListLB.ItemIndex > -1) then
  begin
    equalizer := TPasLibVlcEqualizer.Create(
      FVLC,
      Word(PresetListLB.Items.Objects[PresetListLB.ItemIndex])
    );
    BandInfoLB.AddItem(
      'PreAmp: ' +  IntToStr(Round(equalizer.GetPreAmp())),
      NIL
    );
    for index := 0 to equalizer.GetBandCount() - 1 do
    begin
      BandInfoLB.AddItem(
        'Band no: ' + IntToStr(index+1) +
        ', freq.: ' + IntToStr(Round(equalizer.GetBandFrequency(index))) +
        'Hz, amp.:' + IntToStr(Round(equalizer.GetAmp(index))),
        NIL
      );
    end;
    equalizer.Free;
  end;
end;

end.
