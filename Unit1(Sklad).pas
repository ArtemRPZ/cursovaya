unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    DBGrid1: TDBGrid;
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    pnl2: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    pnl3: TPanel;
    Label9: TLabel;
    Edit9: TEdit;
    Button8: TButton;
    Button9: TButton;
    ts2: TTabSheet;
    DBGrid2: TDBGrid;
    pnl4: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Edit10: TEdit;
    Button10: TButton;
    Edit11: TEdit;
    pnl5: TPanel;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Label12: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    Label14: TLabel;
    Edit14: TEdit;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Label15: TLabel;
    Edit15: TEdit;
    pnl6: TPanel;
    Label16: TLabel;
    Edit16: TEdit;
    Button17: TButton;
    Button18: TButton;
    ts3: TTabSheet;
    DBGrid3: TDBGrid;
    pnl7: TPanel;
    Label17: TLabel;
    Edit17: TEdit;
    Label18: TLabel;
    Button19: TButton;
    Edit18: TEdit;
    pnl8: TPanel;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit19: TEdit;
    Edit20: TEdit;
    Label21: TLabel;
    Edit21: TEdit;
    Label22: TLabel;
    Edit22: TEdit;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    pnl9: TPanel;
    Label23: TLabel;
    Edit23: TEdit;
    Button26: TButton;
    Button27: TButton;
    dblkcbb1: TDBLookupComboBox;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.Edit1Change(Sender: TObject);
begin
DataModule2.ADOQuery1.Close;
DataModule2.ADOQuery1.SQL.Text := 'SELECT * FROM Товары WHERE Название LIKE "%'+edit1.text+'%"';
DataModule2.ADOQuery1.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if edit2.Text <> '' then
begin
DataModule2.ADOQuery1.Close;
DataModule2.ADOQuery1.SQL.Text := 'SELECT * FROM Товары WHERE (((Товары.[Код товара]) Like '+edit2.text+')); ';
DataModule2.ADOQuery1.Open;
end;
if edit2.Text = '' then
begin
  DataModule2.ADOQuery1.Close;
DataModule2.ADOQuery1.SQL.Text := 'SELECT * FROM Товары';
DataModule2.ADOQuery1.Open;
end;
  end;


procedure TForm1.FormShow(Sender: TObject);
begin
pnl2.Visible := False;
pnl3.Visible := false;
pnl5.Visible := false;
pnl6.Visible := False;
pnl8.Visible := False;
pnl9.Visible := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
pnl2.Visible := True;
Button5.Visible := true;
Button7.Visible := false;
label8.Visible := false;
Edit8.Visible := false;
label3.Visible := true;
edit3.Visible := true;
dblkcbb1.enabled := true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
pnl2.Visible := false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
DataModule2.ADOQuery1.Close;
DataModule2.ADOQuery1.SQL.Text := 'INSERT INTO Товары ([Код товара], [Название], [Цена_ед], [Описание], [Код категории]) values ('+Edit3.Text+', "'+Edit4.text+'", '+Edit5.Text+', "'+Edit6.Text+'", '+inttostr(dblkcbb1.keyvalue)+')';
DataModule2.ADOQuery1.ExecSQL;
pnl2.Visible := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
pnl2.Visible := true;
Button5.Visible := false;
button7.Visible := True;
label8.Visible := true;
Edit8.Visible := true;
label3.Visible := false;
edit3.Visible := false;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
DataModule2.ADOQuery1.Close;
DataModule2.ADOQuery1.SQL.Text := 'UPDATE Товары SET Название = "'+Edit4.Text+'", Описание = "'+edit6.text+'", Цена_ед = '+Edit5.Text+', [Код категории] = "'+inttostr(dblkcbb1.keyvalue)+'" WHERE [Код товара]='+edit8.text+'';
DataModule2.ADOQuery1.ExecSQL;
pnl2.Visible := false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
pnl3.Visible := True;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
pnl3.Visible := False;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
DataModule2.ADOQuery1.Close;
DataModule2.ADOQuery1.SQL.Text := 'DELETE * FROM Товары WHERE ([Код товара] = '+edit9.text+')';
DataModule2.ADOQuery1.ExecSQL;
pnl3.Visible := false;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
if edit11.Text <> '' then
begin
DataModule2.ADOQuery2.Close;
DataModule2.ADOQuery2.SQL.Text := 'SELECT * FROM Сотрудники WHERE (((Сотрудники.[Код сотрудника]) Like "'+edit11.text+'")); ';
DataModule2.ADOQuery2.Open;
end;
if edit11.Text = '' then
begin
  DataModule2.ADOQuery2.Close;
DataModule2.ADOQuery2.SQL.Text := 'SELECT * FROM Сотрудники';
DataModule2.ADOQuery2.Open;
end;
end;

procedure TForm1.Edit10Change(Sender: TObject);
begin
DataModule2.ADOQuery2.Close;
DataModule2.ADOQuery2.SQL.Text := 'SELECT * FROM Сотрудники WHERE ФИО LIKE "%'+edit10.text+'%"';
DataModule2.ADOQuery2.Open;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
pnl5.Visible := true;
label15.Visible := false;
Edit15.Visible := false;
Button16.Visible := false;
Button14.Visible := True;
Label12.Visible := True;
edit12.Visible := True;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
DataModule2.ADOQuery2.Close;
DataModule2.ADOQuery2.SQL.Text := 'INSERT INTO Сотрудники ([Код сотрудника], [Паспорт], [ФИО]) values ("'+Edit12.Text+'", "'+Edit13.text+'", "'+Edit14.Text+'")';
DataModule2.ADOQuery2.ExecSQL;
pnl5.Visible := false;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
pnl5.Visible := True;
label12.Visible := false;
edit12.Visible := false;
Button14.Visible := false;
Label15.Visible := True;
Edit15.Visible := true;
Button16.Visible := True;

end;

procedure TForm1.Button15Click(Sender: TObject);
begin
pnl5.Visible := false;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
DataModule2.ADOQuery2.Close;
DataModule2.ADOQuery2.SQL.Text := 'UPDATE Сотрудники SET Паспорт = "'+Edit13.Text+'", ФИО = "'+edit14.text+'" WHERE [Код сотрудника]="'+edit15.text+'"';
DataModule2.ADOQuery2.ExecSQL;
pnl2.Visible := false;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
pnl6.Visible := True;

end;

procedure TForm1.Button18Click(Sender: TObject);
begin
pnl6.Visible := false;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
DataModule2.ADOQuery2.Close;
DataModule2.ADOQuery2.SQL.Text := 'DELETE * FROM Сотрудники WHERE ([Код сотрудника] = "'+edit16.text+'")';
DataModule2.ADOQuery2.ExecSQL;
pnl6.Visible := false;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
if edit18.Text <> '' then
begin
DataModule2.ADOQuery3.Close;
DataModule2.ADOQuery3.SQL.Text := 'SELECT * FROM Категории WHERE (((Категории.[Код категории]) Like "'+edit18.text+'")); ';
DataModule2.ADOQuery3.Open;
end;
if edit18.Text = '' then
begin
DataModule2.ADOQuery3.Close;
DataModule2.ADOQuery3.SQL.Text := 'SELECT * FROM Категории';
DataModule2.ADOQuery3.Open;
end;
end;

procedure TForm1.Edit17Change(Sender: TObject);
begin
DataModule2.ADOQuery3.Close;
DataModule2.ADOQuery3.SQL.Text := 'SELECT * FROM Категории WHERE Название LIKE "%'+edit17.text+'%"';
DataModule2.ADOQuery3.Open;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
pnl8.Visible := True;
label19.Visible := True;
Edit19.Visible := True;
Button23.Visible := True;
Label22.Visible := false;
Edit22.Visible := False;
Button25.Visible := False;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
DataModule2.ADOQuery3.Close;
DataModule2.ADOQuery3.SQL.Text := 'INSERT INTO Категории ([Код категории], [Название], [Описание]) values ("'+Edit19.Text+'", "'+Edit20.text+'", "'+Edit21.Text+'")';
DataModule2.ADOQuery3.ExecSQL;
pnl8.Visible := false;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
pnl8.Visible := True;
label19.Visible := False;
Edit19.Visible := False;
Button23.Visible := False;
Label22.Visible := True;
Edit22.Visible := True;
Button25.Visible := True;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
pnl8.Visible := False;
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
DataModule2.ADOQuery3.Close;
DataModule2.ADOQuery3.SQL.Text := 'UPDATE Категории SET Название = "'+Edit20.Text+'", Описание = "'+edit21.text+'" WHERE [Код категории]="'+edit22.text+'"';
DataModule2.ADOQuery3.ExecSQL;
pnl8.Visible := false;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
pnl9.Visible := True;
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
pnl9.Visible := False;
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
DataModule2.ADOQuery3.Close;
DataModule2.ADOQuery3.SQL.Text := 'DELETE * FROM Категории WHERE ([Код категории] = "'+edit23.text+'")';
DataModule2.ADOQuery3.ExecSQL;
pnl9.Visible := false;
end;

end.
