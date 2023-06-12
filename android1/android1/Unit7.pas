unit Unit7;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Grid.Style, FMX.EditBox, FMX.NumberBox, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Grid, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.Layouts,
  FMX.TabControl, Data.Bind.Components, Data.Bind.Grid;

type
  TForm7 = class(TForm)
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ListBox1: TListBox;
    nome: TClearingEdit;
    ListBoxItem4: TListBoxItem;
    cpf: TClearingEdit;
    ListBoxItem3: TListBoxItem;
    TabItem2: TTabItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    ClearingEdit3: TClearingEdit;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    gridCliente: TStringGrid;
    ToolBar1: TToolBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar2: TToolBar;
    Button4: TButton;
    Button1: TButton;
    NumberBox1: TNumberBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}

end.
