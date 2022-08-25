unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt,
  System.JSON, System.Net.HttpClient, System.Net.URLClient, System.NetConsts,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    Button1: TButton;
    Button3: TButton;
    memResult: TMemo;
    BindingsList1: TBindingsList;
    lblStatus: TLabel;
    lblToken: TLabel;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    LinkControlToField1: TLinkControlToField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button6: TButton;
    Button8: TButton;
    DBGrid1: TDBGrid;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    fToken: string;
    LHttp: THttpClient;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  cURL: string = '';
  cUserName: string = '';
  cPassword: string = '';
  cJsonBody: string = '{"data_atualizacao":"06/06/2022"}';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTClient1.BaseURL := cURL;
  HTTPBasicAuthenticator1.Username := cUserName;
  HTTPBasicAuthenticator1.Password := cPassword;
  try
    RESTRequest1.Execute;
  except
    on E: Exception do
      raise Exception.Create('Error Message: ' + E.Message);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  RESTRequest2.Params.ParameterByName('X-CSRF-Token').Value := fToken;
  RESTRequest2.Params.ParameterByName('data_atualizacao').Value := cJsonBody;

  Screen.Cursor := crHourGlass;
  try
    try
      RESTRequest2.Execute;
    except
      on E: Exception do
        raise Exception.Create('Error Message: ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  LRequest: IHTTPRequest;
  LResponse: IHTTPResponse;
begin
  try
    if not Assigned(LHttp) then
    begin
      LHttp := THttpClient.Create;

      // allow cookies
      LHttp.AllowCookies := True;

      // set the user credentials
      LHttp.PreemptiveAuthentication := True;
      LHttp.CredentialsStorage.AddCredential
        (TCredentialsStorage.TCredential.Create(TAuthTargetType.Server, '',
        cURL, cUserName, cPassword));
    end;

    // set the GET request
    LRequest := LHttp.GetRequest('GET', cURL);

    // customize the request with headers...
    LRequest.AddHeader('content-type', 'application/json');
    LRequest.AddHeader('X-CSRF-Token', 'fetch');

    // execute the request
    LResponse := LHttp.Execute(LRequest);
    lblStatus.Caption := 'Status: ' + LResponse.StatusCode.ToString;
    if LResponse.StatusCode = 200 then
    begin
      fToken := LResponse.HeaderValue['X-CSRF-Token'].Trim;
      lblToken.Caption := 'Token: ' + fToken;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error Message: ' + E.Message);
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  LRequest: IHTTPRequest;
  LResponse: IHTTPResponse;
  LBody: TStringStream;
begin
  Screen.Cursor := crHourGlass;
  try
    try
      // set the POST request
      LRequest := LHttp.GetRequest('POST', cURL);

      // customize the request with headers...
      LRequest.AddHeader('content-type', 'application/json');
      LRequest.AddHeader('X-CSRF-Token', fToken);

      // add the request body
      LBody := TStringStream.Create(cJsonBody);
      LRequest.SourceStream := LBody;

      // execute the request
      LResponse := LHttp.Execute(LRequest);
      lblStatus.Caption := 'Status: ' + LResponse.StatusCode.ToString;
      if LResponse.StatusCode = 200 then
      begin
        memResult.Text := LResponse.ContentAsString;
        var rJson := TRESTResponseJSON.Create(nil,
          TJSONObject.ParseJSONValue(memResult.Text), False);
        RESTResponseDataSetAdapter1.ResponseJSON := rJson;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error Message: ' + E.Message);
    end;
  finally
    LBody.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Width <> 55 then
    Column.Width := 55;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LHttp := nil;
end;

procedure TForm1.RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
begin
  fToken := RESTResponse1.Headers.Values['X-CSRF-Token'].Trim;
  lblToken.Caption := 'Token: ' + fToken;
end;

end.
