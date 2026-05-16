unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm1 = class(TForm)
    bbInserir5Clientes: TBitBtn;
    bbInserir5Carros: TBitBtn;
    bbInserir5Vendas: TBitBtn;
    GroupBox: TGroupBox;
    Label1: TLabel;
    edtConsulta: TEdit;
    DBGrid1: TDBGrid;
    bbConsultaCliente: TBitBtn;
    bbConsultaCarro: TBitBtn;
    bbConsultaVenda: TBitBtn;
    Label2: TLabel;
    DataSource: TDataSource;
    bbInserir10Produtos: TBitBtn;
    procedure bbInserir5ClientesClick(Sender: TObject);
    procedure bbInserir5CarrosClick(Sender: TObject);
    procedure bbInserir5VendasClick(Sender: TObject);
    procedure bbConsultaClienteClick(Sender: TObject);
    procedure bbConsultaCarroClick(Sender: TObject);
    procedure bbConsultaVendaClick(Sender: TObject);
    procedure bbInserir10ProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uDM, Cliente, Carro, Venda, Produto;

{$R *.dfm}

procedure TForm1.bbConsultaCarroClick(Sender: TObject);
var
  strSQL: string;
begin
  GroupBox.Caption := 'Consultando Carro';
  strSQL := 'SELECT * FROM CARRO';
  if Integer(edtConsulta.Text) > 0 then
    strSQL := strSQL + ' WHERE ID_CARRO = ' + edtConsulta.Text;

  DataSource.DataSet := DM.ExecutarSQL(strSQL);
end;

procedure TForm1.bbConsultaClienteClick(Sender: TObject);
var
  strSQL: string;
begin
  GroupBox.Caption := 'Consultando Cliente';
  strSQL := 'SELECT * FROM CLIENTE';
  if Integer(edtConsulta.Text) > 0 then
    strSQL := strSQL + ' WHERE ID_CLIENTE = ' + edtConsulta.Text;

  DataSource.DataSet := DM.ExecutarSQL(strSQL);
end;

procedure TForm1.bbConsultaVendaClick(Sender: TObject);
var
  strSQL: string;
begin
  GroupBox.Caption := 'Consultando Venda';
  strSQL := 'SELECT * FROM VENDA';
  if Integer(edtConsulta.Text) > 0 then
    strSQL := strSQL + ' WHERE ID_VENDA = ' + edtConsulta.Text;

  DataSource.DataSet := DM.ExecutarSQL(strSQL);
end;

procedure TForm1.bbInserir10ProdutosClick(Sender: TObject);
var
  ListaProdutos: TObjectList<TProduto>;
  Produto: TProduto;
  I: Integer;
begin
  ListaProdutos := TObjectList<TProduto>.Create(True);
  try

    for I := 1 to 10 do
    begin
      Produto := TProduto.Create;

      Produto.IdProduto := I;
      Produto.Descricao := 'PRODUTO ' + IntToStr(I);

      // FK fictícia
      Produto.IdProdutoRegra := 1;

      ListaProdutos.Add(Produto);
    end;

    for Produto in ListaProdutos do
    begin
      Produto.GravarProduto;

      ShowMessage('Produto gravado: ' + Produto.Descricao);
    end;

  finally
    ListaProdutos.Free;
  end;
end;

procedure TForm1.bbInserir5CarrosClick(Sender: TObject);
var
  Carro: TCarro;
  I: Integer;
begin
  for I := 1 to 5 do
  begin
    Carro := TCarro.Create;
    try
      Carro.IdCarro := I;
      Carro.Modelo := 'MODELO ' + IntToStr(I);
      Carro.DataLancamento := EncodeDate(2021, 1, I);

      Carro.Inserir;

    finally
      Carro.Free;
    end;
  end;
end;

procedure TForm1.bbInserir5ClientesClick(Sender: TObject);
var
  Cliente: TCliente;
  I: Integer;
begin
  for I := 1 to 5 do
  begin
    Cliente := TCliente.Create;
    try
      Cliente.IdCliente := I;
      Cliente.Nome := 'CLIENTE ' + IntToStr(I);
      Cliente.CPF := '0123456789' + IntToStr(I);

      Cliente.Inserir;

    finally
      Cliente.Free;
    end;
  end;
end;

procedure TForm1.bbInserir5VendasClick(Sender: TObject);
var
  Venda: TVenda;
  I: Integer;
begin
  for I := 1 to 5 do
  begin
    Venda := TVenda.Create;
    try
      Venda.IdVenda := I;

      Venda.Cliente.IdCliente := I;
      Venda.Carro.IdCarro := I;

      Venda.DataVenda := Date;

      Venda.Inserir;

    finally
      Venda.Free;
    end;
  end;
end;

end.

