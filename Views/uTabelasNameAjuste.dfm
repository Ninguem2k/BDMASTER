object frmJusteTabelaNome: TfrmJusteTabelaNome
  Left = 0
  Top = 0
  Caption = 'Juste do Nome das Tabelas'
  ClientHeight = 612
  ClientWidth = 1169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1169
    Height = 559
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Tabelas'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1165
        Height = 530
        Align = alClient
        Caption = 'Tables'
        TabOrder = 0
        ExplicitWidth = 1161
        ExplicitHeight = 529
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 243
          Top = 6
          Width = 70
          Height = 518
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          Padding.Left = 10
          Padding.Top = 10
          Padding.Right = 10
          Padding.Bottom = 10
          TabOrder = 0
          ExplicitHeight = 517
          object BtnInserirTudo: TButton
            Left = 14
            Top = 232
            Width = 40
            Height = 40
            Caption = '>>'
            DisabledImageName = 'BtnInserirTudoClick'
            ImageMargins.Left = 10
            ImageMargins.Top = 10
            ImageMargins.Right = 10
            ImageMargins.Bottom = 10
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = BtnInserirTudoClick
          end
          object BtnRemover: TButton
            Left = 14
            Top = 168
            Width = 40
            Height = 40
            Caption = '<'
            DisabledImageName = 'BtnRemover'
            ImageMargins.Left = 10
            ImageMargins.Top = 10
            ImageMargins.Right = 10
            ImageMargins.Bottom = 10
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BtnRemoverClick
          end
          object BtnInserir: TButton
            Left = 14
            Top = 122
            Width = 40
            Height = 40
            Caption = '>'
            ImageMargins.Left = 10
            ImageMargins.Top = 10
            ImageMargins.Right = 10
            ImageMargins.Bottom = 10
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BtnInserirClick
          end
          object BtnRemoverTudo: TButton
            Left = 14
            Top = 278
            Width = 40
            Height = 40
            Caption = '<<'
            DisabledImageName = 'BtnRemoverTudo'
            ImageMargins.Left = 10
            ImageMargins.Top = 10
            ImageMargins.Right = 10
            ImageMargins.Bottom = 10
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BtnRemoverTudoClick
          end
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 227
          Height = 518
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          TabOrder = 1
          ExplicitHeight = 517
          object GrpItensDisponiveis: TGroupBox
            Left = 1
            Top = 1
            Width = 216
            Height = 516
            Align = alLeft
            Caption = 'Itens Dispon'#237'veis'
            TabOrder = 0
            ExplicitHeight = 515
            object ListBoxTabelas: TListBox
              Left = 2
              Top = 17
              Width = 212
              Height = 497
              Align = alClient
              ImeName = 'Portuguese (Brazilian ABNT)'
              ItemHeight = 15
              TabOrder = 0
            end
          end
        end
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 323
          Top = 6
          Width = 225
          Height = 517
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          TabOrder = 2
          object GrpItensSelecionados: TGroupBox
            Left = 1
            Top = 1
            Width = 223
            Height = 516
            Align = alClient
            Caption = 'Itens Selecionados'
            TabOrder = 0
            ExplicitHeight = 515
            object Panel2: TPanel
              Left = 184
              Top = 17
              Width = 37
              Height = 497
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitHeight = 496
              object BtnTipoOrdem: TSpeedButton
                Left = 8
                Top = 120
                Width = 23
                Height = 22
                Flat = True
                ParentShowHint = False
                ShowHint = True
              end
              object Button1: TButton
                Left = 6
                Top = 188
                Width = 27
                Height = 25
                Caption = '<'
                TabOrder = 0
                OnClick = Button1Click
              end
            end
            object ListBoxSelecionadas: TListBox
              Left = 2
              Top = 17
              Width = 182
              Height = 497
              Align = alClient
              ImeName = 'Portuguese (Brazilian ABNT)'
              ItemHeight = 15
              TabOrder = 1
              OnDblClick = ListBoxSelecionadasDblClick
            end
          end
        end
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 558
          Top = 6
          Width = 227
          Height = 517
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alLeft
          TabOrder = 3
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 216
            Height = 516
            Align = alLeft
            Caption = 'Itens do Banco de Destino'
            TabOrder = 0
            ExplicitHeight = 515
            object ListBoxEXP: TListBox
              Left = 2
              Top = 17
              Width = 212
              Height = 497
              Align = alClient
              ImeName = 'Portuguese (Brazilian ABNT)'
              ItemHeight = 15
              TabOrder = 0
            end
          end
        end
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 789
          Top = 4
          Width = 368
          Height = 521
          Align = alRight
          BorderWidth = 2
          BorderStyle = bsSingle
          TabOrder = 4
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'SQLs'
      ImageIndex = 1
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 692
        Top = 3
        Width = 470
        Height = 524
        Align = alRight
        BorderWidth = 2
        BorderStyle = bsSingle
        TabOrder = 0
        ExplicitLeft = 478
        ExplicitHeight = 553
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 470
        Height = 524
        Align = alLeft
        BorderWidth = 2
        BorderStyle = bsSingle
        TabOrder = 1
        ExplicitHeight = 553
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Registros'
      ImageIndex = 2
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 490
        Height = 530
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 559
        object ListBox1: TListBox
          Left = 0
          Top = 0
          Width = 486
          Height = 526
          Align = alClient
          ImeName = 'Portuguese (Brazilian ABNT)'
          ItemHeight = 15
          TabOrder = 0
        end
      end
      object ScrollBox2: TScrollBox
        Left = 706
        Top = 0
        Width = 455
        Height = 529
        Align = alRight
        TabOrder = 1
        ExplicitLeft = 496
        ExplicitHeight = 559
        object ListBox2: TListBox
          Left = 0
          Top = 0
          Width = 451
          Height = 526
          Align = alClient
          ImeName = 'Portuguese (Brazilian ABNT)'
          ItemHeight = 15
          TabOrder = 0
        end
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 559
    Width = 1169
    Height = 53
    Align = alBottom
    TabOrder = 1
    object SpeedButton2: TSpeedButton
      Left = 7
      Top = 6
      Width = 142
      Height = 44
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Mostrar Query'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = False
      Transparent = False
      StyleElements = []
      StyleName = 'Windows'
    end
    object SpeedButton3: TSpeedButton
      Left = 155
      Top = 6
      Width = 142
      Height = 44
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Comparar Query'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = False
      Transparent = False
      StyleElements = []
      StyleName = 'Windows'
    end
    object SpeedButton1: TSpeedButton
      Left = 1027
      Top = 6
      Width = 142
      Height = 44
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000002000000070000000C0000001000000012000000110000
        000E000000080000000200000000000000000000000000000000000000000000
        000100000004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A53
        3AD20F2F21840001011500000005000000010000000000000000000000000000
        0005050F0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE
        80FF258560FF1A563DD405110C3D00000007000000010000000000000003040E
        0A31206548ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C9
        96FF32CA99FF2BA479FF227050F805110C3D00000005000000000000000A1A57
        3DD02EA57CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB
        99FF31CB98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A
        66FF3BCD9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3
        A8FF36CF9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB3
        8CFF39CD9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4
        A1FF43D5A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCA
        A4FF44D2A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B75
        4FFF60DCB8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9
        B8FF46D3A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A2
        8BFF46A685FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9
        BEFF52DAB1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EA
        E7FF4F886CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8
        B0FF62E0BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E
        76FFE6E1DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C
        7BFF95ECD6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A1
        7EFF1F6D4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F
        46B578C6ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEA
        C9FF5ED6B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A
        0718247B5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2
        DDFFBAF4E7FF78CDB3FF2A906DEA0615102E0000000200000000000000000000
        0001030A07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8
        C1FF4BB692FF237F60CB05130E27000000030000000000000000000000000000
        000000000001000000030A241B411B60489D258464CF2C9D77EE258867CF1F71
        56B00E3226560000000600000002000000000000000000000000}
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = False
      Transparent = False
      StyleElements = []
      StyleName = 'Windows'
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 303
      Top = 6
      Width = 142
      Height = 44
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Comparar Registros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = False
      Transparent = False
      StyleElements = []
      StyleName = 'Windows'
    end
  end
  object FDConnection1: TFDConnection
    Left = 520
    Top = 496
  end
  object qryTables: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT a.RDB$RELATION_NAME'
      'FROM RDB$RELATIONS a'
      'WHERE COALESCE(RDB$SYSTEM_FLAG, 0) = 0 AND RDB$RELATION_TYPE = 0')
    Left = 516
    Top = 353
  end
  object FDConnection2: TFDConnection
    Left = 520
    Top = 432
  end
end
