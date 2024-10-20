unit uHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Menus, Vcl.VirtualImage,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TfrmHome = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    Aplicativo1: TMenuItem;
    Novo: TMenuItem;
    SalvarF21: TMenuItem;
    SalvarCtrlS1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ProcessoETL1: TMenuItem;
    AjusteTabela: TMenuItem;
    AjusteCol: TMenuItem;
    AjusteRegistro: TMenuItem;
    N1: TMenuItem;
    ServidordeProcessos1: TMenuItem;
    Cadastros1: TMenuItem;
    abelas1: TMenuItem;
    Colunas1: TMenuItem;
    N2: TMenuItem;
    Junes1: TMenuItem;
    Sair: TMenuItem;
    Ultils1: TMenuItem;
    ConverterExcel1: TMenuItem;
    ConverterCSV1: TMenuItem;
    procedure NovoClick(Sender: TObject);
    procedure AjusteTabelaClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Filtros1Click(Sender: TObject);
    procedure AjusteColClick(Sender: TObject);
    procedure AjusteRegistroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

uses uNovaConnec, uTabelasNameAjuste, uAjusteColunas, uAJusteRegistro;

procedure TfrmHome.AjusteColClick(Sender: TObject);
begin
  frmAjusteColunas := TfrmAjusteColunas.Create(Application);
  frmAjusteColunas.Show;
end;

procedure TfrmHome.AjusteRegistroClick(Sender: TObject);
begin
  FrmAjusteRegistros := TfrmAjusteRegistros.Create(Application);
  FrmAjusteRegistros.Show;
end;

procedure TfrmHome.AjusteTabelaClick(Sender: TObject);
begin
  frmJusteTabelaNome := TfrmJusteTabelaNome.Create(Application);
  frmJusteTabelaNome.Show;
end;

procedure TfrmHome.BitBtn1Click(Sender: TObject);
begin
  FrmNovaConnec := TFrmNovaConnec.Create(Application);
  FrmNovaConnec.Show;
end;

procedure TfrmHome.BitBtn2Click(Sender: TObject);
begin
  frmJusteTabelaNome := TfrmJusteTabelaNome.Create(Application);
  frmJusteTabelaNome.Show;
end;

procedure TfrmHome.Filtros1Click(Sender: TObject);
begin
  FrmNovaConnec := TFrmNovaConnec.Create(Application);
  FrmNovaConnec.Show;
end;

procedure TfrmHome.SairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHome.NovoClick(Sender: TObject);
begin
  FrmNovaConnec := TFrmNovaConnec.Create(Application);
  FrmNovaConnec.Show;
end;
end.
