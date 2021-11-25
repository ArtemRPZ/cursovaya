unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Menus;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    dblkcbb1: TDBLookupComboBox;
    dtp1: TDateTimePicker;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    dblkcbb2: TDBLookupComboBox;
    Edit1: TEdit;
    DBGrid3: TDBGrid;
    Label5: TLabel;
    Edit2: TEdit;
    Button5: TButton;
    Button6: TButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label6: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dblkcbb2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  cheknom:string;
  cena, suma, fullsum : integer;
implementation

uses
  Unit1, Unit2, Unit4, Unit5;

{$R *.dfm}

procedure TForm3.Button4Click(Sender: TObject);
begin
fullsum := 0;
datamodule2.ADOQuery4.Close;
datamodule2.ADOQuery4.SQL.text := 'INSERT INTO Чек ([Дата], [Общая стоимость]) values (:dt,0)';
DataModule2.ADOQuery4.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yyyy', Dtp1.Date);
datamodule2.ADOQuery4.ExecSQL;



datamodule2.ADOQuery4.Close;
datamodule2.ADOQuery4.Sql.text := 'select * from Чек order by [Код чека]';
datamodule2.ADOQuery4.Open;
datamodule2.ADOQuery4.Last;
cheknom := dbgrid1.Fields[2].AsString;
formshow(Sender);
Datamodule2.ADOQuery5.Close;
Datamodule2.ADOQuery5.SQL.Text:='Select Продажи.[Код продажи], Продажи.Дата, Товары.Название, Продажи.Количество, Продажи.Стоимость, Сотрудники.ФИО, Продажи.[Код чека], Товары.Цена_ед '
+ ' FROM Товары INNER JOIN (Сотрудники INNER JOIN Продажи ON Сотрудники.[Код сотрудника] = Продажи.[Код сотрудника]) ON Товары.[Код товара] = Продажи.[Код товара]'
+ ' WHERE (((Продажи.[Код чека])= '+cheknom+')) ' ;
Datamodule2.ADOQuery5.open;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
datamodule2.ADOQuery4.Close;
datamodule2.ADOQuery4.sql.Text := 'select * from Чек';
datamodule2.ADOQuery4.Open;
edit2.Visible := false;
Button5.Visible := false;
Button6.Visible := false;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
cena := dbgrid3.Fields[0].asinteger;
suma := cena * strtoint(edit1.text);
fullsum := fullsum+suma;
label6.Caption := inttostr(fullsum);
datamodule2.ADOQuery4.Close;
datamodule2.ADOQuery4.SQL.text := 'INSERT INTO Продажи ([Код сотрудника], [Код товара], [Количество],[Стоимость],[Дата],[Код чека]) values ('+inttostr(dblkcbb1.keyvalue)+','+inttostr(dblkcbb2.keyvalue)+','+edit1.text+','+inttostr(suma)+',:dt,'+cheknom+' )';
DataModule2.ADOQuery4.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yyyy', Dtp1.Date);
datamodule2.ADOQuery4.ExecSQL;
formshow(sender);
Datamodule2.ADOQuery5.Close;
Datamodule2.ADOQuery5.SQL.Text:='Select Продажи.[Код продажи], Продажи.Дата, Товары.Название, Продажи.Количество, Продажи.Стоимость, Сотрудники.ФИО, Продажи.[Код чека], Товары.Цена_ед '
+ ' FROM Товары INNER JOIN (Сотрудники INNER JOIN Продажи ON Сотрудники.[Код сотрудника] = Продажи.[Код сотрудника]) ON Товары.[Код товара] = Продажи.[Код товара]'
+ ' WHERE (((Продажи.[Код чека])= '+cheknom+')) ' ;
Datamodule2.ADOQuery5.open;
end;

procedure TForm3.dblkcbb2Click(Sender: TObject);
begin
datamodule2.ADOQuery6.close;
datamodule2.ADOQuery6.SQL.text := 'select * from Товары where [Код товара] = ' + inttostr(dblkcbb2.KeyValue);
datamodule2.ADOQuery6.open;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
fullsum := fullsum - suma;
label5.caption := inttostr(fullsum);
DataModule2.ADOQuery5.Close;
DataModule2.ADOQuery5.SQL.Text := 'DELETE * FROM Продажи WHERE ([Код продажи] = '+edit2.text+')';
Datamodule2.ADOQuery5.ExecSQL;
Datamodule2.ADOQuery5.SQL.Text:='Select Продажи.[Код продажи], Продажи.Дата, Товары.Название, Продажи.Количество, Продажи.Стоимость, Сотрудники.ФИО, Продажи.[Код чека], Товары.Цена_ед '
+ ' FROM Товары INNER JOIN (Сотрудники INNER JOIN Продажи ON Сотрудники.[Код сотрудника] = Продажи.[Код сотрудника]) ON Товары.[Код товара] = Продажи.[Код товара]'
+ ' WHERE (((Продажи.[Код чека])= '+cheknom+')) ' ;
Datamodule2.ADOQuery5.open;
edit2.Visible := false;
Button5.Visible := false;
Button6.Visible := false;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
edit2.Visible := True;
Button5.Visible := true;
Button6.Visible := True;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
edit2.Visible := false;
Button5.Visible := false;
Button6.Visible := false;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
Form1.Show;
end;

procedure TForm3.N3Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.N2Click(Sender: TObject);
begin
form4.show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
DataModule2.ADOQuery4.Close;
DataModule2.ADOQuery4.SQL.Text:='UPDATE Чек SET Чек.[Общая стоимость] = '+inttostr(fullsum)+' WHERE (((Чек.[Код чека])='+Cheknom+'))';
DataModule2.ADOQuery4.ExecSQL;
formshow(sender);



datamodule2.ADOQuery7.Close;
datamodule2.ADOQuery7.Sql.Text := 'Select * from Продажи where [Код чека] = ' + cheknom;
datamodule2.ADOQuery7.Open;
form5.qrlbl1.Caption := 'Чек №' + cheknom;
form5.qrlbl2.caption := 'Дата ' + datetostr(dtp1.date);
form5.qrlbl3.caption := 'Сотрудник' + dblkcbb1.text;
form5.qrlbl4.caption := 'Общая стоимость ' + inttostr(fullsum);

form5.qckrp1.previewmodal;
end;

end.
