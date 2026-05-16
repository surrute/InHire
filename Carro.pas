unit Carro;

interface

uses
  System.SysUtils;

type
  TCarro = class
  private
    FIdCarro: Integer;
    FModelo: string;
    FDataLancamento: TDate;
  public
    procedure Inserir;
    property IdCarro: Integer read FIdCarro write FIdCarro;
    property Modelo: string read FModelo write FModelo;
    property DataLancamento: TDate read FDataLancamento write FDataLancamento;
  end;

implementation

uses
  uDM;

procedure TCarro.Inserir;
begin
  DM.InserirDadosBD(
    'INSERT INTO CARRO ' +
    '(ID_CARRO, MODELO, DATA_LANCAMENTO) VALUES (' +

    IntToStr(IdCarro) + ', ' +
    QuotedStr(Modelo) + ', ' +
    QuotedStr(
      FormatDateTime('yyyy-mm-dd', DataLancamento)
    ) +

    ')'
  );
end;

end.
