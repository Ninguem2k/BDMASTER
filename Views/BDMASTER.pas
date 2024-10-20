unit BDMASTER;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    MainMenu: TMainMenu;
    Aplicativo1: TMenuItem;
    SalvarF22: TMenuItem;
    SalvarF21: TMenuItem;
    SalvarCtrlS1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ProcessoETL1: TMenuItem;
    Mapeamentos1: TMenuItem;
    Filtros1: TMenuItem;
    ransformaes1: TMenuItem;
    Processos1: TMenuItem;
    N1: TMenuItem;
    ServidordeProcessos1: TMenuItem;
    Cadastros1: TMenuItem;
    abelas1: TMenuItem;
    Colunas1: TMenuItem;
    N2: TMenuItem;
    Junes1: TMenuItem;
    Consultas1: TMenuItem;
    Processamentos1: TMenuItem;
    Ferramentas1: TMenuItem;
    LimpezadeProcessamentos1: TMenuItem;
    Sair: TMenuItem;
    StatusBar: TStatusBar;
    procedure SalvarF22Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure Mapeamentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uNovaConnec, uTabelasNameAjuste;

procedure TfrmPrincipal.Mapeamentos1Click(Sender: TObject);
begin
  frmJusteTabelaNome := TfrmJusteTabelaNome.Create(Application);
  frmJusteTabelaNome.Show;
end;

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
  Exit;
end;

procedure TfrmPrincipal.SalvarF22Click(Sender: TObject);
begin
  FrmNovaConnec := TFrmNovaConnec.Create(Application);
  FrmNovaConnec.Show;
end;

end.
