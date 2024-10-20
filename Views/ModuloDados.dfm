object DM: TDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 530
  Width = 455
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Port=3050'
      'Database=C:\Bancos\BDPRINCIPAL.fdb'
      'Server=127.0.0.1'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode, evAutoClose]
    FormatOptions.AssignedValues = [fvFmtDisplayDate, fvFmtDisplayNumeric]
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Transaction = Transacao
    UpdateTransaction = Transacao
    AfterConnect = ConexaoAfterConnect
    BeforeConnect = ConexaoBeforeConnect
    Left = 32
    Top = 8
  end
  object Transacao: TFDTransaction
    Connection = Conexao
    Left = 32
    Top = 136
  end
  object FBDriver: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll'
    Left = 32
    Top = 72
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 200
  end
  object qrySequence: TFDQuery
    ChangeAlertName = 'qry'
    Connection = Conexao
    Left = 40
    Top = 272
  end
  object qryLookup: TFDQuery
    Connection = Conexao
    Left = 40
    Top = 344
  end
end
