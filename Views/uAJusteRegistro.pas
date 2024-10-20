unit uAJusteRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmAjusteRegistros = class(TForm)
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
    Panel10: TPanel;
    bdgOUT: TDBGrid;
    Panel12: TPanel;
    dbgAAlterar: TDBGrid;
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
    Label1: TLabel;
    Label2: TLabel;
    ComboBoxTabelas: TComboBox;
    ComboBox: TComboBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label4: TLabel;
  private
    { Private declarations }
    procedure ListarColunas(const Tabela: string; Colunas: TStrings; BD: TFDConnection);
    procedure TratarIncompatibilidade(NomeColuna: string);
    procedure CortarTexto(Tabela: string; NomeColuna: string; NovoTamanho: Integer);
//    procedure AlterarTipoColuna(Tabela: string; NomeColuna: string; NovoTipo: string);
    procedure CompararColunas(TabelaOrigem, TabelaDestino: string);
//    procedure ExecutarQuery(const SQL: string);
  public
    { Public declarations }
  end;

var
  frmAjusteRegistros: TfrmAjusteRegistros;

implementation

{$R *.dfm}

//{ M�todo gen�rico para executar queries simples }
//procedure TfrmJusteTabelaNome.ExecutarQuery(const SQL: string);
//var
//  Query: TFDQuery;
//begin
//  Query := TFDQuery.Create(nil);
//  try
//    Query.Connection := FDConnection1;
//    Query.SQL.Text := SQL;
//    Query.ExecSQL;
//  finally
//    Query.Free;
//  end;
//end;


procedure TfrmAjusteRegistros.TratarIncompatibilidade(NomeColuna: string);
var
  Opcao: Integer;
  NovoTamanho: Integer;
begin
  Opcao := MessageDlg(Format('A coluna %s n�o � compat�vel. Deseja cortar o texto ou alterar o tipo?', [NomeColuna]),
    mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  case Opcao of
    mrYes:  // Cortar o texto
      begin
        NovoTamanho := StrToInt(InputBox('Novo Tamanho', 'Insira o novo tamanho:', '50'));
        CortarTexto('MinhaTabela', NomeColuna, NovoTamanho);
      end;
    mrNo:  // Alterar o tipo
      begin
//        AlterarTipoColuna('MinhaTabela', NomeColuna, 'VARCHAR(100)');
      end;
  end;
end;

procedure TfrmAjusteRegistros.CortarTexto(Tabela: string; NomeColuna: string; NovoTamanho: Integer);
begin
//  ExecutarQuery(Format('ALTER TABLE %s ALTER COLUMN %s TYPE VARCHAR(%d)', [Tabela, NomeColuna, NovoTamanho]));
end;

//procedure TfrmJusteTabelaNome.AlterarTipoColuna(Tabela: string; NomeColuna: string; NovoTipo: string);
//begin
////  ExecutarQuery(Format('ALTER TABLE %s ALTER COLUMN %s TYPE %s', [Tabela, NomeColuna, NovoTipo]));
//end;

procedure TfrmAjusteRegistros.CompararColunas(TabelaOrigem, TabelaDestino: string);
var
  ColunasOrigem, ColunasDestino: TStringList;
  i: Integer;
  NomeColunaOrigem, NomeColunaDestino: string;
  TipoOrigem, TipoDestino, TamanhoOrigem, TamanhoDestino: Integer;
begin
  ColunasOrigem := TStringList.Create;
  ColunasDestino := TStringList.Create;

  try
    // Obter colunas e tipos da tabela de origem e destino
    ListarColunas(TabelaOrigem, ColunasOrigem, FDConnection1);  // Supondo que a origem est� no FDConnection1
    ListarColunas(TabelaDestino, ColunasDestino, FDConnection2); // Supondo que a destino est� no FDConnection2

    for i := 0 to ColunasOrigem.Count - 1 do
    begin
      NomeColunaOrigem := ColunasOrigem.Names[i];
      TipoOrigem := StrToInt(ColunasOrigem.ValueFromIndex[i].Split([':'])[0]);
      TamanhoOrigem := StrToInt(ColunasOrigem.ValueFromIndex[i].Split([':'])[1]);

      NomeColunaDestino := ColunasDestino.Values[NomeColunaOrigem]; // Tenta achar a coluna correspondente

      if NomeColunaDestino <> '' then
      begin
        TipoDestino := StrToInt(ColunasDestino.ValueFromIndex[i].Split([':'])[0]);
        TamanhoDestino := StrToInt(ColunasDestino.ValueFromIndex[i].Split([':'])[1]);

        // Verificar compatibilidade
        if (TipoOrigem <> TipoDestino) or (TamanhoOrigem > TamanhoDestino) then
        begin
          ShowMessage(Format('Incompatibilidade na coluna %s: Tipo ou Tamanho diferente. Ajuste necess�rio.', [NomeColunaOrigem]));
          // Aqui voc� pode solicitar ajustes ao usu�rio, como cortar texto, mudar tipo, etc.
        end;
      end
      else
      begin
        ShowMessage(Format('A coluna %s n�o foi encontrada na tabela de destino.', [NomeColunaOrigem]));
      end;
    end;
  finally
    ColunasOrigem.Free;
    ColunasDestino.Free;
  end;
end;

procedure TfrmAjusteRegistros.ListarColunas(const Tabela: string; Colunas: TStrings; BD: TFDConnection);
var
  Query: TFDQuery;
begin
  Colunas.Clear;  // Limpa a lista de colunas

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := BD;
    Query.SQL.Text := Format('SELECT RDB$FIELD_NAME, RDB$FIELD_TYPE, RDB$FIELD_LENGTH ' +
      'FROM RDB$RELATION_FIELDS ' +
      'WHERE RDB$RELATION_NAME = ''%s''', [Tabela]);
    Query.Open;

    while not Query.Eof do
    begin
      Colunas.Add(Format('%s=%d:%d', [
        Trim(Query.FieldByName('RDB$FIELD_NAME').AsString),
        Query.FieldByName('RDB$FIELD_TYPE').AsInteger,
        Query.FieldByName('RDB$FIELD_LENGTH').AsInteger]));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;


end.
