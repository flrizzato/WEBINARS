//---------------------------------------------------------------------------

#include <fmx.h>
#include <System.IOUtils.hpp>
#pragma hdrstop

#include "uMainForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
    FDQuery1->Open();
}
//---------------------------------------------------------------------------
void __fastcall TForm2::FDConnection1BeforeConnect(TObject *Sender)
{
#if defined(_Windows)
	FDConnection1->Params->Database = System::Sysutils::GetCurrentDir() +
		PathDelim + "fddemo.sdb";
#else
	FDConnection1->Params->Database = System::Ioutils::TPath::GetDocumentsPath() +
		PathDelim + "fddemo.sdb";
#endif
}
//---------------------------------------------------------------------------
