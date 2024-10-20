unit uAjusteColunas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,  IniFiles, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAjusteColunas = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel4: TPanel;
    BtnInserirTudo: TButton;
    BtnRemover: TButton;
    BtnInserir: TButton;
    BtnRemoverTudo: TButton;
    Panel1: TPanel;
    GrpItensDisponiveis: TGroupBox;
    ListBoxColunas: TListBox;
    Panel3: TPanel;
    GrpItensSelecionados: TGroupBox;
    Panel2: TPanel;
    BtnTipoOrdem: TSpeedButton;
    Button1: TButton;
    ListBoxSelecionadas: TListBox;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    ListBoxEXP: TListBox;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    TabSheet3: TTabSheet;
    ScrollBox1: TScrollBox;
    ListBox1: TListBox;
    ScrollBox2: TScrollBox;
    ListBox2: TListBox;
    Panel9: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qryTables: TFDQuery;
    FDConnection2: TFDConnection;
    FDConnection1: TFDConnection;
    Panel11: TPanel;
    ComboBoxTabelas: TComboBox;
    Label1: TLabel;
    ComboBox: TComboBox;
    Label2: TLabel;
    Panel10: TPanel;
    bdgOUT: TDBGrid;
    Panel12: TPanel;
    dbgAAlterar: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure ComboBoxTabelasClick(Sender: TObject);
    procedure ComboBoxClick(Sender: TObject);
    procedure ComboBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ListarTabelasBanco(const CaminhoBanco: string; ComboBox: TComboBox);
    procedure ListarColunasTabela(const Tabela: string; ListBox: TListBox);
    procedure ComboBoxTabelasChange(Sender: TObject);
    procedure ListBoxColunasDblClick(Sender: TObject);
    procedure ExecutarQuery(const SQL: string);
    procedure ConectarBanco(const CaminhoBanco: string);
    procedure DesconectarBanco;
    procedure AtualizarColuna(const Tabela, NomeColunaAntiga, NomeColunaNova: string);
    procedure ExcluirColuna(const Tabela, NomeColuna: string);
    procedure ListarIndicesTabela(const Tabela: string; ListBox: TListBox);
    procedure ShowTable(const Tabela: string; Grid: TDBGrid; BD : TFDConnection);

    function ObterTipoColuna(Tipo: Integer): string;

    var
      ListaRenomearTabelas: TStringList;
      ArquivoINI: TIniFile;
      FIniFile: TIniFile;
  public
    property IniFile: TIniFile read FIniFile write FIniFile;
    { Public declarations }
  end;

var
  frmAjusteColunas: TfrmAjusteColunas;

implementation

{$R *.dfm}

procedure TfrmAjusteColunas.ExecutarQuery(const SQL: string);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FDConnection1;
    Query.SQL.Text := SQL;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TfrmAjusteColunas.FormCreate(Sender: TObject);
begin
  if dbgAAlterar.DataSource = nil then
  begin
    dbgAAlterar.DataSource := TDataSource.Create(Self);
  end;
end;

procedure TfrmAjusteColunas.FormShow(Sender: TObject);
var
  BDINP, BDOUT: string;
begin
  ArquivoINI := TIniFile.Create
    ('C:\Users\Delphi\Documents\BDMASTER\Config.ini');
  BDINP := ArquivoINI.ReadString('SGBDEXT', 'DataBase', 'Erro ao ler o valor');
  BDOUT := ArquivoINI.ReadString('SGBD', 'DataBase', 'Erro ao ler o valor');
  ArquivoINI.Free;

  ListarTabelasBanco(BDINP, ComboBoxTabelas);
  ListarTabelasBanco(BDOUT, ComboBox);
end;

procedure TfrmAjusteColunas.ConectarBanco(const CaminhoBanco: string);
begin
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('Database=' + CaminhoBanco);
  FDConnection1.Params.Add('DriverID=FB');
  FDConnection1.Params.Add('User_Name=sysdba');
  FDConnection1.Params.Add('Password=masterkey');

  try
    FDConnection1.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
  end;
end;

procedure TfrmAjusteColunas.DesconectarBanco;
begin
  if FDConnection1.Connected then
    FDConnection1.Connected := False;
end;

procedure TfrmAjusteColunas.ListarTabelasBanco(const CaminhoBanco: string; ComboBox: TComboBox);
var
  Query: TFDQuery;
begin
  try
    ConectarBanco(CaminhoBanco);

    Query := TFDQuery.Create(nil);
    try
      Query.Connection := FDConnection1;
      Query.SQL.Text := 'SELECT TRIM(RDB$RELATION_NAME) AS TABLE_NAME FROM RDB$RELATIONS WHERE RDB$SYSTEM_FLAG = 0';
      Query.Open;

      ComboBox.Items.Clear;
      while not Query.Eof do
      begin
        ComboBox.Items.Add(Query.FieldByName('TABLE_NAME').AsString);
        Query.Next;
      end;

    finally
      Query.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao listar tabelas: ' + E.Message);
  end;
end;

procedure TfrmAjusteColunas.ListarColunasTabela(const Tabela: string; ListBox: TListBox);
var
  Query: TFDQuery;
  ColunaNome, ColunaTipo: string;
  Tamanho: Integer;
begin
  ListBox.Clear;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FDConnection1;
    Query.SQL.Text :=
      'SELECT TRIM(RF.RDB$FIELD_NAME) AS FIELD_NAME, ' +
      'F.RDB$FIELD_TYPE, F.RDB$FIELD_LENGTH ' +
      'FROM RDB$RELATION_FIELDS RF ' +
      'JOIN RDB$FIELDS F ON RF.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME ' +
      'WHERE RF.RDB$RELATION_NAME = :Tabela';

    Query.ParamByName('Tabela').AsString := Tabela;
    Query.Open;

    while not Query.Eof do
    begin
      ColunaNome := Query.FieldByName('FIELD_NAME').AsString;
      ColunaTipo := ObterTipoColuna(Query.FieldByName('RDB$FIELD_TYPE').AsInteger);
      Tamanho := Query.FieldByName('RDB$FIELD_LENGTH').AsInteger;

      ListBox.Items.Add(Format('%s (%s, Tamanho: %d)', [ColunaNome, ColunaTipo, Tamanho]));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;


function TfrmAjusteColunas.ObterTipoColuna(Tipo: Integer): string;
begin
  case Tipo of
    7, 8: Result := 'Integer';
    10: Result := 'Float';
    14: Result := 'Char';
    37: Result := 'Varchar';
    12: Result := 'Date';
    13: Result := 'Time';
    35: Result := 'Timestamp';
    else
      Result := 'Desconhecido';
  end;
end;

procedure TfrmAjusteColunas.AtualizarColuna(const Tabela, NomeColunaAntiga, NomeColunaNova: string);
begin
  try
    ExecutarQuery(Format('ALTER TABLE %s RENAME COLUMN %s TO %s',
      [Tabela, NomeColunaAntiga, NomeColunaNova]));
  except
    on E: Exception do
      ShowMessage('Erro ao renomear a coluna: ' + E.Message);
  end;
end;

procedure TfrmAjusteColunas.ExcluirColuna(const Tabela, NomeColuna: string);
begin
  try
    ExecutarQuery(Format('ALTER TABLE %s DROP %s', [Tabela, NomeColuna]));
  except
    on E: Exception do
      ShowMessage('Erro ao excluir a coluna: ' + E.Message);
  end;
end;

procedure TfrmAjusteColunas.ListarIndicesTabela(const Tabela: string; ListBox: TListBox);
var
  Query: TFDQuery;
begin
  ListBox.Clear;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FDConnection1;
    Query.SQL.Text := Format(
      'SELECT TRIM(RDB$INDEX_NAME) AS INDEX_NAME FROM RDB$INDICES WHERE RDB$RELATION_NAME = %s',
      [QuotedStr(Tabela)]
    );
    Query.Open;

    while not Query.Eof do
    begin
      ListBox.Items.Add(Query.FieldByName('INDEX_NAME').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmAjusteColunas.ComboBoxChange(Sender: TObject);
begin
  if ComboBox.ItemIndex <> -1 then
    ListarColunasTabela(ComboBox.Text, ListBoxEXP);
end;

procedure TfrmAjusteColunas.ComboBoxClick(Sender: TObject);
begin
    ListarColunasTabela(ComboBox.Text, ListBoxEXP);
end;

procedure TfrmAjusteColunas.ComboBoxTabelasChange(Sender: TObject);
begin
  if ComboBoxTabelas.ItemIndex <> -1 then
  begin
    ListarColunasTabela(ComboBoxTabelas.Text, ListBoxColunas);
  end;
end;

procedure TfrmAjusteColunas.ComboBoxTabelasClick(Sender: TObject);
begin
  ListarColunasTabela(ComboBoxTabelas.Text, ListBoxColunas);
  ShowTable(ComboBoxTabelas.Text, dbgAAlterar, FDConnection1);
end;

procedure TfrmAjusteColunas.ShowTable(const Tabela: string; Grid: TDBGrid; BD: TFDConnection);
var
  Query: TFDQuery;
begin
  if Tabela = '' then
  begin
    ShowMessage('Nenhuma tabela selecionada.');
    Exit;
  end;

  // Cria a query para buscar os dados da tabela
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := BD;
    Query.SQL.Text := Format('SELECT * FROM %s', [Tabela]);
    Query.Open;

    // Verifica se o DataSource do DBGrid est� atribu�do
    if Grid.DataSource = nil then
    begin
      ShowMessage('O DataSource do DBGrid n�o foi configurado corretamente.');
      Exit;
    end;

    // Desvincula qualquer DataSet anterior
    if Grid.DataSource.DataSet <> nil then
    begin
      Grid.DataSource.DataSet.Close;
      Grid.DataSource.DataSet := nil;
    end;

    // Vincula a query ao DataSource do DBGrid
    Grid.DataSource.DataSet := Query;

    // Observa��o: N�o chamamos Query.Free, pois ele est� vinculado ao DataSource
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar os dados: ' + E.Message);
      Query.Free;  // Libera a query em caso de erro
    end;
  end;
end;



procedure TfrmAjusteColunas.ListBoxColunasDblClick(Sender: TObject);
var
  NomeColunaAntiga, NomeColunaNova, TabelaSelecionada: string;
begin
  if ListBoxColunas.ItemIndex <> -1 then
  begin
    NomeColunaAntiga := Trim(Copy(ListBoxColunas.Items[ListBoxColunas.ItemIndex], 1, Pos('(', ListBoxColunas.Items[ListBoxColunas.ItemIndex]) - 2));
    NomeColunaNova := InputBox('Alterar Nome da Coluna', 'Digite o novo nome para a coluna:', NomeColunaAntiga);

    if NomeColunaNova <> '' then
    begin
      TabelaSelecionada := ComboBoxTabelas.Text;
      AtualizarColuna(TabelaSelecionada, NomeColunaAntiga, NomeColunaNova);
      ListarColunasTabela(TabelaSelecionada, ListBoxColunas);
    end;
  end;
end;


end.
