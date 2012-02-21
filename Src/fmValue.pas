//******************************************************************************
// Kidogo Player - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

unit fmValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmValue = class(TForm)
    Label1: TLabel;
    btnCancel: TButton;
    btnOK: TButton;
    Bevel1: TBevel;
    txtValue: TEdit;
    upVal: TUpDown;
    chk8bit: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValue: TfrmValue;

implementation

{$R *.dfm}

end.
