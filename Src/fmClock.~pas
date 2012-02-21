//******************************************************************************
// Kidogo Player - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

unit fmClock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmClock = class(TForm)
    Label1: TLabel;
    rbZero: TRadioButton;
    rbOne: TRadioButton;
    Label2: TLabel;
    txtHigh: TEdit;
    spHigh: TUpDown;
    Label3: TLabel;
    txtLow: TEdit;
    spLow: TUpDown;
    Bevel1: TBevel;
    btnOK: TButton;
    btnCancel: TButton;
  private
    { Private declarations }
  public
    function GetLogicLevel() : Integer;
  end;

var
  frmClock: TfrmClock;

implementation

{$R *.dfm}

function TfrmClock.GetLogicLevel() : Integer;
begin
  if(rbZero.checked) then
    result := 0
  else
    result := 1;
end;

end.
