program InHire;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Cliente in 'Cliente.pas',
  Carro in 'Carro.pas',
  Venda in 'Venda.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  Produto in 'Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
