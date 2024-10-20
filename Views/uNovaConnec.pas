unit uNovaConnec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.NumberBox, IniFiles, Vcl.ExtDlgs, FireDAC.Comp.Client,
  FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.DApt;

type
  TfrmNovaConnec = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    eTipoBanco: TLinkLabel;
    ComboBox2: TComboBox;
    IPEdit: TEdit;
    UserNameEdit: TEdit;
    PasswordEdit: TEdit;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    LinkLabel3: TLinkLabel;
    Senha: TLinkLabel;
    PortaEdit: TEdit;
    LinkLabel4: TLinkLabel;
    pnBD: TPanel;
    LinkLabel5: TLinkLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    IPExtEdit: TEdit;
    UserNameExtEdit: TEdit;
    PasswordExtEdit: TEdit;
    LinkLabel6: TLinkLabel;
    LinkLabel7: TLinkLabel;
    LinkLabel8: TLinkLabel;
    LinkLabel9: TLinkLabel;
    PortaExtEdit: TEdit;
    LinkLabel10: TLinkLabel;
    LinkLabel11: TLinkLabel;
    LinkLabel12: TLinkLabel;
    Panel6: TPanel;
    BD: TButton;
    EXCEL: TButton;
    CSV: TButton;
    Label10: TLabel;
    CAMINHOBANCO: TComboBox;
    ComboBox6: TComboBox;
    LinkLabel13: TLinkLabel;
    pnEXCEL: TPanel;
    ComboBox9: TComboBox;
    pnCSV: TPanel;
    ComboBox7: TComboBox;
    cbTREDE: TComboBox;
    TipoRedeEdit: TEdit;
    DataBaseExtEdit: TEdit;
    DataBaseEdit: TEdit;
    BibliotecaExtEdit: TEdit;
    TipoRedeExtEdit: TEdit;
    BibliotecaEdit: TEdit;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure BDClick(Sender: TObject);
    procedure CSVClick(Sender: TObject);
    procedure EXCELClick(Sender: TObject);
    procedure CAMINHOBANCOChange(Sender: TObject);
    procedure cbTREDEClick(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure ComboBox4Click(Sender: TObject);
    procedure ComboBox6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FIniFile: TIniFile;
  public
    property IniFile: TIniFile read FIniFile write FIniFile;
    { Public declarations }
  end;

var
  frmNovaConnec: TfrmNovaConnec;

implementation

{$R *.dfm}

procedure TfrmNovaConnec.BDClick(Sender: TObject);
begin
  pnBD.Visible := True;
  pnEXCEL.Visible := False;
  pnCSV.Visible := False;
end;

procedure TfrmNovaConnec.CAMINHOBANCOChange(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o banco de dados';

  OpenDialog1.Filter := 'Arquivos de Banco de Dados|*.FDB;*.MDB;*.DB|Todos os arquivos|*.*';
  if OpenDialog1.Execute then
  begin
    DataBaseExtEdit.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmNovaConnec.ComboBox2Click(Sender: TObject);
begin
  TipoRedeEdit.Text := ComboBox2.ItemIndex.ToString;
end;

procedure TfrmNovaConnec.ComboBox3Click(Sender: TObject);
begin
  TipoRedeEdit.Text := ComboBox3.ItemIndex.ToString;
end;

procedure TfrmNovaConnec.ComboBox4Click(Sender: TObject);
begin
  TipoRedeEdit.Text := ComboBox4.ItemIndex.ToString;
end;

procedure TfrmNovaConnec.ComboBox6Click(Sender: TObject);
begin
  TipoRedeEdit.Text := ComboBox6.ItemIndex.ToString;
end;

procedure TfrmNovaConnec.CSVClick(Sender: TObject);
begin
  pnBD.Visible := False;
  pnEXCEL.Visible := False;
  pnCSV.Visible := True;
end;

procedure TfrmNovaConnec.cbTREDEClick(Sender: TObject);
begin
  TipoRedeEdit.Text := cbTREDE.ItemIndex.ToString;
end;

procedure TfrmNovaConnec.EXCELClick(Sender: TObject);
begin
  pnBD.Visible := False;
  pnEXCEL.Visible := True;
  pnCSV.Visible := False;
end;

procedure TfrmNovaConnec.Button1Click(Sender: TObject);
var
  sFileName: String;
  DataBase, User_Name, Password, IP, BIBLIOTECA, TIPOREDE, PORTA: string;
  DataBase_EXT, User_Name_EXT, Password_EXT, IP_EXT, BIBLIOTECA_EXT,
    TIPOREDE_EXT, PORTA_EXT: string;
begin
  sFileName := 'C:\Users\Delphi\Documents\BDMASTER\Config.ini';
  IniFile := TIniFile.Create(sFileName);
  try

     DataBase := DataBaseEdit.Text;
     User_Name := UserNameEdit.Text;
     Password := PasswordEdit.Text;
     IP := IPEdit.Text;
     BIBLIOTECA := BibliotecaEdit.Text;
     TIPOREDE := TipoRedeEdit.Text;
     PORTA := PortaEdit.Text;

     DataBase_EXT := DataBaseExtEdit.Text;
     User_Name_EXT := UserNameExtEdit.Text;
     Password_EXT := PasswordExtEdit.Text;
     IP_EXT := IPExtEdit.Text;
     BIBLIOTECA_EXT := BibliotecaExtEdit.Text;
     TIPOREDE_EXT := TipoRedeExtEdit.Text;
     PORTA_EXT := PortaExtEdit.Text;

    IniFile.WriteString('SGBD', 'DataBase', DataBase);
    IniFile.WriteString('SGBD', 'User_Name', User_Name);
    IniFile.WriteString('SGBD', 'Password', Password);
    IniFile.WriteString('SGBD', 'IP', IP);
    IniFile.WriteString('SGBD', 'BIBLIOTECA', BIBLIOTECA);
    IniFile.WriteString('SGBD', 'TIPOREDE', TIPOREDE);
    IniFile.WriteString('SGBD', 'PORTA', PORTA);

    IniFile.WriteString('SGBDEXT', 'DataBase', DataBase_EXT);
    IniFile.WriteString('SGBDEXT', 'User_Name', User_Name_EXT);
    IniFile.WriteString('SGBDEXT', 'Password', Password_EXT);
    IniFile.WriteString('SGBDEXT', 'IP', IP_EXT);
    IniFile.WriteString('SGBDEXT', 'BIBLIOTECA', BIBLIOTECA_EXT);
    IniFile.WriteString('SGBDEXT', 'TIPOREDE', TIPOREDE_EXT);
    IniFile.WriteString('SGBDEXT', 'PORTA', PORTA_EXT);

  finally
    IniFile.Free;
  end;
end;

procedure TfrmNovaConnec.Button2Click(Sender: TObject);
begin
  exit;
end;

// procedure TfrmNovaConnec.CAMINHOBANCOClick(Sender: TObject);
// var
// caminho: string;
// begin
// // CAMINHOBANCO := opCaminho.FileName;
// end;

// procedure LerCSV(CaminhoArquivo: string);
// var
// CSV: TCSVDocument;
// Linha, Coluna: Integer;
// begin
// CSV := TCSVDocument.Create;
// try
// CSV.LoadFromFile(CaminhoArquivo);
// for Linha := 0 to CSV.RowCount - 1 do
// begin
// for Coluna := 0 to CSV.ColCount[Linha] - 1 do
// begin
// ShowMessage(CSV.Cells[Coluna, Linha]);
// end;
// end;
// finally
// CSV.Free;
// end;
// end;

// procedure ConectarBancoDeDados;
// var
// FDConnection: TFDConnection;
// begin
// FDConnection := TFDConnection.Create(nil);
// try
// FDConnection.DriverName := 'FB';
// FDConnection.Params.DataBase := EditServidorIP.Text + ':' +
// EditBanco.Text;
// FDConnection.Params.UserName := EditUsuario.Text;
// FDConnection.Params.Password := EditSenha.Text;
// FDConnection.Params.Add('Server=' + EditServidorIP.Text);
// FDConnection.Params.Add('Port=' + EditPorta.Text);
//
// FDConnection.Connected := True;
//
// ShowMessage('Conex�o estabelecida com sucesso!');
// except
// on E: Exception do
// ShowMessage('Erro ao conectar: ' + E.Message);
// end;
// end;
//
// procedure ExecutarConsulta;
// var
// FDQuery: TFDQuery;
// begin
// FDQuery := TFDQuery.Create(nil);
// try
// FDQuery.Connection := FDConnection; //
// FDQuery.SQL.Text := 'SELECT * FROM MINHA_TABELA';
// / FDQuery.Open;
//
// while not FDQuery.Eof do
// begin
// ShowMessage(FDQuery.FieldByName('NOME_DO_CAMPO').AsString);
// FDQuery.Next;
// end;
// finally
// FDQuery.Free;
// end;
// end;

end.
