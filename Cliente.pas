unit Cliente;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FIdCliente: Integer;
    FNome: string;
    FCpf: string;
  public
    procedure Inserir;
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property Nome: string read FNome write FNome;
    property CPF: string read FCpf write FCpf;
  end;

implementation

uses
  uDM;

procedure TCliente.Inserir;
begin
  DM.InserirDadosBD(
    'INSERT INTO CLIENTE ' +
    '(ID_CLIENTE, NOME, CPF) VALUES (' +

    IntToStr(IdCliente) + ', ' +
    QuotedStr(Nome) + ', ' +
    QuotedStr(CPF) +

    ')'
  );
end;

end.
