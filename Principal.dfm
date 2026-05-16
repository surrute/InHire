object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'InHire'
  ClientHeight = 348
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 30
    Top = 115
    Width = 13
    Height = 15
    Caption = 'Id:'
  end
  object Label2: TLabel
    Left = 48
    Top = 144
    Width = 153
    Height = 15
    Caption = '0 retorna todos os registros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bbInserir5Clientes: TBitBtn
    Left = 24
    Top = 23
    Width = 137
    Height = 65
    Caption = 'Inserir 5 Clientes'
    TabOrder = 0
    OnClick = bbInserir5ClientesClick
  end
  object bbInserir5Carros: TBitBtn
    Left = 168
    Top = 23
    Width = 137
    Height = 65
    Caption = 'Inserir 5 Carros'
    TabOrder = 1
    OnClick = bbInserir5CarrosClick
  end
  object bbInserir5Vendas: TBitBtn
    Left = 312
    Top = 23
    Width = 137
    Height = 65
    Caption = 'Inserir 5 Vendas'
    TabOrder = 2
    OnClick = bbInserir5VendasClick
  end
  object GroupBox: TGroupBox
    Left = 24
    Top = 168
    Width = 425
    Height = 161
    Caption = 'Consulta'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 16
      Top = 24
      Width = 393
      Height = 120
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object edtConsulta: TEdit
    Left = 49
    Top = 112
    Width = 81
    Height = 23
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 4
    Text = '0'
  end
  object bbConsultaCliente: TBitBtn
    Left = 136
    Top = 111
    Width = 95
    Height = 25
    Caption = 'Cliente'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00DDDDDDDDD
      DDDDD000DDDDDDDDDDDDDD000DDDDDDDDDDDDDD000D800008DDDDDDD00007777
      00DDDDDDD08EE777780DDDDD807E77777708DDDD07E777777770DDDD07777777
      7770DDDD077777777E70DDDD077777777E70DDDD80777777EE08DDDDD08777EE
      E80DDDDDDD00777700DDDDDDDDD800008DDDDDDDDDDDDDDDDDDD}
    TabOrder = 5
    OnClick = bbConsultaClienteClick
  end
  object bbConsultaCarro: TBitBtn
    Left = 237
    Top = 111
    Width = 95
    Height = 25
    Caption = 'Carro'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00DDDDDDDDD
      DDDDD000DDDDDDDDDDDDDD000DDDDDDDDDDDDDD000D800008DDDDDDD00007777
      00DDDDDDD08EE777780DDDDD807E77777708DDDD07E777777770DDDD07777777
      7770DDDD077777777E70DDDD077777777E70DDDD80777777EE08DDDDD08777EE
      E80DDDDDDD00777700DDDDDDDDD800008DDDDDDDDDDDDDDDDDDD}
    TabOrder = 6
    OnClick = bbConsultaCarroClick
  end
  object bbConsultaVenda: TBitBtn
    Left = 338
    Top = 111
    Width = 95
    Height = 25
    Caption = 'Venda'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00DDDDDDDDD
      DDDDD000DDDDDDDDDDDDDD000DDDDDDDDDDDDDD000D800008DDDDDDD00007777
      00DDDDDDD08EE777780DDDDD807E77777708DDDD07E777777770DDDD07777777
      7770DDDD077777777E70DDDD077777777E70DDDD80777777EE08DDDDD08777EE
      E80DDDDDDD00777700DDDDDDDDD800008DDDDDDDDDDDDDDDDDDD}
    TabOrder = 7
    OnClick = bbConsultaVendaClick
  end
  object DataSource: TDataSource
    Left = 232
    Top = 224
  end
end
