object Form95: TForm95
  Left = 0
  Top = 0
  Caption = 'F2-Carregar Imagem/Delete-Exclui F5-Buscar Produto'
  ClientHeight = 441
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 41
    Width = 783
    Height = 400
    Align = alClient
    Center = True
    Proportional = True
    OnClick = Image1Click
    ExplicitTop = 21
    ExplicitWidth = 733
    ExplicitHeight = 420
  end
  object Image2: TImage
    Left = 568
    Top = 112
    Width = 105
    Height = 105
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 41
    Align = alTop
    Caption = '2-produto1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.png;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.p' +
      'ng;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf|Portable Net' +
      'work Graphics (*.png)|*.png|CompuServe GIF Image (*.gif)|*.gif|P' +
      'NG graphics from DevExpress (*.png)|*.png|JPEG Image File (*.jpg' +
      ')|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Ic' +
      'ons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.' +
      'wmf)|*.wmf'
    Left = 48
    Top = 152
  end
  object ImageList1: TImageList
    Left = 320
    Top = 192
  end
end
