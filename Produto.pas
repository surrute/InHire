unit Produto;

interface

uses
  System.SysUtils;

type
  TProduto = class
  private
    FIdProduto: Integer;
    FDescricao: string;
    FIdProdutoRegra: Integer;
  public
    procedure GravarProduto;
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property Descricao: string read FDescricao write FDescricao;
    property IdProdutoRegra: Integer read FIdProdutoRegra write FIdProdutoRegra;
  end;

implementation

uses
  uDM;

{ TProduto }

procedure TProduto.GravarProduto;
begin
  DM.InserirDadosBD(

    'INSERT INTO PRODUTO ' +
    '(ID_PRODUTO, DESCRICAO, ID_PRODUTOREGRA) ' +
    'VALUES (' +

    IntToStr(IdProduto) + ', ' +
    QuotedStr(Descricao) + ', ' +
    IntToStr(IdProdutoRegra) +

    ')'
  );
end;

end.
