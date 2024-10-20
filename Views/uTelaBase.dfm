object frmTelaBase: TfrmTelaBase
  Left = 0
  Top = 0
  Caption = 'frmTelaBase'
  ClientHeight = 422
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 403
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitWidth = 641
    ExplicitHeight = 434
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 403
    Width = 628
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = 1
    ExplicitTop = 508
    ExplicitWidth = 896
  end
  object MainMenu: TMainMenu
    Left = 584
    Top = 16
    object Aplicativo1: TMenuItem
      Caption = 'Aplicativo'
      GroupIndex = 1
      object SalvarF22: TMenuItem
        Caption = 'Novo'
      end
      object SalvarF21: TMenuItem
        Caption = 'Abrir '
      end
      object SalvarCtrlS1: TMenuItem
        Caption = 'Salvar                                     Ctrl+S'
      end
      object N3: TMenuItem
        Caption = 'Salvar  Tudo                          Ctrl+Shift+S'
      end
      object N4: TMenuItem
        Caption = '-'
      end
    end
    object ProcessoETL1: TMenuItem
      Caption = 'Processo ETL'
      GroupIndex = 1
      object Mapeamentos1: TMenuItem
        Caption = 'Mapeamentos'
      end
      object Filtros1: TMenuItem
        Caption = 'Filtros'
      end
      object ransformaes1: TMenuItem
        Caption = 'Transforma'#231#245'es'
      end
      object Processos1: TMenuItem
        Caption = 'Processos'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ServidordeProcessos1: TMenuItem
        Caption = 'Servidor de Processos'
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      GroupIndex = 1
      object abelas1: TMenuItem
        Caption = 'Tabelas'
      end
      object Colunas1: TMenuItem
        Caption = 'Colunas'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Junes1: TMenuItem
        Caption = 'Jun'#231#245'es'
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      GroupIndex = 1
      object Processamentos1: TMenuItem
        Caption = 'Processamentos'
      end
    end
    object Ferramentas1: TMenuItem
      Caption = 'Ferramentas'
      GroupIndex = 1
      object LimpezadeProcessamentos1: TMenuItem
        Caption = 'Limpeza de Processamentos'
      end
    end
    object Sair: TMenuItem
      Caption = 'Sair'
      GroupIndex = 1
    end
  end
end
