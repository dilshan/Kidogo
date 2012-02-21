//******************************************************************************
// Kidogo Player - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

unit fmLLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLLevel = class(TForm)
    Label1: TLabel;
    rbZero: TRadioButton;
    rbOne: TRadioButton;
    btnCancel: TButton;
    btnOK: TButton;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    function GetLogicLevel() : Integer;
  end;

var
  frmLLevel: TfrmLLevel;

implementation

{$R *.dfm}

function TfrmLLevel.GetLogicLevel() : Integer;
begin
  if(rbZero.checked) then
    result := 0
  else
    result := 1;
end;

end.
