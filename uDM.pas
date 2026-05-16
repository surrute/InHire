unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InserirDadosBD(const ASQL: string);
    function ExecutarSQL(const ASQL: string): TFDQuery;
    function ValidaCSTEmpresa(ACST, AEstadoEmpresa, AEstadoPessoa, ACFOP: string): Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

function TDM.ExecutarSQL(const ASQL: string): TFDQuery;
begin
  Result := TFDQuery.Create(nil);

  try
    Result.Connection := DM.FDConnection;

    Result.SQL.Text := ASQL;

    Result.Open;

  except
    Result.Free;
    raise;
  end;
end;

procedure TDM.InserirDadosBD(const ASQL: string);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DM.FDConnection;

    Qry.SQL.Text := ASQL;

    Qry.ExecSQL;

  finally
    Qry.Free;
  end;
end;

function TDM.ValidaCSTEmpresa(ACST, AEstadoEmpresa, AEstadoPessoa, ACFOP: string): Boolean;
begin
  Result := False;

  if ((ACST = '010') and ((AEstadoEmpresa = 'PR') or (AEstadoPessoa = 'SP'))) or
     ((ACST = '010') and ((AEstadoEmpresa = 'PR') or (AEstadoPessoa <> 'SC'))) or
     ((ACST = '010') and ((AEstadoEmpresa = 'PR') or (AEstadoPessoa <> 'RJ'))) or
     ((ACST = '020') and ((AEstadoEmpresa <> 'SP') and (AEstadoPessoa = 'SP'))) then
    Result := True;

end;

end.
