unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.Grid, REST.Response.Adapter,
  Data.Bind.ObjectScope, REST.Authenticator.OAuth, Data.Bind.DBScope,
  Vcl.StdCtrls, FireDAC.Stan.StorageJSON, REST.Utils, Winapi.ShellAPI,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Types,
  Vcl.FileCtrl;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    BindSourceRESTResponse: TBindSourceDB;
    OAuth2Authenticator: TOAuth2Authenticator;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    BindingsList1: TBindingsList;
    RESTResponse: TRESTResponse;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    Button4: TButton;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button5: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    arq : TStringList;
    procedure salvaConfig;
    procedure carregaConfig;
    procedure carregaListaItems;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const

RSBytesOfDataReturnedAndTiming = '%d : %s - %d bytes of data returned. Timing: Pre: %dms - Exec: %dms - Post: %dms - Total: %dms';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTRequest.ResetToDefaults;
  RESTResponse.ResetToDefaults;
  RESTResponseDataSetAdapter.FieldDefs.Clear;


  OAuth2Authenticator.ClientID     := Edit1.Text;
  OAuth2Authenticator.ClientSecret := Edit2.Text;
  OAuth2Authenticator.AccessToken  := Edit3.Text;
  OAuth2Authenticator.RefreshToken := Edit4.Text;


  OAuth2Authenticator.AuthCode     := '';
  OAuth2Authenticator.ResponseType := TOAuth2ResponseType.rtCODE;


  try
    RESTRequest.Execute;
  except
    on E: TRESTResponseDataSetAdapter.EJSONValueError do
    begin
      // Ignore
    end;
    on E: TRESTResponse.EJSONValueError do
    begin
      // Ignore
    end
    else
      raise;
  end;

  if (RESTResponse.StatusCode = 200) then begin
      RESTResponse.RootElement := 'items';
      RESTResponseDataSetAdapter.NestedElements := true;

      carregaListaItems;
  end;

  //RESTResponse.GetSimpleValue('access_token', LValue) then


  memo1.Lines.Add( StringReplace( RESTResponse.FullRequestURI, '&', '&&', [rfReplaceAll] ));
  memo1.Lines.Add('');
  memo1.Lines.Add('------------------------------------------------------------');
  memo1.Lines.Add(
    Format(RSBytesOfDataReturnedAndTiming,
    [RESTResponse.StatusCode, RESTResponse.StatusText, RESTResponse.ContentLength,
    RESTRequest.ExecutionPerformance.PreProcessingTime, RESTRequest.ExecutionPerformance.ExecutionTime,
    RESTRequest.ExecutionPerformance.PostProcessingTime, RESTRequest.ExecutionPerformance.TotalExecutionTime]));

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  salvaConfig;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  carregaConfig;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  LURL : String;
begin
  LURL := OAuth2Authenticator.AuthorizationEndpoint;
  LURL := LURL + '?client_id=' + Edit1.text;
  LURL := LURL + '&response_type=code';
  LURL := LURL + '&redirect_uri=' + URIEncode(OAuth2Authenticator.RedirectionEndpoint);
  LURL := LURL + '&scope=' +URIEncode(OAuth2Authenticator.Scope);

  ShellExecute(0, 'OPEN', PChar(LURL), '', '', SW_SHOWNORMAL);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  LClient: TRESTClient;
  LRequest: TRESTRequest;
  LValue: string;
begin

  /// we need at least two things here:
  /// (1) an token-endpoint
  /// (2) a client-id
  /// (3) a client-secret
  /// (4) an auth-code (from step #1)

  LClient := TRESTClient.Create(self);

  LRequest := TRESTRequest.Create(self);
  LRequest.Client := LClient;
  LRequest.Method := TRESTRequestMethod.rmPOST;

  TRY
    LClient.BaseURL := arq.Values['AccessTokenEndpoint'];
    LRequest.AddParameter('code', edit2.Text);
    LRequest.AddParameter('client_id', edit1.Text);
    LRequest.AddParameter('client_secret', edit4.Text);
    LRequest.AddParameter('grant_type', 'authorization_code');
    LRequest.AddParameter('redirect_uri', arq.Values['RedirectionEndpoint']);


    LRequest.Execute;
    if (LRequest.Response.StatusCode = 200) then
    begin
      edit2.Text := '';
      if LRequest.Response.GetSimpleValue('access_token', LValue) then
        edit3.Text := LValue;
    end
    else begin
      Memo1.Text := LRequest.Response.Content;
    end;

  FINALLY
    FreeAndNIL(LRequest);
    FreeAndNIL(LClient);
  END;
end;

procedure TForm1.salvaConfig;
var
  arq1 : TStringList;
begin
  arq1 := TStringList.Create;
  arq1.Add('AuthorizationEndpoint=' + 'https://accounts.google.com/o/oauth2/v2/auth');
  arq1.Add('AccessTokenEndpoint='   + 'https://oauth2.googleapis.com/token');
  arq1.Add('RedirectionEndpoint='   + 'urn:ietf:wg:oauth:2.0:oob');
  arq1.Add('Scope='   + 'https://www.googleapis.com/auth/drive');
  arq1.Add('BaseURL='   + 'https://www.googleapis.com/drive/v2/files');


  arq1.Add('ClientID='              + Edit1.text);
  arq1.Add('ClientSecret='          + Edit4.text);
  arq1.Add('AccessToken='           + Edit3.text);
  arq1.Add('RefreshToken='          + Edit2.text);
  arq1.SaveToFile(ExtractFileDir(ParamStr(0)) + '\REST.DAT') ;
  arq1.Free;
end;

procedure TForm1.carregaConfig;
begin
  arq.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\REST.DAT') ;

  OAuth2Authenticator.AuthorizationEndpoint := arq.Values['AuthorizationEndpoint'];
  OAuth2Authenticator.AccessTokenEndpoint   := arq.Values['AccessTokenEndpoint'];
  OAuth2Authenticator.RedirectionEndpoint   := arq.Values['RedirectionEndpoint'];
  OAuth2Authenticator.Scope                 := arq.Values['Scope'];

  RESTClient.AllowCookies := true;
  RESTClient.BaseURL := arq.Values['BaseURL'];
  Edit1.text := arq.Values['ClientID'];
  Edit4.text := arq.Values['ClientSecret'];
  Edit3.text := arq.Values['AccessToken'];
  Edit2.text := arq.Values['RefreshToken'];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  arq := TStringList.Create;
end;

procedure TForm1.carregaListaItems;
begin
  ListBox1.Clear;
  FDMemTable1.First;


  while not FDMemTable1.Eof do begin
    ListBox1.Items.Add(iif(pos('folder', FDMemTable1.FieldByName('mimetype').AsString) > 0, '/', '') + FDMemTable1.FieldByName('title').AsString);
    FDMemTable1.Next;
  end;
end;

end.
