unit UDownloadXMLNFeDLL;

interface

  function Proxy(Host: PChar; Port: Integer; User, Pass: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function ProxyS(Host: String; Port: Integer; User, Pass: String): Boolean;

  function Captcha(SalvarEm: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function CaptchaS(SalvarEm: String): Boolean;

  procedure Https(Sim: Integer); stdcall; external 'BaixarXMLNFe.dll'; overload;
  procedure HttpsS(Sim: Boolean); overload;

  function GetCertificadoDigital: PChar; stdcall; external 'BaixarXMLNFe.dll';
  function Msg: PChar; stdcall; external 'BaixarXMLNFe.dll';

  procedure SetCertificadoDigital(CertSerialNumber: PChar); stdcall; external 'BaixarXMLNFe.dll';
  procedure SetCertificadoDigitalS(CertSerialNumber: String);

  function BaixarXMLNFeSemCert(Chave, Captcha, SalvarEm: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function BaixarXMLNFeSemCertS(Chave, Captcha, SalvarEm: String): Boolean;

  function BaixarXMLNFeComCert(Chave, Captcha, SalvarEm: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function BaixarXMLNFeComCertS(Chave, Captcha, SalvarEm: String): Boolean;

  procedure DLLLicenca(Chave: PChar); stdcall; external 'BaixarXMLNFe.dll';
  procedure DLLLicencaS(Chave: String);

  function CaptchaLer(ChaveCaptcha, ArquivoImagem: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function CaptchaLerS(ChaveCaptcha, ArquivoImagem: String): Boolean;

  function CaptchaLerTexto: PChar; stdcall; external 'BaixarXMLNFe.dll';

  function Imprimir(ArquivoXML, LogoMarca: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function ImprimirS(ArquivoXML, LogoMarca: String): Boolean;

  function ExportarPDF(ArquivoXML, LogoMarca, PDF: PChar): Integer; stdcall; external 'BaixarXMLNFe.dll';
  function ExportarPDFS(ArquivoXML, LogoMarca, PDF: String): Boolean;

  procedure DLLRegistra(PastaDestino: PChar); Stdcall; external 'BaixarXMLNFe.dll';
  procedure DLLRegistraS(PastaDestino: String);

implementation

function CaptchaS(SalvarEm: String): Boolean;
begin
  Result:= Boolean(Captcha(PChar(SalvarEm)));
end;

function ProxyS(Host: String; Port: Integer; User, Pass: String): Boolean;
begin
  Result:= Boolean(Proxy(PChar(Host), Port, PChar(User), PChar(Pass)));
end;

procedure HttpsS(Sim: Boolean);
begin
  Https(Integer(Sim));
end;

procedure SetCertificadoDigitalS(CertSerialNumber: String);
begin
  SetCertificadoDigital(PChar(CertSerialNumber));
end;

function BaixarXMLNFeSemCertS(Chave, Captcha, SalvarEm: String): Boolean;
begin
  Result:= Boolean(BaixarXMLNFeSemCert(PChar(Chave), PChar(Captcha), PChar(SalvarEm)));
end;

function BaixarXMLNFeComCertS(Chave, Captcha, SalvarEm: String): Boolean;
begin
  Result:= Boolean(BaixarXMLNFeComCert(PChar(Chave), PChar(Captcha), PChar(SalvarEm)));
end;

procedure DLLLicencaS(Chave: String);
begin
  DLLLicenca(PChar(Chave));
end;

function CaptchaLerS(ChaveCaptcha, ArquivoImagem: String): Boolean;
begin
  Result:= Boolean(CaptchaLer(PChar(ChaveCaptcha), PChar(ArquivoImagem)));
end;

function ImprimirS(ArquivoXML, LogoMarca: String): Boolean;
begin
  Result:= Boolean(Imprimir(PChar(ArquivoXML), PChar(LogoMarca)));
end;

function ExportarPDFS(ArquivoXML, LogoMarca, PDF: String): Boolean;
begin
  Result:= Boolean(ExportarPDF(PChar(ArquivoXML), PChar(LogoMarca), PChar(PDF)));
end;

procedure DLLRegistraS(PastaDestino: String);
begin
  DLLRegistra(PChar(PastaDestino));
end;


end.
