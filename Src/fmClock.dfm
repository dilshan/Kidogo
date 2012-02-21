object frmClock: TfrmClock
  Left = 450
  Top = 320
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Generate Clock  '
  ClientHeight = 163
  ClientWidth = 213
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
    Width = 58
    Height = 13
    Caption = 'Initial state:'
  end
  object Label2: TLabel
    Left = 9
    Top = 65
    Width = 86
    Height = 13
    Caption = 'Length of Logic 1:'
  end
  object Label3: TLabel
    Left = 9
    Top = 97
    Width = 86
    Height = 13
    Caption = 'Length of Logic 0:'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 122
    Width = 208
    Height = 9
    Shape = bsTopLine
  end
  object rbZero: TRadioButton
    Left = 88
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Logic Level Zero (0)'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object rbOne: TRadioButton
    Left = 88
    Top = 32
    Width = 113
    Height = 17
    Caption = 'Logic Level One (1)'
    TabOrder = 1
  end
  object txtHigh: TEdit
    Left = 108
    Top = 62
    Width = 34
    Height = 21
    MaxLength = 3
    TabOrder = 2
    Text = '1'
  end
  object spHigh: TUpDown
    Left = 142
    Top = 62
    Width = 15
    Height = 21
    Associate = txtHigh
    Min = 1
    Max = 512
    Position = 1
    TabOrder = 3
  end
  object txtLow: TEdit
    Left = 108
    Top = 94
    Width = 34
    Height = 21
    MaxLength = 3
    TabOrder = 4
    Text = '1'
  end
  object spLow: TUpDown
    Left = 142
    Top = 94
    Width = 15
    Height = 21
    Associate = txtLow
    Min = 1
    Max = 512
    Position = 1
    TabOrder = 5
  end
  object btnOK: TButton
    Left = 72
    Top = 134
    Width = 65
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 6
  end
  object btnCancel: TButton
    Left = 144
    Top = 134
    Width = 65
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
end
