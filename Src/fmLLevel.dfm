object frmLLevel: TfrmLLevel
  Left = 511
  Top = 309
  ActiveControl = rbZero
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Logic Levels'
  ClientHeight = 98
  ClientWidth = 164
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 9
    Width = 25
    Height = 13
    Caption = 'Use: '
  end
  object Bevel1: TBevel
    Left = 2
    Top = 57
    Width = 160
    Height = 9
    Shape = bsTopLine
  end
  object rbZero: TRadioButton
    Left = 44
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Logic Level Zero (0)'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object rbOne: TRadioButton
    Left = 44
    Top = 32
    Width = 113
    Height = 17
    Caption = 'Logic Level One (1)'
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 96
    Top = 69
    Width = 65
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 24
    Top = 69
    Width = 65
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
end
