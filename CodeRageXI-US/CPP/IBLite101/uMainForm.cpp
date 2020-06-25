//---------------------------------------------------------------------------

#include <fmx.h>
#include <System.IOUtils.hpp>
#pragma hdrstop

#include "uMainForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FDConnection1BeforeConnect(TObject *Sender)
{
#if defined(_Windows)
	FDConnection1->Params->Database = System::Sysutils::GetCurrentDir() +
		PathDelim + "dbdemos.gdb";
#else
	FDConnection1->Params->Database = System::Ioutils::TPath::GetDocumentsPath() +
		PathDelim + "dbdemos.gdb";
#endif
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
    FDQuery1->Open();
}
//---------------------------------------------------------------------------
