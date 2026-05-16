unit Venda;

interface

uses
  System.SysUtils, Cliente, Carro;

type
  TVenda = class
  private
    FIdVenda: Integer;
    FCliente: TCliente;
    FCarro: TCarro;
    FDataVenda: TDate;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Inserir;
    property IdVenda: Integer read FIdVenda write FIdVenda;
    property Cliente: TCliente read FCliente write FCliente;
    property Carro: TCarro read FCarro write FCarro;
    property DataVenda: TDate read FDataVenda write FDataVenda;
  end;

implementation

uses
  uDM;

constructor TVenda.Create;
begin
  inherited;

  FCliente := TCliente.Create;
  FCarro   := TCarro.Create;
end;

destructor TVenda.Destroy;
begin
  FCliente.Free;
  FCarro.Free;

  inherited;
end;

procedure TVenda.Inserir;
begin
  DM.InserirDadosBD(
    'INSERT INTO VENDA ' +
    '(ID_VENDA, ID_CLIENTE, ID_CARRO, DATA_VENDA) VALUES (' +

    IntToStr(IdVenda) + ', ' +
    IntToStr(Cliente.IdCliente) + ', ' +
    IntToStr(Carro.IdCarro) + ', ' +
    QuotedStr(
      FormatDateTime('yyyy-mm-dd', DataVenda)
    ) +

    ')'
  );
end;
end.
