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

end.
