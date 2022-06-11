object frmEanPictures_DataLoad: TfrmEanPictures_DataLoad
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'EanPictures & CNPJ - DEMO'
  ClientHeight = 480
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Filter data'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 56
    Width = 860
    Height = 424
    ActivePage = example
    Align = alBottom
    TabOrder = 2
    object example: TTabSheet
      Caption = 'RESULTADO DA CONSULTA'
      ImageIndex = 1
      object imgproduct: TImage
        Left = 578
        Top = 104
        Width = 167
        Height = 161
        Stretch = True
      end
      object CNPJ: TLabeledEdit
        Left = 24
        Top = 64
        Width = 186
        Height = 21
        EditLabel.Width = 25
        EditLabel.Height = 13
        EditLabel.Caption = 'CNPJ'
        TabOrder = 2
      end
      object IE: TLabeledEdit
        Left = 216
        Top = 64
        Width = 177
        Height = 21
        EditLabel.Width = 10
        EditLabel.Height = 13
        EditLabel.Caption = 'IE'
        TabOrder = 3
      end
      object Razao: TLabeledEdit
        Left = 24
        Top = 104
        Width = 369
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Razao'
        TabOrder = 5
      end
      object Fantasia: TLabeledEdit
        Left = 24
        Top = 152
        Width = 369
        Height = 21
        EditLabel.Width = 41
        EditLabel.Height = 13
        EditLabel.Caption = 'Fantasia'
        TabOrder = 7
      end
      object Endereco: TLabeledEdit
        Left = 24
        Top = 197
        Width = 369
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endereco'
        TabOrder = 9
      end
      object Bairro: TLabeledEdit
        Left = 24
        Top = 240
        Width = 121
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        TabOrder = 11
      end
      object CEP: TLabeledEdit
        Left = 24
        Top = 280
        Width = 121
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'CEP'
        TabOrder = 15
      end
      object Cidade: TLabeledEdit
        Left = 151
        Top = 240
        Width = 191
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        TabOrder = 12
      end
      object Estado: TLabeledEdit
        Left = 348
        Top = 240
        Width = 45
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Estado'
        TabOrder = 13
      end
      object Email: TLabeledEdit
        Left = 151
        Top = 280
        Width = 242
        Height = 21
        CharCase = ecLowerCase
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        TabOrder = 16
      end
      object Produto: TLabeledEdit
        Left = 432
        Top = 64
        Width = 313
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'Produto'
        TabOrder = 4
      end
      object NCM: TLabeledEdit
        Left = 432
        Top = 104
        Width = 121
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'NCM'
        TabOrder = 6
      end
      object CEST: TLabeledEdit
        Left = 432
        Top = 197
        Width = 121
        Height = 21
        EditLabel.Width = 25
        EditLabel.Height = 13
        EditLabel.Caption = 'CEST'
        TabOrder = 10
      end
      object Marca: TLabeledEdit
        Left = 432
        Top = 152
        Width = 121
        Height = 21
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Marca'
        TabOrder = 8
      end
      object Peso: TLabeledEdit
        Left = 432
        Top = 240
        Width = 121
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'Peso'
        TabOrder = 14
      end
      object Button2: TButton
        Left = 24
        Top = 16
        Width = 99
        Height = 25
        Caption = 'Consultar CNPJ'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 432
        Top = 16
        Width = 105
        Height = 25
        Caption = 'Consultar Produto'
        TabOrder = 1
        OnClick = Button3Click
      end
    end
    object return: TTabSheet
      Caption = 'RETORNO EM JSON'
      object GroupBox1: TGroupBox
        Left = 312
        Top = 34
        Width = 521
        Height = 311
        Caption = 'log'
        TabOrder = 4
        object Memo1: TMemo
          Left = 2
          Top = 15
          Width = 517
          Height = 294
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 34
        Width = 273
        Height = 311
        Caption = 'picture'
        TabOrder = 3
        object Image1: TImage
          Left = 2
          Top = 15
          Width = 269
          Height = 294
          Align = alClient
          Stretch = True
          ExplicitLeft = -33
          ExplicitTop = -115
          ExplicitWidth = 194
          ExplicitHeight = 276
        end
      end
      object Button1: TButton
        Left = 18
        Top = 3
        Width = 271
        Height = 25
        Caption = 'Buscar Foto (www.eanpictures.com.br)'
        TabOrder = 0
        OnClick = Button1Click
      end
      object BitBtn1: TBitBtn
        Left = 312
        Top = 3
        Width = 270
        Height = 25
        Caption = 'Buscar Dados Produtos (www.EanPictures.com.br)'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 588
        Top = 3
        Width = 243
        Height = 25
        Caption = 'Buscar dados sobre o cnpj (DataLoad.com.br)'
        TabOrder = 2
        OnClick = BitBtn2Click
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 27
    Width = 217
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = ComboBox1Change
    OnClick = ComboBox1Click
    Items.Strings = (
      'ean'
      'description cnpj')
  end
  object edtvalue: TEdit
    Left = 231
    Top = 27
    Width = 201
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 800
    Top = 8
  end
end
