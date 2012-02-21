//******************************************************************************
// Kidogo Player - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

unit fmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ImgList, Buttons, ExtCtrls, XPMan, StdCtrls,
  Grids, JvExComCtrls, JvStatusBar, AppEvnts, JvExControls, JvLED, Math,
  Menus, fmLLevel, fmClock, fmValue, Clipbrd, JvAppInst, JvComponentBase,
  JvSystemPopup, fmAbout, JvHidControllerClass, shellapi;

const
  FILE_ID : integer = 620;
  SYSTEM_ID : string = 'KDP620';
  COLOR_MAP : array[0..7] of TColor = ($00B0B0FF, $00B9FFB9, $00FFC1C1, $00B9FFFF, $00FFFFB0, $00C6EFFF, $00DFDDE1, $00FDFDFD);
  USB_VID : integer = $1984;
  USB_PID : integer = $620; 

type
  TfmMain1 = class(TForm)
    tbMain: TCoolBar;
    pnlMan: TPanel;
    tbbNew: TSpeedButton;
    xp_main: TXPManifest;
    tbbOpen: TSpeedButton;
    tbbSave: TSpeedButton;
    Bevel1: TBevel;
    tbbPlay: TSpeedButton;
    tbbStop: TSpeedButton;
    Label1: TLabel;
    txtSeg: TEdit;
    spSeg: TUpDown;
    chkLoop: TCheckBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label2: TLabel;
    txtTime: TEdit;
    Label3: TLabel;
    tbTime: TTrackBar;
    Bevel4: TBevel;
    Panel1: TPanel;
    bttHome: TSpeedButton;
    tbbHelp: TSpeedButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    grdMain: TStringGrid;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    lblSegId: TLabel;
    Label7: TLabel;
    lblTime: TLabel;
    Bevel5: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    txtActiveSeg: TEdit;
    spActiveSeg: TUpDown;
    btnPlay: TSpeedButton;
    btnStop: TSpeedButton;
    btnBack: TSpeedButton;
    btnNext: TSpeedButton;
    btnPlayTo: TSpeedButton;
    Bevel6: TBevel;
    Label11: TLabel;
    pnlTTime: TPanel;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    stMain: TJvStatusBar;
    sbMain: TScrollBox;
    imgDraw: TPaintBox;
    pnlSimInfo: TPanel;
    ledSim: TJvLED;
    lblSim: TLabel;
    Panel4: TPanel;
    chkA: TCheckBox;
    chkB: TCheckBox;
    chkC: TCheckBox;
    chkD: TCheckBox;
    chkE: TCheckBox;
    chkF: TCheckBox;
    chkG: TCheckBox;
    chkH: TCheckBox;
    tmMain: TTimer;
    mnuUtil: TPopupMenu;
    Fill1: TMenuItem;
    rowwithonelogiclevel1: TMenuItem;
    Allwithonelogiclevel1: TMenuItem;
    Deletesegment1: TMenuItem;
    InsertSegment1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Rowwithvalue1: TMenuItem;
    Clockingpattern1: TMenuItem;
    Clearsegment1: TMenuItem;
    N3: TMenuItem;
    Invertsegment1: TMenuItem;
    N4: TMenuItem;
    Copysegment1: TMenuItem;
    Pastesegment1: TMenuItem;
    imlMenuImages: TImageList;
    Selectedsegment1: TMenuItem;
    All1: TMenuItem;
    N5: TMenuItem;
    ShiftRow1: TMenuItem;
    RotateRow1: TMenuItem;
    Left1: TMenuItem;
    Right1: TMenuItem;
    Left2: TMenuItem;
    Right2: TMenuItem;
    AppInstances1: TJvAppInstances;
    pmnuSystem: TJvSystemPopup;
    mnuSystemPop: TPopupMenu;
    AboutKidogoPlayer1: TMenuItem;
    KidogoHomepage1: TMenuItem;
    hid1: TJvHidDeviceController;
    btnClear: TSpeedButton;
    ApplicationEvents1: TApplicationEvents;
    Copysegmentvalue1: TMenuItem;
    procedure InitUI();
    procedure UpdateSegEditorLayout();
    procedure txtSegChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ValidateEditor();
    procedure UpdateTimeValues();
    procedure txtTimeChange(Sender: TObject);
    procedure tbTimeChange(Sender: TObject);
    procedure tbbSaveClick(Sender: TObject);
    procedure tbbOpenClick(Sender: TObject);
    procedure tbbNewClick(Sender: TObject);
    procedure grdMainDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawWaveForm();
    procedure grdMainSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure imgDrawPaint(Sender: TObject);
    procedure tbbPlayClick(Sender: TObject);
    procedure PlayActiveSegment();
    procedure tmMainTimer(Sender: TObject);
    procedure UpdateSegmentData();
    procedure txtActiveSegChange(Sender: TObject);
    procedure EndPlayBack();
    procedure tbbStopClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure grdMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuUtilPopup(Sender: TObject);
    procedure rowwithonelogiclevel1Click(Sender: TObject);
    procedure Allwithonelogiclevel1Click(Sender: TObject);
    procedure Clockingpattern1Click(Sender: TObject);
    procedure Rowwithvalue1Click(Sender: TObject);
    procedure Copysegment1Click(Sender: TObject);
    procedure Pastesegment1Click(Sender: TObject);
    procedure Clearsegment1Click(Sender: TObject);
    procedure Selectedsegment1Click(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure Deletesegment1Click(Sender: TObject);
    procedure InsertSegment1Click(Sender: TObject);
    procedure Left1Click(Sender: TObject);
    procedure Left2Click(Sender: TObject);
    procedure OpenKPFile(filename : string);
    procedure FormShow(Sender: TObject);
    procedure AppInstances1CmdLineReceived(Sender: TObject;
      CmdLine: TStrings);
    procedure AboutKidogoPlayer1Click(Sender: TObject);
    function LoadDevice(var hid_dev : TJvHidDevice) : Boolean;
    procedure hid1DeviceChange(Sender: TObject);
    procedure SetHIDDevState(hid_dev : TJvHidDevice; is_load : Boolean);
    function hid1Enumerate(HidDev: TJvHidDevice;
      const Idx: Integer): Boolean;
    procedure hid1Removal(HidDev: TJvHidDevice);
    function SendToHIDDev(val_ : Integer) : Boolean;
    function CheckHIDDeviceOnline() : Boolean;
    procedure btnClearClick(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure Copysegmentvalue1Click(Sender: TObject);
    procedure SaveBinFile(filename : string);
    procedure SaveTxtFile(filename : string);
    procedure bttHomeClick(Sender: TObject);
    procedure tbbHelpClick(Sender: TObject);
    procedure KidogoHomepage1Click(Sender: TObject);
  private
    q_start, q_end : int64;
    stop_mark, sel_col, sel_row, kdp_format : Integer;
    usb_online : Boolean;
    kid_device : TJvHidDevice;
    hid_buffer : array [0..2] of Byte;
  public
    { Public declarations }
  end;

type
  PKPlayerData = ^TKPlayerData;
  TKPlayerData = record
    data_set: array [0..7] of byte;
  end;

var
  fmMain1: TfmMain1;

implementation

{$R *.dfm}

procedure TfmMain1.UpdateSegEditorLayout();
var
  pos : integer;
begin
  for pos := 1 to grdMain.ColCount - 1 do begin
    grdMain.Cells[pos,0] := inttostr(pos);
  end;
end;

procedure TfmMain1.UpdateTimeValues();
begin
  pnlTTime.Caption := inttostr(tbTime.Position * spSeg.Position)+' ms';
end;

procedure TfmMain1.ValidateEditor();
var
  col_, row_ : integer;
begin
  for col_ := 1 to 9 do begin
    for row_ := 1 to grdMain.ColCount - 1 do begin
      if(grdMain.Cells[row_,col_]<>'1') then
        grdMain.Cells[row_,col_] := '0';
    end;
  end;
end;

procedure TfmMain1.txtSegChange(Sender: TObject);
begin
  grdMain.ColCount := spSeg.Position + 1;
  if(spActiveSeg.Position > spSeg.Position) then
    spActiveSeg.Position := spSeg.Position;
  spActiveSeg.Max := spSeg.Position;
  UpdateSegEditorLayout;
  ValidateEditor;
  UpdateTimeValues;
  imgDraw.Repaint;
end;

procedure TfmMain1.InitUI();
var
  pos : integer;
begin
  for pos := 1 to 9 do
    grdMain.Cells[0,pos] := Chr(64+pos);
  ValidateEditor;
  imgDraw.Repaint;
  txtTimeChange(nil);
end;

procedure TfmMain1.FormCreate(Sender: TObject);
begin
  usb_online := false;
  kid_device := nil;
  txtSegChange(nil);
  sbMain.DoubleBuffered := true;
  InitUI;
  sel_row := 0;
  sel_col := 0;
  kdp_format := RegisterClipboardFormat(pchar(SYSTEM_ID));
end;

procedure TfmMain1.txtTimeChange(Sender: TObject);
begin
  tbTime.Position := StrToIntDef(trim(txtTime.Text), tbTime.Position);
  tmMain.Interval := tbTime.Position;
  UpdateTimeValues;
  imgDraw.Repaint;
end;

procedure TfmMain1.tbTimeChange(Sender: TObject);
begin
  txtTime.Text := inttostr(tbTime.Position);
end;

procedure TfmMain1.SaveBinFile(filename : string);
var
  mem_data : TMemoryStream; int_data : integer; col_, row_ : integer;
begin
  mem_data := TMemoryStream.Create;
  mem_data.Position := 0;
  mem_data.Write(FILE_ID,sizeof(FILE_ID));
  int_data := spSeg.position;
  mem_data.Write(int_data,sizeof(int_data));
  int_data := tbTime.Position;
  mem_data.Write(int_data,sizeof(int_data));
  int_data := 0;
  if(chkLoop.Checked) then
    int_data := 1;
  mem_data.Write(int_data,sizeof(int_data));
  for col_ := 1 to 9 do begin
    for row_ := 1 to grdMain.ColCount - 1 do begin
      int_data := StrToIntDef(grdMain.Cells[row_,col_],0);
      mem_data.Write(int_data,sizeof(int_data));
    end;
  end;
  mem_data.SaveToFile(filename);
  freeandnil(mem_data);
end;

procedure TfmMain1.SaveTxtFile(filename : string);
var
  val, pos, col_ : integer; file_ : TStringList;
begin
  file_ := TStringList.Create;
  for col_ := 1 to (grdMain.ColCount - 1) do begin
    val := 0;
    for pos := 1 to 8 do begin
      if(grdMain.Cells[col_,pos]='1') then
        val := val + Ceil(power(2,(pos-1)));
    end;
    if(col_ = (grdMain.ColCount - 1)) then
      file_.Add(inttostr(val))
    else
      file_.Add(inttostr(val)+',');
  end;
  file_.SaveToFile(filename);
  freeandnil(file_);
end;

procedure TfmMain1.tbbSaveClick(Sender: TObject);
begin
  if(dlgSave.Execute) then begin
    if (UpperCase(ExtractFileExt(dlgSave.FileName)) = '.KDF') then
      SaveBinFile(dlgSave.filename)
    else
      SaveTxtFile(dlgSave.filename);
  end;
end;

procedure TfmMain1.OpenKPFile(filename : string);
var
  mem_data : TMemoryStream; int_data : integer; col_, row_ : integer;
begin
  mem_data := TMemoryStream.Create;
  mem_data.LoadFromFile(filename);
  mem_data.Position := 0;
  mem_data.Read(int_data, sizeof(int_data));
  if(int_data = FILE_ID) then begin
    tbbNewClick(nil);
    mem_data.Read(int_data, sizeof(int_data));
    spSeg.position := int_data;
    mem_data.Read(int_data, sizeof(int_data));
    tbTime.Position := int_data;
    mem_data.Read(int_data, sizeof(int_data));
    chkLoop.Checked := (int_data = 1);
    txtSegChange(nil);
    tbTimeChange(nil);
    for col_ := 1 to 9 do begin
      for row_ := 1 to grdMain.ColCount - 1 do begin
        mem_data.Read(int_data, sizeof(int_data));
        grdMain.Cells[row_,col_] := Inttostr(int_data);
      end;
    end;
    grdMain.Invalidate;
    dlgSave.FileName := filename;
    dlgSave.FilterIndex := 1;
  end else
    MessageBox(handle,pchar('Invalid or corrupted Kidogo file "'+filename+'"'),pchar(Application.Title),MB_OK+MB_ICONHAND);
  freeandnil(mem_data);
end;

procedure TfmMain1.tbbOpenClick(Sender: TObject);
begin
  if(dlgOpen.Execute) then
    OpenKPFile(dlgOpen.FileName);
  imgDraw.Repaint;
end;

procedure TfmMain1.tbbNewClick(Sender: TObject);
var
  col_, row_ : integer;
begin
  q_start := 0;
  q_end := 0;
  spActiveSeg.Position := 1;
  spSeg.Position := 2;
  tbTime.Position := 15;
  chkLoop.Checked := false;
  for col_ := 1 to 9 do begin
    for row_ := 1 to spSeg.Max - 1 do begin
      grdMain.Cells[row_,col_] := '0';
    end;
  end;
  stMain.Panels[2].Text := '';
  stMain.Panels[3].Text := '';
  dlgSave.FileName := '';
  dlgSave.FilterIndex := 1;
  imgDraw.Repaint;
end;

procedure TfmMain1.grdMainDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 if((ACol > 0) and (ARow > 0)) then begin
   if(state = [gdSelected, gdFocused]) then begin
     grdMain.Canvas.Font.Color := clWhite;
     grdMain.Canvas.Brush.Color := clBlack;
   end else begin
     grdMain.Canvas.Brush.Color := COLOR_MAP[ARow -1];
     grdMain.Canvas.Font.Color := clBlack;
   end;
   grdMain.Canvas.FillRect(Rect);
   grdMain.Canvas.TextOut(Rect.Left+2, Rect.Top+2, grdMain.Cells[ACol, ARow]);
 end;
end;

procedure TfmMain1.DrawWaveForm();
var
  ref, lpos, row_, col_: Integer;
begin
  imgDraw.Width := (20* spSeg.Position)+80;
  imgDraw.Canvas.Brush.Color := sbMain.Color;
  imgDraw.Canvas.FillRect(imgDraw.ClientRect);
  imgDraw.Canvas.Pen.Style := psDot;
  imgDraw.Canvas.Pen.Color := clGreen;
  imgDraw.Canvas.Font.Color := clWhite;
  for ref := 1 to ((imgDraw.Width div 20)+1) do begin
    imgDraw.Canvas.MoveTo(20 * ref,0);
    imgDraw.Canvas.LineTo(20 * ref, 400);
    if((((ref-1) mod 10) = 0) and (ref > 1)) then
      imgDraw.Canvas.TextOut((20 * ref)+5, 345, InttoStr(ref-1));
  end;
  for ref := 1 to 20 do begin
    imgDraw.Canvas.MoveTo(0, 20*ref);
    imgDraw.Canvas.LineTo(imgDraw.Width, 20*ref);
  end;
  imgDraw.Canvas.Pen.Style := psSolid;
  imgDraw.Canvas.Font := self.Font;
  for row_ := 1 to 8 do begin
    imgDraw.Canvas.Font.Color := COLOR_MAP[row_-1];
    imgDraw.Canvas.TextOut(25, (40 * row_)-15, Chr(row_+64));
    imgDraw.Canvas.Pen.Color := COLOR_MAP[row_-1];
    imgDraw.Canvas.MoveTo(40,40 * row_);
    ref := 40;
    lpos:= 0;
    for col_ := 1 to grdMain.ColCount - 1 do begin
      if(lpos <> strtointdef(grdMain.Cells[col_, row_],0)) then begin
        imgDraw.Canvas.LineTo(ref, 40 * row_);
        imgDraw.Canvas.LineTo(ref, (40 * row_)-20);
      end;
      if(grdMain.Cells[col_, row_] = '0') then begin
        imgDraw.Canvas.LineTo(ref, 40 * row_);
        inc(ref,20);
        imgDraw.Canvas.LineTo(ref, 40 * row_);
      end else begin
        imgDraw.Canvas.LineTo(ref, (40 * row_)-20);
        inc(ref,20);
        imgDraw.Canvas.LineTo(ref, (40 * row_)-20);
      end;
      lpos := strtointdef(grdMain.Cells[col_, row_],0);
    end;
  end;
  imgDraw.Canvas.Pen.Color := clWhite;
  imgDraw.Canvas.MoveTo(40,0);
  imgDraw.Canvas.LineTo(40, 340);
end;

procedure TfmMain1.grdMainSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  if value = '' then
    exit
  else if(value <> '1') then
    grdMain.Cells[ACol, ARow]:='0';
  imgDraw.Repaint;
end;

procedure TfmMain1.imgDrawPaint(Sender: TObject);
begin
  DrawWaveForm;
end;

procedure TfmMain1.tbbPlayClick(Sender: TObject);
begin
  if not CheckHIDDeviceOnline then
    exit;
  if(Sender = tbbPlay) then
    spActiveSeg.Position := 1;
  if(Sender = btnPlayTo) then begin
    stop_mark := spActiveSeg.Position-1;
    spActiveSeg.Position := 1;
  end else
    stop_mark := spActiveSeg.Max;
  ledSim.Status := true;
  lblSim.Caption := 'Running';
  stMain.Panels[2].Text := '';
  stMain.Panels[3].Text := '';
  self.Repaint;
  tmMain.Enabled := true;
  QueryPerformanceCounter(q_start);
end;

procedure TfmMain1.PlayActiveSegment();
var
  val, pos : integer;

  function IsLineActive(id : integer) : Boolean;
  begin
    result := false;
    case (id) of
      1: result := chkA.Checked;
      2: result := chkB.Checked;
      3: result := chkC.Checked;
      4: result := chkD.Checked;
      5: result := chkE.Checked;
      6: result := chkF.Checked;
      7: result := chkG.Checked;
      8: result := chkH.Checked;
    end;
  end;

begin
  val := 0;
  for pos := 1 to 8 do begin
    if(IsLineActive(pos) and (grdMain.Cells[spActiveSeg.Position,pos]='1')) then
      val := val + Ceil(power(2,(pos-1)));
  end;
  SendToHIDDev(val);
end;

procedure TfmMain1.UpdateSegmentData();
begin
  lblSegId.Caption := format('%.3d',[spActiveSeg.Position]);
  lblTime.Caption := inttostr((spActiveSeg.Position * tbTime.position)) + ' ms';
end;

procedure TfmMain1.EndPlayBack();
var
  freq1 : Int64;
begin
  QueryPerformanceCounter(q_end);
  tmMain.Enabled := false;
  QueryPerformanceFrequency(freq1);
  ledSim.Status := false;
  lblSim.Caption := 'Ready';
  stMain.Panels[2].Text := 'Last playback session completed within: '+ floattostr((q_end-q_start)/freq1) + ' sec.';
  stMain.Panels[3].Text := 'Timing Error : '+ floattostr((((q_end-q_start)/freq1)*1000)-(tbTime.Position * spSeg.Position)) +' ms'
end;

procedure TfmMain1.tmMainTimer(Sender: TObject);
begin
  if(spActiveSeg.Position = stop_mark) then begin
    if(chkLoop.Checked) then
      spActiveSeg.Position := 1
    else
      EndPlayBack;
  end;
  PlayActiveSegment;
  spActiveSeg.Position := spActiveSeg.Position + 1;
end;

procedure TfmMain1.txtActiveSegChange(Sender: TObject);
begin
  UpdateSegmentData;
end;

procedure TfmMain1.tbbStopClick(Sender: TObject);
begin
  if tmMain.Enabled then
    EndPlayBack;
end;

procedure TfmMain1.btnBackClick(Sender: TObject);
begin
  if not CheckHIDDeviceOnline then
    exit;
  if(Sender = btnBack) then begin
    if(spActiveSeg.Position = spActiveSeg.Min) then begin
      if(chkLoop.Checked) then
        spActiveSeg.Position := spActiveSeg.Max;
    end else
      spActiveSeg.Position := spActiveSeg.Position - 1;
  end else begin
    if(spActiveSeg.Position = spActiveSeg.Max) then begin
      if(chkLoop.Checked) then
        spActiveSeg.Position := 1;
    end else
      spActiveSeg.Position := spActiveSeg.Position + 1;
  end;
  PlayActiveSegment;
end;

procedure TfmMain1.grdMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  grdMain.MouseToCell(x,y, sel_col, sel_row);
  if((sel_col > 0) and (sel_row > -1)) then begin
    if(sel_col > 0) then
      grdMain.Col := sel_col;
    if(sel_row > 0) then
      grdMain.Row := sel_row;
    grdMain.PopupMenu := mnuUtil;
  end else
    grdMain.PopupMenu := nil;
end;

procedure TfmMain1.mnuUtilPopup(Sender: TObject);
begin
  rowwithonelogiclevel1.Enabled := (sel_row > 0);
  Rowwithvalue1.Enabled := rowwithonelogiclevel1.Enabled;
  Clockingpattern1.Enabled := rowwithonelogiclevel1.Enabled;
  Left1.Enabled := rowwithonelogiclevel1.Enabled;
  Left2.Enabled := rowwithonelogiclevel1.Enabled;
  Right1.Enabled := rowwithonelogiclevel1.Enabled;
  Right2.Enabled := rowwithonelogiclevel1.Enabled;
end;

procedure TfmMain1.rowwithonelogiclevel1Click(Sender: TObject);
var
  ldlg : TfrmLLevel; pos : integer;
begin
  ldlg := TfrmLLevel.Create(self);
  if(ldlg.ShowModal = mrOK) then begin
    for pos := 1 to grdMain.ColCount - 1 do
      grdMain.Cells[pos, sel_row] := inttostr(ldlg.GetLogicLevel);
  end;
  freeandnil(ldlg);
  imgDraw.Repaint;
end;

procedure TfmMain1.Allwithonelogiclevel1Click(Sender: TObject);
var
  ldlg : TfrmLLevel; col_, row_ : integer;
begin
  ldlg := TfrmLLevel.Create(self);
  if(ldlg.ShowModal = mrOK) then begin
    for col_ := 1 to grdMain.ColCount - 1 do begin
      for row_ := 1 to 8 do
        grdMain.Cells[col_, row_] := inttostr(ldlg.GetLogicLevel);
    end;
  end;
  freeandnil(ldlg);
  imgDraw.Repaint;
end;

procedure TfmMain1.Clockingpattern1Click(Sender: TObject);
var
  clkdlg : TfrmClock; pos : Integer; curr_state: boolean;

  function MakeHighBits(pos : integer) : Integer;
  var
    cnt : integer;
  begin
    for cnt := 0 to clkdlg.spHigh.position-1 do
      grdMain.Cells[cnt + pos, sel_row] := '1';
    result := clkdlg.spHigh.position;
  end;

  function MakeLowBits(pos : integer) : Integer;
  var
    cnt : integer;
  begin
    for cnt := 0 to clkdlg.spLow.position-1 do
      grdMain.Cells[cnt + pos, sel_row] := '0';
    result := clkdlg.spLow.position;
  end;

begin
  clkdlg := TfrmClock.Create(self);
  if(clkdlg.ShowModal = mrOK) then begin
    pos := 1;
    curr_state := (clkdlg.GetLogicLevel = 1);
    while(pos < grdMain.ColCount) do begin
      if(curr_state) then
        pos := pos + MakeHighBits(pos)
      else
        pos := pos + MakeLowBits(pos);
      curr_state := not curr_state;
    end;
  end;
  freeandnil(clkdlg);
  imgDraw.Repaint;
end;

procedure TfmMain1.Rowwithvalue1Click(Sender: TObject);
var
  valdlg: TfrmValue; str_ : string; pos : integer;

  function IntToBin(val : integer; fill : Boolean): string;
  var
    pos : integer;
  begin
    pos := 8;
    if (fill) then
      result := StringofChar('0',pos)
    else
      result := StringofChar(' ',pos);
    while((val > 0)and(pos > 0)) do begin
      if((val and 1)=1) then
        result[pos] := '1'
      else
        result[pos] := '0';
      dec(pos);
      val := val shr 1;
    end;
  end;

begin
  valdlg := TfrmValue.Create(self);
  if(valdlg.ShowModal = mrOK) then begin
    str_ := trim(IntToBin(valdlg.upVal.Position, valdlg.chk8bit.Checked));
    for pos := 1 to Length(str_) do begin
      if((sel_col+(pos-1))<= grdMain.ColCount) then
        grdMain.Cells[sel_col+(pos-1),sel_row] := str_[pos];
    end;
  end;
  freeandnil(valdlg);
  imgDraw.Repaint;
end;

procedure TfmMain1.Copysegment1Click(Sender: TObject);
var
  d_handle_ : THandle; d_pointer : Pointer; d_array : PKPlayerData; pos : integer;
begin
  d_handle_ := GlobalAlloc(GMEM_FIXED or GMEM_ZEROINIT, (SizeOf(TKPlayerData)));
  d_pointer := GlobalLock(d_handle_);
  new(d_array);
  for pos := 1 to 8 do
    d_array^.data_set[pos-1] := strtointdef(grdMain.Cells[sel_col,pos],0);
  PKPlayerData(d_pointer)^ := PKPlayerData(d_array)^;
  Clipboard.Open;
  Clipboard.Clear;
  Clipboard.SetAsHandle(kdp_format, d_handle_);
  Clipboard.Close;
  GlobalUnlock(d_handle_);
end;

procedure TfmMain1.Pastesegment1Click(Sender: TObject);
var
  d_handle_ : THandle; d_pointer : Pointer; d_array : PKPlayerData; pos : integer;
begin
  Clipboard.Open;
  d_handle_ := Clipboard.GetAsHandle(kdp_format);
  if(d_handle_ <> 0) then begin
    d_pointer := GlobalLock(d_handle_);
    d_array := new(PKPlayerData);
    d_array^ := PKPlayerData(d_pointer)^;
    for pos := 1 to 8 do
      grdMain.Cells[sel_col,pos] := InttoStr(d_array^.data_set[pos-1]);
  end;
  Clipboard.Close;
  GlobalUnlock(d_handle_);
  imgDraw.Repaint;
end;

procedure TfmMain1.Clearsegment1Click(Sender: TObject);
var
  pos : integer;
begin
  for pos := 1 to 8 do
    grdMain.Cells[sel_col,pos] := '0';
  imgDraw.Repaint;
end;

procedure TfmMain1.Selectedsegment1Click(Sender: TObject);
var
  pos : integer;
begin
  for pos := 1 to 8 do begin
    if(grdMain.Cells[sel_col,pos] = '0') then
      grdMain.Cells[sel_col,pos] := '1'
    else
      grdMain.Cells[sel_col,pos] := '0';
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.All1Click(Sender: TObject);
var
  col_, row_ : integer;
begin
  for row_ := 1 to 8 do begin
   for col_ := 1 to grdMain.ColCount-1 do begin
     if(grdMain.Cells[col_,row_] = '0') then
      grdMain.Cells[col_,row_] := '1'
     else
      grdMain.Cells[col_,row_] := '0';
   end;
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.Deletesegment1Click(Sender: TObject);
var
  col_, row_ : integer;
begin
  if(sel_col = (grdMain.ColCount - 1)) then begin
    Clearsegment1Click(sender);
    if(spSeg.Position > spSeg.Min) then
      spSeg.Position := spSeg.Position - 1;
  end else begin
    for col_ := sel_col to (grdMain.ColCount - 2) do begin
      for row_ := 1 to 8 do
        grdMain.Cells[col_,row_] := grdMain.Cells[(col_+1),row_];
    end;
    for row_ := 1 to 8 do
      grdMain.Cells[(grdMain.ColCount-1),row_] := '0';
    if(spSeg.Position > spSeg.Min) then
      spSeg.Position := spSeg.Position - 1;
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.InsertSegment1Click(Sender: TObject);
var
  col_, row_ : integer;
begin
  if(grdMain.ColCount <= spSeg.Max) then begin
    spSeg.Position := spSeg.Position + 1;
    for col_ := (grdMain.ColCount - 1) downto sel_col do begin
      for row_ := 1 to 8 do
        grdMain.Cells[col_+1,row_] := grdMain.Cells[col_,row_];
    end;
    for row_ := 1 to 8 do
      grdMain.Cells[sel_col,row_] := '0';
    imgDraw.Repaint;
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.Left1Click(Sender: TObject);
var
  col_ : integer;
begin
  if(Sender = Left1) then begin
    for col_ := 1 to (grdMain.ColCount -2) do
      grdMain.Cells[col_, sel_row] := grdMain.Cells[(col_+1), sel_row];
    grdMain.Cells[(grdMain.ColCount -1), sel_row] := '0';
  end else begin
    for col_ := (grdMain.ColCount -1) downto 2 do
      grdMain.Cells[col_, sel_row] := grdMain.Cells[(col_-1), sel_row];
    grdMain.Cells[1, sel_row] := '0';
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.Left2Click(Sender: TObject);
var
  col_ : integer; val_ : string;
begin
  if(Sender = Left2) then begin
    val_ := grdMain.Cells[1, sel_row];
    for col_ := 1 to (grdMain.ColCount -2) do
      grdMain.Cells[col_, sel_row] := grdMain.Cells[(col_+1), sel_row];
    grdMain.Cells[(grdMain.ColCount -1), sel_row] := val_;
  end else begin
    val_ := grdMain.Cells[(grdMain.ColCount -1), sel_row];
    for col_ := (grdMain.ColCount -1) downto 2 do
      grdMain.Cells[col_, sel_row] := grdMain.Cells[(col_-1), sel_row];
    grdMain.Cells[1, sel_row] := val_;
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.FormShow(Sender: TObject);
begin
  if ParamCount > 0 then begin
    if fileexists(paramstr(1)) then
      OpenKPFile(Paramstr(1));
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.AppInstances1CmdLineReceived(Sender: TObject;
  CmdLine: TStrings);
begin
  if CmdLine.Count > 0 then begin
    if fileexists(CmdLine.Strings[0]) then
      OpenKPFile(CmdLine.Strings[0]);
  end;
  imgDraw.Repaint;
end;

procedure TfmMain1.AboutKidogoPlayer1Click(Sender: TObject);
var
  abtdlg : TfrmAbout;
begin
  abtdlg := TfrmAbout.Create(self);
  abtdlg.ShowModal;
  freeandnil(abtdlg);
end;

procedure TfmMain1.SetHIDDevState(hid_dev : TJvHidDevice; is_load : Boolean);
begin
  if is_load then begin
    if (Assigned(kid_device)) then
      kid_device := nil;
    try
      kid_device := hid_dev;
      usb_online := true;
      stMain.Panels[1].Text := 'Online';
    except
      usb_online := false;
      stMain.Panels[1].Text := 'Offline';
      tbbStopClick(nil);
    end;
  end else begin
    if (Assigned(kid_device)) then
      hid1.CheckIn(kid_device);
    kid_device := nil;
    usb_online := false;
    stMain.Panels[1].Text := 'Offline';
    tbbStopClick(nil);
  end;
  stMain.Repaint;
end;

function TfmMain1.LoadDevice(var hid_dev : TJvHidDevice) : Boolean;
begin
  if((hid_dev.Attributes.VendorID = USB_VID) and (hid_dev.Attributes.ProductID = USB_PID)) then begin
    SetHIDDevState(hid_dev, true);
    result := true;
  end else
    result := false;
end;

procedure TfmMain1.hid1DeviceChange(Sender: TObject);
var
  hid_ : TJvHidDevice;
begin
  while hid1.CheckOut(hid_) do begin
    hid_.NumInputBuffers := 128;
    hid_.NumOverlappedBuffers := 128;
    LoadDevice(hid_);
  end;
end;

function TfmMain1.hid1Enumerate(HidDev: TJvHidDevice;
  const Idx: Integer): Boolean;
var
  hid_ : TJvHidDevice;
begin
  hid1.CheckOutByIndex(hid_, Idx);
  hid_.NumInputBuffers := 128;
  hid_.NumOverlappedBuffers := 128;
  LoadDevice(hid_);
  result := true;
end;

procedure TfmMain1.hid1Removal(HidDev: TJvHidDevice);
var
  play_state : Boolean;
begin
  if((HidDev.Attributes.VendorID = USB_VID) and (HidDev.Attributes.ProductID = USB_PID)) then begin
    play_state := tmMain.Enabled;
    SetHIDDevState(HidDev, false);
    if play_state then
      MessageBox(handle, 'Kidogo USB hardware device is not available', pchar(Application.Title), MB_OK+ MB_ICONWARNING);
  end;
end;

function TfmMain1.SendToHIDDev(val_ : Integer) : Boolean;
var
  wrt_len, wrt_cnt: Cardinal;
begin
  hid_buffer[0] := 0;
  hid_buffer[1] := 0;
  hid_buffer[2] := val_;
  wrt_cnt := 0;
  try
    if usb_online then begin
      wrt_len := kid_device.Caps.OutputReportByteLength;
      result := kid_device.WriteFile(hid_buffer, wrt_len, wrt_cnt);
    end else
      result := false;
  except
    result := false;
  end;
end;

function TfmMain1.CheckHIDDeviceOnline() : Boolean;
begin
  result := usb_online;
  if (not usb_online) then
    MessageBox(handle, 'Kidogo USB hardware device is not available', PChar(Application.Title), MB_OK + MB_ICONWARNING);
end;

procedure TfmMain1.btnClearClick(Sender: TObject);
begin
  if not CheckHIDDeviceOnline then
    exit;
  if (not tmMain.Enabled) then
    SendToHIDDev(0);   
end;

procedure TfmMain1.ApplicationEvents1ShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if((Msg.CharCode = VK_F9) and (GetKeyState(VK_SHIFT)>=0)) then begin
    tbbPlayClick(tbbPlay);
    Handled := true;
  end else if((Msg.CharCode = VK_F7) and (GetKeyState(VK_SHIFT)>=0) and (GetKeyState(VK_CONTROL)>=0)) then begin
    btnBackClick(btnBack);
    Handled := true;
  end else if((Msg.CharCode = VK_F8) and (GetKeyState(VK_SHIFT)>=0) and (GetKeyState(VK_CONTROL)>=0)) then begin
    btnBackClick(btnNext);
    Handled := true;
  end else if((Msg.CharCode = VK_F2) and (GetKeyState(VK_SHIFT)>=0) and (GetKeyState(VK_CONTROL)>=0)) then begin
    tbbStopClick(tbbStop);
    Handled := true;
  end else if((Msg.CharCode = VK_F5) and (GetKeyState(VK_SHIFT)>=0) and (GetKeyState(VK_CONTROL)>=0)) then begin
    tbbPlayClick(btnPlay);
    Handled := true;
  end else if((Msg.CharCode = VK_F5) and (GetKeyState(VK_SHIFT)<0) and (GetKeyState(VK_CONTROL)>=0)) then begin
    tbbPlayClick(btnPlayTo);
    Handled := true;
  end else if((Msg.CharCode = VK_F4) and (GetKeyState(VK_SHIFT)>=0) and (GetKeyState(VK_CONTROL)>=0)) then begin
    btnClearClick(btnClear);
    Handled := true;
  end else if((Msg.CharCode = 83) and (GetKeyState(VK_CONTROL)<0) and (GetKeyState(VK_SHIFT)>=0)) then begin
    tbbSaveClick(tbbSave);
    Handled := true;
  end else if((Msg.CharCode = 78) and (GetKeyState(VK_CONTROL)<0) and (GetKeyState(VK_SHIFT)>=0)) then begin
    tbbNewClick(tbbNew);
    Handled := true;
  end else if((Msg.CharCode = 79) and (GetKeyState(VK_CONTROL)<0) and (GetKeyState(VK_SHIFT)>=0)) then begin
    tbbOpenClick(tbbOpen);
    Handled := true;
  end;
end;

procedure TfmMain1.Copysegmentvalue1Click(Sender: TObject);
var
  val, pos : integer;
begin
  val := 0;
  for pos := 1 to 8 do begin
    if(grdMain.Cells[sel_col,pos]='1') then
      val := val + Ceil(power(2,(pos-1)));
  end;
  Clipboard.Open;
  Clipboard.SetTextBuf(PChar(Inttostr(val)));
  Clipboard.Close;
end;

procedure TfmMain1.bttHomeClick(Sender: TObject);
begin
  ShellExecute(handle,'open', 'http://github.com/dilshan/kidogo', '','', SW_SHOW);
end;

procedure TfmMain1.tbbHelpClick(Sender: TObject);
begin
  ShellExecute(handle,'open', 'http://github.com/dilshan/kidogo', '','', SW_SHOW);
end;

procedure TfmMain1.KidogoHomepage1Click(Sender: TObject);
begin
  ShellExecute(handle,'open', 'http://github.com/dilshan/kidogo', '','', SW_SHOW);
end;

end.
