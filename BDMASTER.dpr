program BDMASTER;

uses
  Vcl.Forms,
  uHome in 'Views\uHome.pas' {frmHome},
  ModuloDados in 'Views\ModuloDados.pas' {DM: TDataModule},
  uNovaConnec in 'Views\uNovaConnec.pas' {frmNovaConnec},
  uTabelasNameAjuste in 'Views\uTabelasNameAjuste.pas' {frmJusteTabelaNome};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmNovaConnec, frmNovaConnec);
  Application.CreateForm(TfrmJusteTabelaNome, frmJusteTabelaNome);
  Application.Run;
end.
