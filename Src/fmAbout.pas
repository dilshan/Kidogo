//******************************************************************************
// Kidogo Player - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

unit fmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvExControls, JvLabel;

type
  TfrmAbout = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

end.
