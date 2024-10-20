unit uTabelasNameAjuste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Buttons, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, IniFiles, Vcl.ComCtrls;

type
  TfrmJusteTabelaNome = class(TForm)
    FDConnection1: TFDConnection;
    qryTables: TFDQuery;
    TabSheet2: TTabSheet;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    Panel4: TPanel;
    BtnInserirTudo: TButton;
    BtnRemover: TButton;
    BtnInserir: TButton;
    BtnRemoverTudo: TButton;
    Panel1: TPanel;
    GrpItensDisponiveis: TGroupBox;
    ListBoxTabelas: TListBox;
    Panel3: TPanel;
    GrpItensSelecionados: TGroupBox;
    Panel2: TPanel;
    BtnTipoOrdem: TSpeedButton;
    ListBoxSelecionadas: TListBox;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    TabSheet3: TTabSheet;
    ScrollBox1: TScrollBox;
    ListBox1: TListBox;
    ScrollBox2: TScrollBox;
    ListBox2: TListBox;
    Panel7: TPanel;
    Panel8: TPanel;
    PageControl1: TPageControl;
    ListBoxEXP: TListBox;
    Panel9: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel10: TPanel;
    Button1: TButton;
    SpeedButton4: TSpeedButton;
    FDConnection2: TFDConnection;
    procedure BtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnInserirTudoClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
    procedure BtnRemoverTudoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxSelecionadasDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ListarTabelasBanco(CaminhoBanco: string; Table: TListBox);
    procedure ExecutarQuery(const SQL: string);
    procedure CriarEstruturaTabela(const TabelaOrigem, TabelaNova: string);
    procedure RenomearColunas(const TabelaNova: string; Colunas: TStringList);
    procedure CopiarDadosTabela(const TabelaOrigem, TabelaNova: string);
    procedure AtualizarListBox(NomeAntigo, NomeNovo: string);
    procedure RenomearTabela(NomeTabelaOriginal, NomeTabelaNovo: string);

  var
    ListaRenomearTabelas: TStringList;
    ArquivoINI: TIniFile;
    FIniFile: TIniFile;
  public
    property IniFile: TIniFile read FIniFile write FIniFile;
    { Public declarations }

    procedure CopiarDadosParaNovaTabela(TabelaOrigem, TabelaNova: string;
      Colunas: TStringList);
    procedure CriarNovoBancoFirebird(const NomeBanco: string);
    procedure CopiarTabela(NomeTabelaOriginal, NomeTabelaNovo: string);
    procedure SalvarNovoBanco;
  end;

var
  frmJusteTabelaNome: TfrmJusteTabelaNome;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TfrmJusteTabelaNome.ListarTabelasBanco(CaminhoBanco: string;
  Table: TListBox);
var
  Query: TFDQuery;
begin
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('Database=' + CaminhoBanco);
  FDConnection1.Params.Add('DriverID=FB');
  FDConnection1.Params.Add('User_Name=sysdba');
  FDConnection1.Params.Add('Password=masterkey');

  try
    FDConnection1.Connected := True;

    Query := TFDQuery.Create(nil);
    try
      Query.Connection := FDConnection1;
      Query.SQL.Text :=
        'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS WHERE RDB$SYSTEM_FLAG = 0';
      Query.Open;

      while not Query.Eof do
      begin
        Table.Items.Add(Trim(Query.FieldByName('RDB$RELATION_NAME').AsString));
        Query.Next;
      end;

    finally
      Query.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
  end;
end;

procedure TfrmJusteTabelaNome.ListBoxSelecionadasDblClick(Sender: TObject);
var
  NomeOriginal, NomeNovo, InputString: string;
begin
  NomeOriginal := ListBoxSelecionadas.Items[ListBoxSelecionadas.ItemIndex];

  InputString := InputBox('Alterar Titulo Tabela', 'Digite algo:',
    NomeOriginal);
  NomeNovo := InputString;

  if (ListBoxSelecionadas.ItemIndex <> -1) then
  begin
    AtualizarListBox(NomeOriginal, NomeNovo);
  end;
end;

procedure TfrmJusteTabelaNome.BtnInserirClick(Sender: TObject);
var
 tituloTabela : String;
begin
  if ListBoxTabelas.ItemIndex <> -1 then
  begin
    tituloTabela := ListBoxTabelas.Items[ListBoxTabelas.ItemIndex];
    ListBoxSelecionadas.Items.Add(tituloTabela);
    ListaRenomearTabelas.Values[tituloTabela] := tituloTabela;
  end;
end;

procedure TfrmJusteTabelaNome.BtnInserirTudoClick(Sender: TObject);
var
  i: Integer;
  tituloTabela : String;
begin
  for i := 0 to ListBoxTabelas.Items.Count - 1 do begin
    tituloTabela := ListBoxTabelas.Items[i];
    ListBoxSelecionadas.Items.Add(tituloTabela);
    ListaRenomearTabelas.Values[tituloTabela] := tituloTabela;
  end;


//  ListBoxTabelas.Clear;
end;

procedure TfrmJusteTabelaNome.BtnRemoverClick(Sender: TObject);
begin
  if ListBoxSelecionadas.ItemIndex <> -1 then
  begin
    ListBoxTabelas.Items.Add(ListBoxSelecionadas.Items
      [ListBoxSelecionadas.ItemIndex]);
    ListBoxSelecionadas.Items.Delete(ListBoxSelecionadas.ItemIndex);
  end;
end;

procedure TfrmJusteTabelaNome.BtnRemoverTudoClick(Sender: TObject);
begin
  var
    i: Integer;
  begin
    for i := 0 to ListBoxSelecionadas.Items.Count - 1 do
      ListBoxTabelas.Items.Add(ListBoxSelecionadas.Items[i]);

    ListBoxSelecionadas.Clear;
  end;
end;

procedure TfrmJusteTabelaNome.Button1Click(Sender: TObject);
var
  NomeOriginal, NomeNovo: string;
begin
  if (ListBoxEXP.ItemIndex <> -1) and (ListBoxSelecionadas.ItemIndex <> -1) then
  begin
    NomeOriginal := ListBoxSelecionadas.Items[ListBoxSelecionadas.ItemIndex];
    NomeNovo := ListBoxEXP.Items[ListBoxEXP.ItemIndex];

    AtualizarListBox(NomeOriginal, NomeNovo);
  end;
end;

procedure TfrmJusteTabelaNome.FormCreate(Sender: TObject);
begin
  ListaRenomearTabelas := TStringList.Create;
end;

procedure TfrmJusteTabelaNome.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  NomeOriginal, NomeNovo: string;
begin
  if Key = VK_F5 then
  begin
    // Verifica se algo est� selecionado em ambos os ListBox
    if (ListBoxEXP.ItemIndex <> -1) and (ListBoxSelecionadas.ItemIndex <> -1)
    then
    begin
      NomeOriginal := ListBoxSelecionadas.Items[ListBoxSelecionadas.ItemIndex];
      NomeNovo := ListBoxEXP.Items[ListBoxEXP.ItemIndex];

      AtualizarListBox(NomeOriginal, NomeNovo);
    end;
  end;
end;

{ Renomeia uma tabela no banco de dados }
procedure TfrmJusteTabelaNome.RenomearTabela(NomeTabelaOriginal,
  NomeTabelaNovo: string);
begin
  ExecutarQuery(Format('ALTER TABLE %s RENAME TO %s', [NomeTabelaOriginal,
    NomeTabelaNovo]));
end;

procedure TfrmJusteTabelaNome.FormShow(Sender: TObject);
var
  BDINP, BDOUT: string;
begin
  ArquivoINI := TIniFile.Create
    ('C:\Users\Delphi\Documents\BDMASTER\Config.ini');
  BDINP := ArquivoINI.ReadString('SGBDEXT', 'DataBase', 'Erro ao ler o valor');
  BDOUT := ArquivoINI.ReadString('SGBD', 'DataBase', 'Erro ao ler o valor');
  ArquivoINI.Free;

  ListarTabelasBanco(BDINP, ListBoxTabelas);
  ListarTabelasBanco(BDOUT, ListBoxEXP);
end;

{ M�todo gen�rico para executar queries simples }
procedure TfrmJusteTabelaNome.ExecutarQuery(const SQL: string);
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

{ Cria a estrutura da tabela nova a partir da tabela original }
procedure TfrmJusteTabelaNome.CriarEstruturaTabela(const TabelaOrigem,
  TabelaNova: string);
begin
  ExecutarQuery(Format('CREATE TABLE %s AS SELECT * FROM %s WHERE 1=0',
    [TabelaNova, TabelaOrigem]));
end;

{ Renomeia as colunas da tabela nova com base no mapeamento fornecido }
procedure TfrmJusteTabelaNome.RenomearColunas(const TabelaNova: string;
  Colunas: TStringList);
var
  i: Integer;
  ColunaAntiga, ColunaNova: string;
begin
  for i := 0 to Colunas.Count - 1 do
  begin
    ColunaAntiga := Colunas.Names[i];
    ColunaNova := Colunas.ValueFromIndex[i];
    ExecutarQuery(Format('ALTER TABLE %s RENAME COLUMN %s TO %s',
      [TabelaNova, ColunaAntiga, ColunaNova]));
  end;
end;

{ Copia os dados da tabela original para a nova tabela }
procedure TfrmJusteTabelaNome.CopiarDadosTabela(const TabelaOrigem,
  TabelaNova: string);
begin
  ExecutarQuery(Format('INSERT INTO %s SELECT * FROM %s',
    [TabelaNova, TabelaOrigem]));
end;

{ Procedimento principal para copiar dados para uma nova tabela }
procedure TfrmJusteTabelaNome.CopiarDadosParaNovaTabela(TabelaOrigem,
  TabelaNova: string; Colunas: TStringList);
var
  CheckTableQuery: TFDQuery;
begin
  CheckTableQuery := TFDQuery.Create(nil);
  try
    CheckTableQuery.Connection := FDConnection1;
    CheckTableQuery.SQL.Text :=
      Format('SELECT 1 FROM information_schema.tables WHERE table_name = %s',
      [QuotedStr(TabelaNova)]);
    CheckTableQuery.Open;

    if CheckTableQuery.IsEmpty then
      CriarEstruturaTabela(TabelaOrigem, TabelaNova);

    RenomearColunas(TabelaNova, Colunas);
    CopiarDadosTabela(TabelaOrigem, TabelaNova);
  finally
    CheckTableQuery.Free;
  end;
end;

{ Cria um novo banco de dados Firebird }
procedure TfrmJusteTabelaNome.CriarNovoBancoFirebird(const NomeBanco: string);
var
  Connection: TFDConnection;
  sFileName: string;
begin

  Connection := TFDConnection.Create(nil);

  try
    Connection.DriverName := 'FB';
    Connection.Params.Values['Database'] := NomeBanco;
    Connection.Params.Values['User_Name'] := 'SYSDBA';
    Connection.Params.Values['Password'] := 'masterkey';
    Connection.Params.Values['Server'] := 'localhost';
    Connection.Params.Values['Protocol'] := 'TCPIP';
    Connection.Params.Values['CreateDatabase'] := 'Yes';

    Connection.Connected := True; // Cria o banco de dados

    sFileName := 'C:\Users\Delphi\Documents\BDMASTER\Config.ini';
    IniFile := TIniFile.Create(sFileName);
    IniFile.WriteString('SGBDOUT', 'DataBase', NomeBanco);
    IniFile.WriteString('SGBDOUT', 'User_Name', 'SYSDBA');
    IniFile.WriteString('SGBDOUT', 'Password', 'masterkey');
    IniFile.WriteString('SGBDOUT', 'IP', 'localhost');
    IniFile.WriteString('SGBDOUT', 'TIPOREDE', 'TCPIP');

    IniFile.Free;

  finally
    Connection.Free;
  end;
end;

{ Copia a estrutura e dados de uma tabela para outra }
procedure TfrmJusteTabelaNome.CopiarTabela(NomeTabelaOriginal,
  NomeTabelaNovo: string);
begin
  CriarEstruturaTabela(NomeTabelaOriginal, NomeTabelaNovo);
  CopiarDadosTabela(NomeTabelaOriginal, NomeTabelaNovo);
end;

{ Procedimento para salvar o conte�do de v�rias tabelas em um novo banco de dados }
procedure TfrmJusteTabelaNome.SalvarNovoBanco;
var
  i: Integer;
  NomeTabelaOriginal, NomeTabelaNovo, Caminho: string;
begin

  Caminho := 'C:\Users\Delphi\Documents\BDMASTER\Bancos/BD_novo.fdb';

  if FileExists(Caminho) then
  begin
    ShowMessage('O banco de dados j� existe.');
    Exit;
  end
  else
  begin
    CriarNovoBancoFirebird(Caminho);
  end;
  // Defina o caminho adequado

  // Para cada tabela na lista, copie a estrutura e os dados
  for i := 0 to ListaRenomearTabelas.Count - 1 do
  begin
    NomeTabelaOriginal := ListaRenomearTabelas.Names[i];
    NomeTabelaNovo := ListaRenomearTabelas.ValueFromIndex[i];
    CopiarTabela(NomeTabelaOriginal, NomeTabelaNovo);
  end;
end;

procedure TfrmJusteTabelaNome.SpeedButton1Click(Sender: TObject);
begin
 SalvarNovoBanco;
end;

{ Atualiza o ListBoxSelecionadas e registra a altera��o de nome }
procedure TfrmJusteTabelaNome.AtualizarListBox(NomeAntigo, NomeNovo: string);
var
  Index: Integer;
begin
  // Atualiza o ListBoxSelecionadas para refletir a mudan�a
  Index := ListBoxSelecionadas.Items.IndexOf(NomeAntigo);
  if Index <> -1 then
    ListBoxSelecionadas.Items[Index] := NomeNovo;

  // Registra a altera��o de nome na lista de renomea��o
  ListaRenomearTabelas.Values[NomeAntigo] := NomeNovo;
end;

end.
