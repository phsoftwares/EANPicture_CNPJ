unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, WinInet, Buttons, Vcl.ComCtrls ,Winapi.ShellAPI  ;

type
  TfrmEanPictures_DataLoad = class(TForm)
    IdHTTP1: TIdHTTP;
    Label2: TLabel;
    PageControl1: TPageControl;
    return: TTabSheet;
    example: TTabSheet;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Image1: TImage;
    ComboBox1: TComboBox;
    edtvalue: TEdit;
    CNPJ: TLabeledEdit;
    IE: TLabeledEdit;
    Razao: TLabeledEdit;
    Fantasia: TLabeledEdit;
    Endereco: TLabeledEdit;
    Bairro: TLabeledEdit;
    CEP: TLabeledEdit;
    Cidade: TLabeledEdit;
    Estado: TLabeledEdit;
    Email: TLabeledEdit;
    Produto: TLabeledEdit;
    NCM: TLabeledEdit;
    CEST: TLabeledEdit;
    Marca: TLabeledEdit;
    Peso: TLabeledEdit;
    Button2: TButton;
    Button3: TButton;
    imgproduct: TImage;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    function DownloadArquivo(const Origem, Destino: String): Boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    const pathdir     : String = 'dataload\';
    const pathcean    : String = 'http://www.dataload.com.br:9000';
    const pathproduct : string = 'http://www.dataload.com.br:8000';
  end;

var
  frmEanPictures_DataLoad: TfrmEanPictures_DataLoad;

implementation
uses jpeg, pngimage, dataloadcnpj, dataloadproduct, Pkg.Json.DTO;

{$R *.dfm}

procedure TfrmEanPictures_DataLoad.BitBtn1Click(Sender: TObject);
var wurl: string;
begin
  wurl:=pathcean + '/api/desc/'+edtvalue.text;
  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);
    Memo1.lines.add(Get(wurl));
  end;

  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');

  wurl:=pathcean + '/api/descricao/'+edtvalue.text;
  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);
    Memo1.lines.add(Get(wurl));
  end;

end;

procedure TfrmEanPictures_DataLoad.BitBtn2Click(Sender: TObject);
var wurl: string;

begin
  wurl:=pathproduct + '/api/cnpj/'+edtvalue.text;
  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);
    Memo1.lines.add(Get(wurl));
  end;

  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  wurl:=pathproduct + '/api/cnpj2/'+edtvalue.text;



  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);

    Memo1.lines.add(Get(wurl));
  end;

end;

procedure TfrmEanPictures_DataLoad.Button1Click(Sender: TObject);
var wurl: string;
destinopng: string;
destinojpg: string;
begin
  wurl:= pathcean + '/api/gtin/'+edtvalue.text;

  memo1.lines.add('solicitando '+wURL); //<==== somente para visualizacao do url na tela

  ForceDirectories(ExtractFilePath(Application.ExeName) + pathdir);

  destinopng  :=  ExtractFilePath(Application.ExeName) + pathdir  + edtvalue.TEXT+'.png';
  destinojpg  :=  ExtractFilePath(Application.ExeName) + pathdir  +  edtvalue.TEXT+'.jpg';
  DeleteFile(destinopng);
  DeleteFile(destinojpg);

  memo1.lines.add('Tentarei gravar em '+destinopng);

  if DownloadArquivo(wurl,destinopng) then
  begin
    try
    Memo1.Lines.Add('Tentando rodar o arquivo como png...');
    image1.picture.loadfromfile(destinopng);
    Memo1.Lines.Add('Sucesso ao rodar o arquivo como png.');
    except
      Memo1.Lines.Add('Falha ao tentar rodar o arquivo como png, Tentando rodar o arquivo como JPG...');
      renamefile(destinopng,destinojpg);
      image1.picture.loadfromfile(destinojpg);
      Memo1.Lines.Add('Sucesso ao rodar o arquivo como jpg.');
    end;
  end
end;


procedure TfrmEanPictures_DataLoad.Button2Click(Sender: TObject);
var
Usuario: TDataLoadCNPJ;
wurl: string;

begin
    try
      wurl:=pathproduct + '/api/cnpj/'+edtvalue.text;
      idhttp1.Request.Clear;
      idhttp1.Request.CustomHeaders.Clear;
      idhttp1.Request.ContentType := 'application/json';
      idhttp1.Request.Accept := 'application/json';

      Usuario := TDataLoadCNPJ.Create;

      Usuario.AsJson  :=  idhttp1.get(wurl) ;
      CNPJ.Text       := usuario.Cnpj;
      Razao.Text      := usuario.Razao_Social;
      Fantasia.Text   := usuario.Nome_Fantasia;
      Endereco.Text   := usuario.Logradouro;

      Bairro.Text     := Usuario.Bairro;
      Cidade.Text     := usuario.Municipio;
      estado.Text     := usuario.Uf;
      CEP.Text        := usuario.Cep;
      email.Text      := Usuario.Correio_Eletronico;
    finally
      Usuario.Free;
    end;
end;

procedure TfrmEanPictures_DataLoad.Button3Click(Sender: TObject);
var
item: TDataLoadProduct;
wurl: string;
destinopng: string;
destinojpg: string;

begin
    try
      wurl:=  pathcean + '/api/desc/'+edtvalue.text;
      idhttp1.Request.Clear;
      idhttp1.Request.CustomHeaders.Clear;
      idhttp1.Request.ContentType := 'application/json';
      idhttp1.Request.Accept := 'application/json';

      item := TDataLoadProduct.Create;

      item.AsJson  :=  idhttp1.get(wurl) ;
      produto.text := item.Nome;
      ncm.Text     := item.Ncm;
      CEST.Text    := item.Cest_Codigo;
      peso.Text    := item.Peso;
    finally
      item.Free;
    end;


    wurl:= pathcean + '/api/gtin/'+edtvalue.text;
    ForceDirectories(ExtractFilePath(Application.ExeName) + pathdir);

    destinopng  :=  ExtractFilePath(Application.ExeName) + pathdir  + edtvalue.TEXT+'.png';
    destinojpg  :=  ExtractFilePath(Application.ExeName) + pathdir  +  edtvalue.TEXT+'.jpg';
    DeleteFile(destinopng);
    DeleteFile(destinojpg);

    if DownloadArquivo(wurl,destinopng) then
    begin
      try
        imgproduct.picture.loadfromfile(destinopng);
      except
        renamefile(destinopng,destinojpg);
        imgproduct.picture.loadfromfile(destinojpg);
      end;
    end ;
end;


procedure TfrmEanPictures_DataLoad.ComboBox1Change(Sender: TObject);
begin
    case ComboBox1.ItemIndex of
      0 : edtvalue.text := '7894900011715';   //EAN PARA CONSULTA
      1 : edtvalue.text := '33000167000101';  //CNPJ DE CONSULTA
    end;
end;

procedure TfrmEanPictures_DataLoad.ComboBox1Click(Sender: TObject);
begin
    case ComboBox1.ItemIndex of
      0 : edtvalue.text := '7894900011715';        //EAN PARA CONSULTA
      1 : edtvalue.text := '33000167000101';  //CNPJ DE CONSULTA
    end;
end;

function TfrmEanPictures_DataLoad.DownloadArquivo(const Origem, Destino: String): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 Result   := False;
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),
                INTERNET_OPEN_TYPE_PRECONFIG,
               nil, nil, 0);
 try
  hURL := InternetOpenURL(hSession,
            PChar(Origem),
            nil,0,0,0);
  try
   AssignFile(f, Destino);
   Rewrite(f,1);
   repeat
    InternetReadFile(hURL, @Buffer,
                     SizeOf(Buffer), BufferLen);
    BlockWrite(f, Buffer, BufferLen)
   until BufferLen = 0;
   CloseFile(f);
   Result:=True;
  finally
   InternetCloseHandle(hURL)
  end
 finally
  InternetCloseHandle(hSession)
 end
end;


procedure TfrmEanPictures_DataLoad.FormShow(Sender: TObject);
begin
COMBOBOX1.ItemIndex:=0;
end;

end.
