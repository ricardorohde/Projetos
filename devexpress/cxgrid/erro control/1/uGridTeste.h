//---------------------------------------------------------------------------

#ifndef uGridTesteH
#define uGridTesteH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TDataSource *DataSource1;
	TTable *Table1;
	TcxGrid *cxGrid;
	TcxGridDBTableView *cxView;
	TcxGridLevel *cxLevel;
	TcxGridDBColumn *cxViewCustNo;
	TcxGridDBColumn *cxViewCompany;
	TcxGridDBColumn *cxViewAddr1;
	TcxGridDBColumn *cxViewAddr2;
	TcxGridDBColumn *cxViewCity;
	TcxGridDBColumn *cxViewState;
	TcxGridDBColumn *cxViewZip;
	TcxGridDBColumn *cxViewCountry;
	TcxGridDBColumn *cxViewPhone;
	TcxGridDBColumn *cxViewFAX;
	TcxGridDBColumn *cxViewTaxRate;
	TcxGridDBColumn *cxViewContact;
	TcxGridDBColumn *cxViewLastInvoiceDate;
	TFloatField *Table1CustNo;
	TStringField *Table1Company;
	TStringField *Table1Addr1;
	TStringField *Table1Addr2;
	TStringField *Table1City;
	TStringField *Table1State;
	TStringField *Table1Zip;
	TStringField *Table1Country;
	TStringField *Table1Phone;
	TStringField *Table1FAX;
	TFloatField *Table1TaxRate;
	TStringField *Table1Contact;
	TDateTimeField *Table1LastInvoiceDate;
	void __fastcall Table1AfterEdit(TDataSet *DataSet);
private:	// User declarations
    bool IsColumnPosChanged;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
