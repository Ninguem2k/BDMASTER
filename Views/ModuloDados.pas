unit ModuloDados;
interface
uses
  SysUtils, Classes,  DB, SqlExpr, FMTBcd, Variants, IniFiles, Forms,
  Data.DBXOracle, Data.DBXCommon, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;
type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    Transacao: TFDTransaction;
    FBDriver: TFDPhysFBDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    qrySequence: TFDQuery;
    qryLookup: TFDQuery;
    function NextSequenceValue(sSequenceName: String): Integer;
    function LookupQuery(LookupKeyValues: Variant; sLookupKeyFields: String; sLookupTable: String; sLookupResultFields: String): Variant;
    procedure DataSetLookupQuery(DataSet: TDataSet; sFields: String; LookupKeyValues: Variant; sLookupKeyFields: String; sLookupTable: String; sLookupResultFields: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
    procedure ConexaoAfterConnect(Sender: TObject);
  private
    FIniFile: TIniFile;
  public
    property IniFile: TIniFile read FIniFile write FIniFile;
  end;
var
  DM: TDM;
implementation


{$R *.dfm}
function TDM.NextSequenceValue(sSequenceName: String): Integer;
begin
  qrySequence.SQL.Text := 'SELECT NEXT VALUE FOR ' + sSequenceName + ' AS NEXT_VALUE FROM RDB$DATABASE';
  qrySequence.Open;
  try
    Result := qrySequence.FieldByName('NEXT_VALUE').AsInteger;
  finally
    qrySequence.Close;
  end;
end;

function TDM.LookupQuery(LookupKeyValues: Variant; sLookupKeyFields: String; sLookupTable: String; sLookupResultFields: String): Variant;
var
  i: Integer;
  sAux: String;
begin
  QryLookup.SQL.Clear;
  QryLookup.SQL.Add('SELECT');
  QryLookup.SQL.Add('  ' + StringReplace(sLookupResultFields, ';', ',', [rfReplaceAll]));
  QryLookup.SQL.Add('FROM');
  QryLookup.SQL.Add('  ' + sLookupTable);
  QryLookup.SQL.Add('WHERE');

  if VarIsArray(LookupKeyValues) then
  begin
//    for i := 1 to CSVSubStrCount(sLookupKeyFields) do
//    begin
//      sAux := VarToStr(LookupKeyValues[i-1]);
//      if VarType(LookupKeyValues[i-1]) = varString then
//        sAux := '''' + sAux + '''';
////      sAux := '  ' + CSVSubStr(sLookupKeyFields, i) + ' = ' + sAux;
//
//      if i < CSVSubStrCount(sLookupKeyFields) then
//        sAux := sAux + ' AND';
//
//      QryLookup.SQL.Add(sAux);
//    end;
  end
  else
  begin
    sAux := VarToStr(LookupKeyValues);
    if VarType(LookupKeyValues) = varString then
      sAux := '''' + sAux + '''';
    sAux := '  ' + sLookupKeyFields + ' = ' + sAux;

    QryLookup.SQL.Add(sAux);
  end;

  QryLookup.Open;
  try
    if QryLookup.FieldCount > 1 then
    begin
      Result := VarArrayCreate([0, QryLookup.FieldCount-1], varVariant);
      for i := 0 to QryLookup.FieldCount-1 do
        Result[i] := QryLookup.Fields[i].Value;
    end
    else
    begin
      Result := QryLookup.Fields[0].Value;
    end;
  finally
    QryLookup.Close;
  end;
end;

procedure TDM.DataSetLookupQuery(DataSet: TDataSet; sFields: String; LookupKeyValues: Variant; sLookupKeyFields: String; sLookupTable: String; sLookupResultFields: String);
var
  LookupResultFields: Variant;
  i: Integer;
  sFieldName: String;
begin
  LookupResultFields := DM.LookupQuery(LookupKeyValues, sLookupKeyFields, sLookupTable, sLookupResultFields);

  if VarIsArray(LookupResultFields) then
  begin
    for i := 0 to VarArrayHighBound(LookupResultFields, 1) do
    begin
//      sFieldName := CSVSubStr(sFields, i+1);
      DataSet.FieldByName(sFieldName).Value := LookupResultFields[i];
    end;
  end
  else
  begin
    DataSet.FieldByName(sFields).Value := LookupResultFields;
  end;
end;

procedure TDM.ConexaoAfterConnect(Sender: TObject);
begin
//   Conexao.ExecSQL('ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''.,''');
end;

procedure TDM.ConexaoBeforeConnect(Sender: TObject);
begin
//  Conexao.Params.Database := IniFile.ReadString('SGBD', 'DataBase', '');
//  Conexao.Params.UserName := IniFile.ReadString('SGBD', 'User_Name', '');
//  Conexao.Params.Password := IniFile.ReadString('SGBD', 'Password', '');
end;

procedure TDM.DataModuleCreate(Sender: TObject);
//var
//  sFileName: String;
begin
//  sFileName := ChangeFileExt(Application.ExeName, '.ini');
//  IniFile := TIniFile.Create(sFileName);
//
//  IniFile.WriteString('SGBD', 'DataBase',  IniFile.ReadString('SGBD', 'DataBase',  'C:\DADOS.FDB'));
//  IniFile.WriteString('SGBD', 'User_Name', IniFile.ReadString('SGBD', 'User_Name', 'SYSDBA'));
//  IniFile.WriteString('SGBD', 'Password',  IniFile.ReadString('SGBD', 'Password',  'masterkey'));
//
//  Conexao.Params.Values['Database'] := IniFile.ReadString('SGBD', 'DataBase', '');
//  Conexao.Params.Values['User_Name'] := IniFile.ReadString('SGBD', 'User_Name', '');
//  Conexao.Params.Values['Password'] := IniFile.ReadString('SGBD', 'Password', '');
//  Conexao.Connected := True;
end;


procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  IniFile.Free;
end;



end.
