object frmNovaConnec: TfrmNovaConnec
  Left = 0
  Top = 0
  Caption = 'frmNovaConnec'
  ClientHeight = 543
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 543
    Align = alClient
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitWidth = 772
    ExplicitHeight = 544
    object pnEXCEL: TPanel
      Left = 400
      Top = 93
      Width = 350
      Height = 279
      TabOrder = 6
      Visible = False
      object ComboBox9: TComboBox
        Left = 176
        Top = 27
        Width = 161
        Height = 23
        TabOrder = 0
        Text = 'ComboBox1'
      end
      object TLinkLabel
        Left = 15
        Top = 28
        Width = 84
        Height = 19
        Caption = 'Arquivo EXCEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnCSV: TPanel
      Left = 400
      Top = 93
      Width = 350
      Height = 279
      TabOrder = 7
      Visible = False
      object ComboBox7: TComboBox
        Left = 176
        Top = 27
        Width = 161
        Height = 23
        TabOrder = 0
        Text = 'ComboBox1'
      end
      object TLinkLabel
        Left = 15
        Top = 28
        Width = 73
        Height = 19
        Caption = 'Arquivo CSV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnBD: TPanel
      Left = 400
      Top = 93
      Width = 350
      Height = 279
      TabOrder = 2
      object LinkLabel5: TLinkLabel
        Left = 15
        Top = 16
        Width = 77
        Height = 19
        Caption = 'Tipo de Rede'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ComboBox3: TComboBox
        Left = 105
        Top = 12
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 1
        TextHint = 'Selecione'
        OnClick = ComboBox3Click
        Items.Strings = (
          'Mysql or MariaDB'
          'FireBird'
          'SQLlite')
      end
      object ComboBox4: TComboBox
        Left = 105
        Top = 41
        Width = 233
        Height = 23
        TabOrder = 2
        TextHint = 'Selecione'
        OnClick = ComboBox4Click
      end
      object IPExtEdit: TEdit
        Left = 105
        Top = 78
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 3
        Text = '127.0.0.1'
        TextHint = 'Digite'
      end
      object UserNameExtEdit: TEdit
        Left = 105
        Top = 136
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 4
        Text = 'sysdba'
        TextHint = 'Digite'
      end
      object PasswordExtEdit: TEdit
        Left = 105
        Top = 165
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 5
        TextHint = 'Digite'
      end
      object LinkLabel6: TLinkLabel
        Left = 15
        Top = 41
        Width = 59
        Height = 19
        Caption = 'Biblioteca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object LinkLabel7: TLinkLabel
        Left = 15
        Top = 82
        Width = 77
        Height = 19
        Caption = 'Servidor / IP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object LinkLabel8: TLinkLabel
        Left = 15
        Top = 136
        Width = 49
        Height = 19
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object LinkLabel9: TLinkLabel
        Left = 15
        Top = 169
        Width = 38
        Height = 19
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object PortaExtEdit: TEdit
        Left = 105
        Top = 194
        Width = 56
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 10
        Text = '3050'
        TextHint = 'Digite'
      end
      object LinkLabel10: TLinkLabel
        Left = 15
        Top = 198
        Width = 37
        Height = 19
        Caption = 'Porta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
      object ComboBox6: TComboBox
        Left = 105
        Top = 235
        Width = 233
        Height = 23
        TabOrder = 12
        TextHint = 'Selecione'
        OnClick = ComboBox6Click
      end
      object LinkLabel13: TLinkLabel
        Left = 15
        Top = 236
        Width = 38
        Height = 19
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
      end
      object DataBaseEdit: TEdit
        Left = 105
        Top = 236
        Width = 214
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 14
        TextHint = 'Digite'
      end
      object BibliotecaExtEdit: TEdit
        Left = 105
        Top = 41
        Width = 214
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 15
        TextHint = 'Digite'
      end
      object TipoRedeExtEdit: TEdit
        Left = 105
        Top = 12
        Width = 214
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 16
        TextHint = 'Digite'
      end
    end
    object Panel4: TPanel
      Left = 488
      Top = 391
      Width = 262
      Height = 50
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 0
      object Button1: TButton
        Left = 6
        Top = 6
        Width = 121
        Height = 38
        Align = alLeft
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = Button1Click
        ExplicitLeft = 17
        ExplicitTop = -15
        ExplicitHeight = 45
      end
      object Button2: TButton
        Left = 135
        Top = 6
        Width = 121
        Height = 38
        Align = alRight
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = Button2Click
        ExplicitLeft = 151
        ExplicitTop = -15
        ExplicitHeight = 45
      end
    end
    object Panel2: TPanel
      Left = 24
      Top = 93
      Width = 350
      Height = 279
      TabOrder = 1
      object Label10: TLabel
        Left = 18
        Top = 236
        Width = 34
        Height = 15
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object eTipoBanco: TLinkLabel
        Left = 16
        Top = 16
        Width = 77
        Height = 19
        Caption = 'Tipo de Rede'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ComboBox2: TComboBox
        Left = 105
        Top = 41
        Width = 233
        Height = 23
        TabOrder = 1
        TextHint = 'Selecione'
        OnClick = ComboBox2Click
      end
      object IPEdit: TEdit
        Left = 104
        Top = 78
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 2
        Text = '127.0.0.1'
        TextHint = 'Digite'
      end
      object UserNameEdit: TEdit
        Left = 104
        Top = 136
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 3
        Text = 'sysdba'
        TextHint = 'Digite'
      end
      object PasswordEdit: TEdit
        Left = 104
        Top = 165
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 4
        TextHint = 'Digite'
      end
      object LinkLabel1: TLinkLabel
        Left = 16
        Top = 41
        Width = 59
        Height = 19
        Caption = 'Biblioteca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object LinkLabel2: TLinkLabel
        Left = 16
        Top = 82
        Width = 77
        Height = 19
        Caption = 'Servidor / IP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object LinkLabel3: TLinkLabel
        Left = 16
        Top = 136
        Width = 49
        Height = 19
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object Senha: TLinkLabel
        Left = 16
        Top = 169
        Width = 38
        Height = 19
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object PortaEdit: TEdit
        Left = 104
        Top = 194
        Width = 57
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 9
        Text = '3050'
        TextHint = 'Digite'
      end
      object LinkLabel4: TLinkLabel
        Left = 16
        Top = 198
        Width = 37
        Height = 19
        Caption = 'Porta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object CAMINHOBANCO: TComboBox
        Left = 104
        Top = 235
        Width = 233
        Height = 23
        TabOrder = 11
        TextHint = 'Selecione'
        OnChange = CAMINHOBANCOChange
      end
      object cbTREDE: TComboBox
        Left = 104
        Top = 12
        Width = 233
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        ItemIndex = 0
        TabOrder = 12
        Text = 'Mysql or MariaDB'
        TextHint = 'Selecione'
        OnClick = cbTREDEClick
        Items.Strings = (
          'Mysql or MariaDB'
          'FireBird'
          'SQLlite')
      end
      object TipoRedeEdit: TEdit
        Left = 105
        Top = 12
        Width = 214
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 13
        TextHint = 'Digite'
      end
      object DataBaseExtEdit: TEdit
        Left = 105
        Top = 236
        Width = 214
        Height = 23
        ParentCustomHint = False
        ImeName = 'Portuguese (Brazilian ABNT)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        TextHint = 'Digite'
      end
      object BibliotecaEdit: TEdit
        Left = 105
        Top = 41
        Width = 214
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 15
        TextHint = 'Digite'
      end
    end
    object LinkLabel11: TLinkLabel
      Left = 24
      Top = 68
      Width = 69
      Height = 19
      Caption = 'INSERINDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object LinkLabel12: TLinkLabel
      Left = 400
      Top = 68
      Width = 73
      Height = 19
      Caption = 'COLETANDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object Panel6: TPanel
      Left = 488
      Top = 13
      Width = 268
      Height = 39
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 5
      object BD: TButton
        Left = 6
        Top = 6
        Width = 80
        Height = 27
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alLeft
        Caption = 'Banco'
        ImageMargins.Left = 2
        ImageMargins.Top = 2
        ImageMargins.Right = 2
        ImageMargins.Bottom = 2
        TabOrder = 0
        OnClick = BDClick
      end
      object EXCEL: TButton
        Left = 182
        Top = 6
        Width = 80
        Height = 27
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alRight
        Caption = 'Excel'
        ImageMargins.Left = 2
        ImageMargins.Top = 2
        ImageMargins.Right = 2
        ImageMargins.Bottom = 2
        TabOrder = 1
        OnClick = EXCELClick
        ExplicitLeft = 156
      end
      object CSV: TButton
        Left = 86
        Top = 6
        Width = 96
        Height = 27
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 10
        Align = alClient
        Caption = 'CSV'
        ImageMargins.Left = 2
        ImageMargins.Top = 2
        ImageMargins.Right = 2
        ImageMargins.Bottom = 2
        TabOrder = 2
        OnClick = CSVClick
        ExplicitLeft = 98
        ExplicitTop = 5
        ExplicitWidth = 80
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 416
  end
end
