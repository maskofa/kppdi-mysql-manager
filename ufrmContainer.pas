unit ufrmContainer;

interface

uses
  System.SysUtils, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList,
  FMX.Effects, FMX.Filter.Effects, FMX.Layouts, FMX.ExtCtrls, FMX.Objects,
  FMX.TabControl, System.Types, uCore;

type
  TfrmContainer = class(TForm)
    ToolBar1: TToolBar;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    TbMain: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    procedure TabItemClose(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmContainer: TfrmContainer;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

procedure TfrmContainer.TabItemClose(Sender: TObject);
begin
  ShowMessage('oke');
end;

procedure TfrmContainer.FormCreate(Sender: TObject);
begin
  TabItem2.OnClose := TabItemClose;
end;

end.
