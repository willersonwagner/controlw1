{***************************************************************************}
{ TMS Cloud Storage access demo                                             }
{ for Delphi & C++Builder                                                   }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright � 2012 - 2017                                        }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}

{$IFDEF ANDROID}
{$DEFINE MOBILE}
{$ENDIF}
{$IFDEF IOS}
{$DEFINE MOBILE}
{$ENDIF}

unit UCloudStorageDemo;

interface

uses
  FMX.Forms, SysUtils, DateUtils,System.StrUtils,FMX.TMSCloudDropBox, FMX.TMSCloudGDrive, UITypes, FMX.Dialogs, FMX.TMSCloudBoxNet,
  FMX.Header, FMX.TMSCloudWinLive, FMX.TMSCloudBase, FMX.StdCtrls,
  FMX.Layouts, FMX.TreeView, FMX.Controls, System.Classes, FMX.Types,
  FMX.TMSCloudCustomWinLive, FMX.TMSCloudCustomGDrive, FMX.TMSCloudBaseFMX, FMX.TMSCloudCustomDropBox,
  FMX.TMSCloudCustomBoxNet, FMX.TMSCloudCustomAmazonCloudDrive,
  FMX.TMSCloudAmazonCloudDrive, FMX.TMSCloudCustomOpenStack,
  FMX.TMSCloudCustomHubic, FMX.TMSCloudHubic, FMX.TMSCloudCustomHiDrive, FMX.TMSCloudHiDrive,
  FMX.Controls.Presentation, FMX.TMSCloudTreeViewAdapter, System.ImageList,
  FMX.ImgList, IOUtils, FMX.TMSCloudCustomYandexDisk, FMX.TMSCloudYandexDisk,
  FMX.Edit, FireDAC.Stan.Def, FireDAC.FMXUI.Wait, FireDAC.Phys.IBWrapper,
  FMX.ScrollBox, FMX.Memo, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.UI.Intf, FireDAC.Phys.FBDef, FireDAC.Phys.FB, FireDAC.Comp.UI,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, sevenzip,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IniFiles;

type
  TForm4 = class(TForm)
    TMSFMXCloudBoxNetDrive1: TTMSFMXCloudBoxNetDrive;
    TMSFMXCloudDropBox1: TTMSFMXCloudDropBox;
    TMSFMXCloudGDrive1: TTMSFMXCloudGDrive;
    TMSFMXCloudSkyDrive1: TTMSFMXCloudSkyDrive;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    RadioGroup1: TPanel;
    ConnectBtn: TButton;
    Panel2: TPanel;
    TreeView1: TTreeView;
    ProgressBar1: TProgressBar;
    DisconnectBtn: TButton;
    clrAccess: TCheckBox;
    ProgressLabel: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    TMSFMXCloudAmazonCloudDrive1: TTMSFMXCloudAmazonCloudDrive;
    RadioButton6: TRadioButton;
    TMSFMXCloudHubic1: TTMSFMXCloudHubic;
    TMSFMXCloudHiDrive1: TTMSFMXCloudHiDrive;
    RadioButton7: TRadioButton;
    TMSFMXCloudTreeViewAdapter1: TTMSFMXCloudTreeViewAdapter;
    ImageList1: TImageList;
    TMSFMXCloudYandexDisk1: TTMSFMXCloudYandexDisk;
    RadioButton5: TRadioButton;
    FDIBBackup1: TFDIBBackup;
    Memo1: TMemo;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDTransaction1: TFDTransaction;
    Button1: TButton;
    ProgressBar2: TProgressBar;
    progresslabel1: TLabel;
    horaatual: TLabel;
    horaProxBackup: TLabel;
    Timer1: TTimer;
    timerativaBackup: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    msg: TLabel;
    TimerValidaRegistro: TTimer;
    FDIBSDump1: TFDIBSDump;
    procedure ConnectBtnClick(Sender: TObject);
    procedure DownloadBtnClick(Sender: TObject);
    procedure UploadBtnClick(Sender: TObject);
    procedure TMSFMXCloudDropBox1UploadProgress(Sender: TObject; FileName: string;
      Position, Total: Int64);
    procedure DisconnectBtnClick(Sender: TObject);
    procedure CreateFolderBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure TMSFMXCloudDropBox1AuthFormClose(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject);
    procedure TMSFMXCloudDropBox1Connected(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FDIBBackup1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerativaBackupTimer(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TMSFMXCloudGDrive1DownloadProgress(Sender: TObject;
      FileName: string; Position, Total: Int64);
  private
    function Contido(substring: string; texto: string): boolean;
    function StrNum(const entra: string) :  string;
    procedure comprime7zip(Origem, destino : String);
    procedure LE_CAMPOS(var mat: tstringList; LIN: String; const separador: String;criaMAT: boolean = true);
    { Private declarations }
  public
    { Public declarations }
    rdg: Integer;
    intervaloEntreBackupMinutos : integer;
    Authenticated: boolean;
    IsDownloading: boolean;
    IsUploading: boolean;
    caminhoRaiz, cnpj : String;
    proximoBackup : TDateTime;
    pastaInicial : TTMSFMXCloudItem;
    function buscaRetornoSite(site, cnpj : String) : String;
    procedure abrirPainel();
    function buscaPastaGdrive(nome : string; cis : TTMSFMXCloudItems) : TTMSFMXCloudItem;
    function Storage: TTMSFMXCloudStorageFMX;
    procedure ShowItem;
    procedure DoConnect;
    procedure DoDisconnect;
end;

var
  Form4: TForm4;

implementation

{$R *.FMX}

// PLEASE USE A VALID INCLUDE FILE THAT CONTAINS THE APPLICATION KEY & SECRET
// FOR THE CLOUD STORAGE SERVICES YOU WANT TO USE
// STRUCTURE OF THIS .INC FILE SHOULD BE
//
// const
//  DropBoxAppkey = 'xxxxxxxxx';
//  DropBoxAppSecret = 'yyyyyyyy';
//
//  WinLiveClientID = 'xxxxxxxxxxx';
//  WinLiveClientSecret = 'yyyyyyyyyy';
//
//  GoogleAppKey = 'xxxxxxxxxxx';
//  GoogleAppSecret = 'yyyyyyyyyyy';
//
//  BoxNetAppKey = 'xxxxxxxxxxx';
//  BoxNetAppSecret = 'yyyyyyyyyyy';
//
//  AmazonCloudDriveAppKey = 'xxxxxxxxxxx';
//  AmazonCloudDriveAppSecret = 'yyyyyyyyyyy';
//  AmazonCloudDriveCallBack = 'zzzzzzzzzzz';
//
//  HubicAppKey := 'xxxxxxxxxxx';
//  HubicAppSecret := 'yyyyyyyyyyy';
//  HubicCallBack = 'zzzzzzzzzzz';

//  HiDriveAppKey := 'xxxxxxxxxxx';
//  HiDriveAppSecret := 'yyyyyyyyyyy';

//  YandexDiskAppKey = 'xxxxxxxxxxx';
//  YandexDiskAppSecret = 'yyyyyyyyyyy';

{$I APPIDS.INC}

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  horaatual.Text := FormatDateTime('hh:mm:ss', now);
  if (now > proximoBackup) and (IsUploading = false) then begin
    timerativaBackup.Enabled := true;
  end;
end;

procedure TForm4.timerativaBackupTimer(Sender: TObject);
begin
  timerativaBackup.Enabled := false;
  Timer1.Enabled           := true;

  horaProxBackup.Text := FormatDateTime('hh:mm:ss', proximoBackup);
  Button1Click(self);
  proximoBackup := IncMinute(now, intervaloEntreBackupMinutos);
end;

procedure TForm4.TMSFMXCloudDropBox1AuthFormClose(Sender: TObject);
begin
  if not Authenticated then
    DoDisconnect;
end;

procedure TForm4.TMSFMXCloudDropBox1Connected(Sender: TObject);
var
  cs: TTMSFMXCloudStorageFMX;
begin
  Authenticated := true;

  if (Sender is TTMSFMXCloudStorageFMX) then
  begin
    cs := Sender as TTMSFMXCloudStorageFMX;
    cs.SaveTokens;
  end;

  TMSFMXCloudTreeViewAdapter1.CloudStorage := Storage;
  TreeView1.Visible := false;
  DoConnect;
end;

procedure TForm4.TMSFMXCloudDropBox1UploadProgress(Sender: TObject; FileName: string;
  Position, Total: Int64);
begin
  progressbar2.Value := Position;
  ProgressBar2.Max   := Total;
  Progresslabel1.Text  :='Upload:> '+ InttoStr(Position) +' of ' + InttoStr(Total) +' uploaded';
  Application.ProcessMessages;
end;

procedure TForm4.TMSFMXCloudGDrive1DownloadProgress(Sender: TObject;
  FileName: string; Position, Total: Int64);
begin
  if IsUploading = false then begin
    progressbar2.Value := Position;
    ProgressBar2.Max   := Total;
    Progresslabel1.Text  :='Download:> '+ InttoStr(Position) +' de ' + InttoStr(Total) +' Baixado';
    Application.ProcessMessages;
  end;
end;

procedure TForm4.CreateFolderBtnClick(Sender: TObject);
var
  ci: TTMSFMXCloudItem;
  FolderName: string;
begin
  FolderName := '';

  if InputQuery('Name','Name for new folder',FolderName) and (FolderName <> '') then
  begin
    ci := nil;

    if Assigned(TreeView1.Selected) then
    begin
      ci := TTMSFMXCloudItem(TTMSFMXCloudTreeViewItem(TreeView1.Selected).DataObject);
      if ci.ItemType <> ciFolder then
        ci := nil;
    end;

    Storage.CreateFolder(ci,FolderName);
    TMSFMXCloudTreeViewAdapter1.InitTreeView;
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  nome, FolderName, arquivo, site : String;
  ci, ci_ant, nci: TTMSFMXCloudItem;
  cis : TTMSFMXCloudItems;
  i : integer;
  gdriveItem : TGDriveItem;
  lista : TStringList;
begin
  IsUploading := true;
  try

  if FDConnection1.Connected = false then begin
   FDConnection1.ConnectionName := caminhoRaiz + 'bd.fdb';
   FDConnection1.Params.Clear;
   FDConnection1.Params.Add('DriverID=FB');
   FDConnection1.Params.Add('password=SYSTEMA1');
   FDConnection1.Params.Add('user_name=sysdba');
   FDConnection1.Params.Add('Database='+caminhoRaiz+'BD.FDB');

   FDConnection1.Connected := true;
  end;

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select empresa, cnpj from registro';
  FDQuery1.Open;

  nome := trim(FDQuery1.FieldByName('empresa').AsString);
  cnpj := StrNum(trim(FDQuery1.FieldByName('cnpj').AsString));

  site := buscaRetornoSite('',cnpj);
  LE_CAMPOS(lista, site, '|', true);

  if lista.Values['1'] = '0' then begin
    Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Sistema Nao Registrado, entre em contato com o suporte!');
    timerativaBackup.Interval := 10000;
    timerativaBackup.Enabled := true;
    exit;
  end;


  if StrToDate(lista.Values['3']) < now then begin
    Memo1.Lines.Add('O Registro est� Vencido! Entre em Contato com o Desenvolvedor.');
    timerativaBackup.Interval := 10000;
    timerativaBackup.Enabled := true;
    exit;
  end;


  FDConnection1.Connected := false;

  if DirectoryExists(caminhoRaiz + 'SisBackup/') = false then ForceDirectories(caminhoRaiz + 'SisBackup/');

  FDIBBackup1.Database := caminhoRaiz + 'bd.fdb';
  FDIBBackup1.UserName := 'sysdba';
  FDIBBackup1.Password := 'SYSTEMA1';
  FDIBBackup1.BackupFiles.Clear;
  FDIBBackup1.BackupFiles.Add(caminhoRaiz + 'SisBackup/' + 'BD.fbk');
  FDIBBackup1.Backup;

  Memo1.Lines.Add('');
  Memo1.Lines.Add('');

  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Backup Criado OK!');

  comprime7zip(caminhoRaiz + 'SisBackup/' + 'BD.fbk', caminhoRaiz + 'SisBackup/' + 'BD.7z');
  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Compacta��o 7z OK');

  //RenameFile(caminhoRaiz + 'SisBackup/' + 'BD.7z', caminhoRaiz + 'SisBackup/' + 'BD'+FormatDateTime('hhmm', now)+'.7z');
  arquivo := caminhoRaiz + 'SisBackup/' + 'BD'+FormatDateTime('hhmm', now)+'.7z';



  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Iniciando Transmissao...');

  Memo1.SelStart := Length(Memo1.Text);
  Application.ProcessMessages;

  rdg := 1;
  ConnectBtnClick(self);

  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Conectado com Sucesso!');

  FolderName := nome + '-'+ cnpj;

  ci := nil;
  ci := buscaPastaGdrive('Backups', Storage.GetFolderListHierarchical(nil));


  ci_ant := buscaPastaGdrive(cnpj, Storage.GetFolderListHierarchical(ci));
  if ci_ant = nil then begin
    ci := Storage.CreateFolder(ci, cnpj);
  end
  else begin
    ci := ci_ant;
  end;

  ci_ant := buscaPastaGdrive(FormatDateTime('dddd', now), Storage.GetFolderListHierarchical(ci));
  if ci_ant = nil then begin
    ci := Storage.CreateFolder(ci, FormatDateTime('dddd', now));
  end
  else begin
    ci := ci_ant;
  end;

  pastaInicial := ci;

  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Estrutura de Pastas Criada!');


  ProgressBar2.Value := 0;
  ProgressBar2.Visible := true;

  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Upload Iniciado...');
  nci := Storage.Upload(ci, arquivo);
  Memo1.Lines.Add(FormatDateTime('hh:mm:ss', now) + ' Upload Concluido...');

  //Storage.Download(Nci,'D:\NOVO.7Z');

  except
    on e:exception do begin
      Memo1.Lines.Add(e.Message);
    end;
  end;

  abrirPainel;
  IsUploading := false;
end;

procedure TForm4.ConnectBtnClick(Sender: TObject);
var
  fn: string;
begin
  {$IFDEF MOBILE}
  fn := TPath.GetSharedDocumentsPath + PathDelim;
  {$ELSE}
  fn := ExtractFilePath(Paramstr(0));
  {$ENDIF}
  TMSFMXClouddropbox1.App.Key := 'fv25ulzw1rbkgi2';
  TMSFMXClouddropbox1.App.Secret := '48e7tp21ztiu4e6';
  TMSFMXCloudDropBox1.PersistTokens.Key := fn + 'dropbox.ini';

  TMSFMXCloudskydrive1.App.Key := WinLiveClientID;
  TMSFMXCloudskydrive1.App.Secret := WinLiveClientSecret;
  TMSFMXCloudskydrive1.PersistTokens.Key := fn + 'skydrive.ini';

  TMSFMXCloudgdrive1.App.Key := '494112256923-r3j76nefc21jnli6osumv5p8dro5qeg4.apps.googleusercontent.com';
  TMSFMXCloudgdrive1.App.Secret := 'lxsTV-P-xR09EI6CERjG_yjk';
  TMSFMXCloudgdrive1.PersistTokens.Key := fn + 'gdrive.ini';

  TMSFMXCloudBoxNetDrive1.App.Key := BoxNetAppKey;
  TMSFMXCloudBoxNetDrive1.App.Secret := BoxNetAppSecret;
  TMSFMXCloudBoxNetDrive1.PersistTokens.Key := fn + 'boxnetdrive.ini';

  TMSFMXCloudAmazonCloudDrive1.App.Key := AmazonCloudDriveAppKey;
  TMSFMXCloudAmazonCloudDrive1.App.Secret := AmazonCloudDriveAppSecret;
  TMSFMXCloudAmazonCloudDrive1.App.CallBackURL := AmazonCloudDriveCallBack;
  TMSFMXCloudAmazonCloudDrive1.PersistTokens.Key := fn + 'amazondrive.ini';

  TMSFMXCloudHubic1.App.Key := HubicAppKey;
  TMSFMXCloudHubic1.App.Secret := HubicAppSecret;
  TMSFMXCloudHubic1.App.CallBackURL := HubicCallBack;
  TMSFMXCloudHubic1.PersistTokens.Key := fn + 'hubic.ini';

  TMSFMXCloudHiDrive1.App.Key := HiDriveAppKey;
  TMSFMXCloudHiDrive1.App.Secret := HiDriveAppSecret;
  TMSFMXCloudHiDrive1.PersistTokens.Key := fn + 'hidrive.ini';

  TMSFMXCloudYandexDisk1.App.Key := YandexDiskAppKey;
  TMSFMXCloudYandexDisk1.App.Secret := YandexDiskAppSecret;
  TMSFMXCloudYandexDisk1.PersistTokens.Key := fn + 'yandex.ini';

  RadioGroup1.Enabled := false;

  Storage.Connect;
end;


procedure TForm4.DeleteBtnClick(Sender: TObject);
var
  ci: TTMSFMXCloudItem;
begin
  if Assigned(treeview1.Selected) then
  begin
    ci := TTMSFMXCloudItem(TTMSFMXCloudTreeViewItem(TreeView1.Selected).DataObject);

    if MessageDlg('Are you sure to delete item:'+ ci.FileName, TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes then
    begin
      Storage.Delete(ci);
      ci.Free;
      TreeView1.RemoveObject(TreeView1.Selected);
    end;
  end;
end;

procedure TForm4.DisconnectBtnClick(Sender: TObject);
begin
  DoDisconnect;
end;

procedure TForm4.DoConnect;
begin
  ConnectBtn.Enabled := false;
  DisconnectBtn.Enabled := true;
  RadioGroup1.Enabled := false;
end;

procedure TForm4.DoDisconnect;
begin
  if clrAccess.IsChecked  then
    Storage.ClearTokens;

  Storage.Disconnect;

  Authenticated := false;
  ConnectBtn.Enabled := true;
  DisconnectBtn.Enabled := false;
  RadioGroup1.Enabled := true;
 end;

procedure TForm4.DownloadBtnClick(Sender: TObject);
var
  ci: TTMSFMXCloudItem;
  cis: TTMSFMXCloudItems;
  sv: TSaveDialog;
begin
  if Assigned(treeview1.Selected) then
  begin
    ci := TTMSFMXCloudItem(TTMSFMXCloudTreeViewItem(TreeView1.Selected).DataObject);
    if ci.ItemType = ciFile then
    begin
      sv := TSaveDialog.Create(Self);
      sv.FileName := ci.FileName;
      if sv.Execute then
      begin
        IsDownloading := true;
        Storage.Download(ci,sv.FileName);
        ShowMessage('Arquivo ' +  ci.FileName + ' Baixado');
      end;

      sv.Free;
    end;
  end;
end;

procedure TForm4.FDIBBackup1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Memo1.Lines.Add(AMessage);
  Memo1.SelStart := Length(Memo1.Text);
  Application.ProcessMessages;
  //SendMessage(Memo1.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  rdg := 0;
  TMSFMXCloudTreeViewAdapter1.TreeView := TreeView1;

  caminhoRaiz := ExtractFileDir(ParamStr(0)) + '/';
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  timerativaBackup.Enabled    := true;
  intervaloEntreBackupMinutos := 180;
  IsUploading := false;
end;

procedure TForm4.RadioButton4Change(Sender: TObject);
begin
  rdg := (Sender as TRadioButton).Tag;
end;

procedure TForm4.UploadBtnClick(Sender: TObject);
var
  fn: string;
  ci, nci: TTMSFMXCloudItem;
begin
  {$IFNDEF MOBILE}
  if OpenDialog1.Execute then
  begin
    fn := opendialog1.FileName;
  {$ELSE}
  begin
    {$IFDEF IOS}
    fn := ExtractFilePath(ParamStr(0)) + 'Sample.jpg';
    {$ENDIF}
    {$IFDEF ANDROID}
    fn := TPath.GetDocumentsPath + PathDelim + 'Sample.jpg';
    {$ENDIF}
  {$ENDIF}

    ProgressBar2.Value := 0;
    ProgressBar2.Visible := true;

    ci := nil;
    if Assigned(TreeView1.Selected) then
    begin
      IsUploading := true;
      ci := TTMSFMXCloudItem(TTMSFMXCloudTreeViewItem(TreeView1.Selected).DataObject);

      // when selected item is a file, upload to file parent folder
      if ci.ItemType = ciFile then
        ci := ci.ParentFolder;
    end;

    nci := Storage.Upload(ci, fn);

    if Assigned(nci) then
      TMSFMXCloudTreeViewAdapter1.InitTreeView;
    IsUploading := false;

    ProgressBar1.Visible := false;
    ProgressLabel.Text  := '';
  end;
end;

procedure TForm4.ShowItem;
var
  ci: TTMSFMXCloudItem;
begin
  if Assigned(TreeView1.Selected) then
  begin
    ci := TTMSFMXCloudItem(TTMSFMXCloudTreeViewItem(TreeView1.Selected).DataObject);
    if (ci is TBoxNetItem) then
      (ci as TBoxNetItem).LoadFileInfo;
  end;
end;

function TForm4.Storage: TTMSFMXCloudStorageFMX;
begin
  Result := nil;
  case rdg of
  0: Result := TMSFMXCloudDropBox1;
  1: Result := TMSFMXCloudGDrive1;
  2: Result := TMSFMXCloudSkyDrive1;
  3: Result := TMSFMXCloudBoxNetDrive1;
  4: Result := TMSFMXCloudAmazonCloudDrive1;
  5: Result := TMSFMXCloudHubic1;
  6: Result := TMSFMXCloudHiDrive1;
  7: Result := TMSFMXCloudYandexDisk1;
  end;
end;

procedure TForm4.TreeView1Change(Sender: TObject);
begin
  ShowItem;
end;

procedure TForm4.TreeView1DblClick(Sender: TObject);
begin
  DownloadBtnClick(self);
end;

function TForm4.StrNum(const entra: string) :  string;
var cont : integer;
begin
  Result := '';
  for cont := 1 to length(entra) do
    begin
      if pos(entra[cont],'1234567890') > 0 then Result := Result + entra[cont];
    end;
  if Result = '' then Result := '0';
end;

procedure TForm4.comprime7zip(Origem, destino : String);
var
  Arch: I7zOutArchive;
  Counter: Integer;
begin
  Arch := CreateOutArchive (CLSID_CFormat7z);
  //Arch.SetProgressCallback (nil, ProgressCallback);
  Arch.AddFile(Origem, ExtractFileName(Origem));
  SetCompressionLevel(Arch, 5);
  SevenZipSetCompressionMethod (Arch, T7zCompressionMethod.m7Deflate64);
  Arch.SaveToFile(destino);
end;

function TForm4.buscaPastaGdrive(nome : string; cis : TTMSFMXCloudItems) : TTMSFMXCloudItem;
var
  i : integer;
begin
  Result := nil;
  if cis = nil then exit;

  for i := 0 to cis.Count - 1 do begin
    //ShowMessage(TreeView1.Items[i].Text);
    //      TTMSFMXCloudItem(TTMSFMXCloudTreeViewItem(TreeView1.Selected).DataObject)

    //if nome <> 'Backups' then ShowMessage(cis.Items[i].FileName );
    if cis.Items[i].FileName = nome then begin
      Result := cis.Items[i];
      break;
    end;
  end;

end;

procedure TForm4.abrirPainel();
begin
  TMSFMXCloudTreeViewAdapter1.InitFolder(pastaInicial);
  TreeView1.Visible := true;
end;

function TForm4.buscaRetornoSite(site, cnpj : String) : String;
var
  th: String;
  tipo : integer;
  fileDownload: TFileStream;
begin
  Result := '';
  msg.Visible := true;
  msg.Text := 'Buscando Registro...';
  Application.ProcessMessages;

  try
      th := 'http://controlw.blog.br/si2/addsis.php?cnpj=' + cnpj;
    try
      th := IdHTTP1.Get(th);
      Result := th;
      IdHTTP1.Disconnect;
    except
      on e: exception do
      begin
         Memo1.Lines.Add('Indy Error: ' + e.Message);
       end;
    end;
  finally
   msg.Visible := false;
  end;
end;

procedure TForm4.LE_CAMPOS(var mat: tstringList; LIN: String; const separador: String;criaMAT: boolean = true);
var
  posi, cont : integer;
  valor : String;
begin
  if criaMAT then
    mat := tstringList.Create;

  LIN := trim(LIN);
  if LeftStr(LIN, 1) <> separador  then LIN := separador + LIN;
  if RightStr(LIN, 1) <> separador then LIN := LIN + separador;

  if not Contido(separador, LIN) then
  begin
    mat.Add('0=' + LIN);
    exit;
  end;

  posi := pos(separador, LIN) + 1;
  LIN := copy(LIN, posi, length(LIN));
  mat.Clear;
  cont := -1;

  if not Contido(separador, LIN) then
    mat.Add('0=' + LIN);

  while true do begin
    posi := pos(separador, LIN) + 1;
    if ((posi = 0) or (trim(LIN) = '')) then
      break;

    valor := LeftStr(LIN, posi - 2);
    cont := cont + 1;
    mat.Add(IntToStr(cont) + '=' + trim(valor));
    if posi = length(LIN) then
      break;
    LIN := copy(LIN, posi, length(LIN));
  end;

  valor := '';
  posi := 0;
  cont := 0;
end;

function TForm4.Contido(substring: string; texto: string): boolean;
begin
  if pos(substring, texto) > 0 then
    Result := true
  else
    Result := False;
end;

end.
