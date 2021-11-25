unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TForm5 = class(TForm)
    qckrp1: TQuickRep;
    qrbndColumnHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrbndTitleBand1: TQRBand;
    qrbndSummaryBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrdbtxt1: TQRDBText;
    qrlbl4: TQRLabel;
    qrdbtxt2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  Unit1, Unit2, Unit3, Unit4;

{$R *.dfm}

end.
