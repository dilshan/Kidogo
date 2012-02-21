//******************************************************************************
// Kidogo Player - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

program kidplay;

uses
  Forms,
  fmMain in 'fmMain.pas' {fmMain1},
  fmLLevel in 'fmLLevel.pas' {frmLLevel},
  fmClock in 'fmClock.pas' {frmClock},
  fmValue in 'fmValue.pas' {frmValue},
  fmAbout in 'fmAbout.pas' {frmAbout};

{$E exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Kidogo Player';
  Application.CreateForm(TfmMain1, fmMain1);
  Application.Run;
end.
