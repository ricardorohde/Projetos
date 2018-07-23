//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDataStorage"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "cxStyles"
#pragma link "dxmdaset"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::EnableSearch1Click(TObject *Sender)
{
  cxGrid1DBTableView1->OptionsBehavior->IncSearch = True;
  cxGrid1DBTableView1->OptionsBehavior->IncSearchItem = cxGrid1DBTableView1->Controller->FocusedItem;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DisableSearch1Click(TObject *Sender)
{
  cxGrid1DBTableView1->OptionsBehavior->IncSearch = False;
}
//---------------------------------------------------------------------------
