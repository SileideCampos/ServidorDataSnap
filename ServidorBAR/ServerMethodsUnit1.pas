unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DB, MemDS, DBAccess, Uni,
  UniProvider, SQLServerUniProvider; {UniProvider, SQLServerUniProvider,
  Data.DB, DBAccess, Uni, MemDS}

type
{$METHODINFO ON}
  Ty = class(TDataModule)
    //UniConnection1: TUniConnection;
    //SQLServerUniProvider1: TSQLServerUniProvider;
    //qryDevedores: TUniQuery;
    //UniQuery1: TUniQuery;
  private

    { Private declarations }
  public
    { Public declarations }
    function EchoString2(Value: string): string;
    function ReverseString(Value: string): string;
    function Debito(nome: String): TJSONValue;
    procedure chamarGarcom(mesa: Integer);
    procedure pedirCerveja(mesa: Integer);
    function fecharConta(mesa: Integer): string;
    function cardapioDia: string;
  end;
{$METHODINFO OFF}


  TDevedor = class
    private
      FNome: String;
      FValor: String;
    public
      property nome:  String read FNome  write FNome;
      property valor:  String read FValor  write FValor;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, Rest.JSON, FormUnit1;

function Ty.Debito(nome: String): TJSONValue;
var
  devedor: TDevedor;
  total: Double;
begin
  {qryDevedores.Close;
  try
    //qryDevedores.ParamByName('nome').AsString := nome;
    qryDevedores.Open;

    total := 0;
    devedor := TDevedor.Create;
    while not (qryDevedores.Eof) do
    begin
      total := total + StrToFloat(StringReplace(qryDevedores.FieldByName('valor').AsString, '.', ',', [rfReplaceAll]));
      qryDevedores.Next;
    end;
    devedor.FValor := total.ToString;
    devedor.FNome  := qryDevedores.FieldByName('nome').AsString;

    result := TJSON.ObjectToJsonObject(devedor);
    Form1.Memo1.Text := result.ToJSON;
  finally
    devedor.Free;
  end;}
end;

function Ty.EchoString2(Value: string): string;
begin
  Result := Value;
end;

function Ty.fecharConta(mesa: Integer): string;
var
  total: Double;
  nome: string;
begin
  {total := 0;
  case mesa of
    1: nome := 'Camila';
    2: nome := 'Bruno';
    3: nome := 'Sileide';
  end;
  qryDevedores.Close;
  qryDevedores.ParamByName('nome').AsString := nome;
  qryDevedores.Open;
  while not (qryDevedores.Eof) do
  begin
    total := total + StrToFloat(StringReplace(qryDevedores.FieldByName('valor').AsString, '.', ',', [rfReplaceAll]));
    qryDevedores.Next;
  end;
  Form1.Memo1.Lines.Add('A mesa '+mesa.ToString+' pediu o fechamento da conta.');
  result := ' Débitos finalizados no valor de '+total.ToString+' reais. Deseja uma saideira? Press 1 = SIM. Press 2 = Não ';
  }
end;

function Ty.cardapioDia: string;
var
  cardapio: string;
begin
  //selecionar dados no banco e devolver para o cliente
  case dayofweek(now) of
    1: cardapio := 'Feijoada';
    2: cardapio := 'Rabada';
    3: cardapio := 'Ensopado';
    4: cardapio := 'Cozido';
    5: cardapio := 'Comida Baiana';
  end;
  result := cardapio;
  //Mudar para TJSONVALUE
end;

procedure Ty.chamarGarcom(mesa: Integer);
begin
  Form1.Memo1.Lines.Add('Mesa '+mesa.ToString+' solicita atendimento do garçom!');
  Form1.Memo1.Lines.Add('Existem pedidos pendentes para esta mesa');
  //Form1.Memo1.Lines.Add('Não existem pedidos pendentes para esta mesa');
end;

procedure Ty.pedirCerveja(mesa: Integer);
var
  cerveja: string;
begin
  //select de cerveja já pedida pela mesa
  //se já foi pedida, levar, senão pode levar a variedade existente
  //ou levar cardápio para consultar preferência do cliente
  case mesa of
    1: cerveja := 'Heineken';
    2: cerveja := 'Heineken';
    3: cerveja := 'Stella';
  end;
  Form1.Memo1.Lines.Add('Levar uma cerveja <'+cerveja+'> para a mesa '+mesa.ToString);
  //Insert nos pedidos
end;

function Ty.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

