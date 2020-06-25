{=======================================================================================================================
  RkDBAddress_Frame Unit

  RK Components - Component Source Unit


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzDBAddress_Frame    This TRkDBAddress_Frame component is comprised of the following edit fields: First Name, 
                          Last Name, Street, City, and ZIP. The State field is actually a combo box which is populated 
                          with the 50 states including the District of Columbia. The edit fields are data-aware, and 
                          thus this component can be hooked up to a DataSource.

                          Note: This example illustrates how to build a Frame Component.

  
  Copyright © 1999-2003 by Ray Konopka.  All Rights Reserved.
=======================================================================================================================}

//{$I RkComps.inc}

unit RkDBAddress_Frame;

interface

uses
  Windows, 
  Messages, 
  SysUtils, 
  Classes, 
  Graphics, 
  Controls, 
  Forms, 
  Dialogs,
  StdCtrls, 
  DBCtrls, 
  DB, 
  Mask, 
  RkDBAddress_Common;

type
  TRkDBAddress_Frame = class;

  TRkDataFields_Frame = class( TPersistent )
  private
    FAddress_Frame: TRkDBAddress_Frame;
  protected
    { Property Access Methods }
    function GetDataSource: TDataSource;
    function GetDataField( Index: Integer ): TRkDataField;
    procedure SetDataField( Index: Integer; const Value: TRkDataField );
  public
    constructor Create( Address: TRkDBAddress_Frame );
  published
    property DataSource: TDataSource      // In D6, this property shows up in OI
      read GetDataSource;

    property FirstName: string
      index 1
      read GetDataField
      write SetDataField;

    property LastName: string
      index 2
      read GetDataField
      write SetDataField;

    property Address1: string
      index 3
      read GetDataField
      write SetDataField;

    property Address2: string
      index 4
      read GetDataField
      write SetDataField;

    property City: string
      index 5
      read GetDataField
      write SetDataField;

    property State: string
      index 6
      read GetDataField
      write SetDataField;

    property ZIP: string
      index 7
      read GetDataField
      write SetDataField;
  end;


  TRkFieldCaptions_Frame = class( TPersistent )
  private
    FAddress_Frame: TRkDBAddress_Frame;
  protected
    { Property Access Methods }
    function GetFieldCaption( Index: Integer ): string;
    procedure SetFieldCaption( Index: Integer; const Value: string );
  public
    constructor Create( Address: TRkDBAddress_Frame );
  published
    { Property Declarations }
    property FirstName: string
      index 1
      read GetFieldCaption
      write SetFieldCaption;

    property LastName: string
      index 2
      read GetFieldCaption
      write SetFieldCaption;

    property Address: string
      index 3
      read GetFieldCaption
      write SetFieldCaption;

    property City: string
      index 4
      read GetFieldCaption
      write SetFieldCaption;

    property State: string
      index 5
      read GetFieldCaption
      write SetFieldCaption;

    property ZIP: string
      index 6
      read GetFieldCaption
      write SetFieldCaption;
  end;



  TRkDBAddress_Frame = class(TFrame)
    LblFirstName: TLabel;
    LblLastName: TLabel;
    LblAddress: TLabel;
    LblCity: TLabel;
    LblState: TLabel;
    LblZIP: TLabel;
    EdtFirstName: TDBEdit;
    EdtLastName: TDBEdit;
    EdtAddress1: TDBEdit;
    EdtAddress2: TDBEdit;
    EdtCity: TDBEdit;
    CbxState: TDBComboBox;
    EdtZIP: TDBEdit;
    procedure EdtZIPExit(Sender: TObject);
  private
    FDataFields: TRkDataFields_Frame;
    FFieldCaptions: TRkFieldCaptions_Frame;

    function GetDataSource: TDataSource;
    procedure SetDataSource( Value: TDataSource );
  protected
    procedure SetDataFields( Value: TRkDataFields_Frame ); virtual;
    procedure SetFieldCaptions( Value: TRkFieldCaptions_Frame ); virtual;
  public
    constructor Create( AOwner: TComponent ); override;
  published
    property DataSource: TDataSource
      read GetDataSource
      write SetDataSource;

    property DataFields: TRkDataFields_Frame
      read FDataFields
      write SetDataFields;

    property FieldCaptions: TRkFieldCaptions_Frame
      read FFieldCaptions
      write SetFieldCaptions;
  end;

implementation

{$R *.dfm}


{=================================}
{== TRkDataFields_Frame Methods ==}
{=================================}

constructor TRkDataFields_Frame.Create( Address: TRkDBAddress_Frame );
begin
  inherited Create;
  FAddress_Frame := Address;
end;

function TRkDataFields_Frame.GetDataSource: TDataSource;
begin
  Result := FAddress_Frame.DataSource;
end;

function TRkDataFields_Frame.GetDataField( Index: Integer ): TRkDataField;
begin
  case Index of
    1: Result := FAddress_Frame.EdtFirstName.DataField;
    2: Result := FAddress_Frame.EdtLastName.DataField;
    3: Result := FAddress_Frame.EdtAddress1.DataField;
    4: Result := FAddress_Frame.EdtAddress2.DataField;
    5: Result := FAddress_Frame.EdtCity.DataField;
    6: Result := FAddress_Frame.CbxState.DataField;
    7: Result := FAddress_Frame.EdtZIP.DataField;
  end;
end;


procedure TRkDataFields_Frame.SetDataField( Index: Integer; const Value: TRkDataField );
begin
  case Index of
    1: FAddress_Frame.EdtFirstName.DataField := Value;
    2: FAddress_Frame.EdtLastName.DataField := Value;
    3: FAddress_Frame.EdtAddress1.DataField := Value;
    4: FAddress_Frame.EdtAddress2.DataField := Value;
    5: FAddress_Frame.EdtCity.DataField := Value;
    6: FAddress_Frame.CbxState.DataField := Value;
    7: FAddress_Frame.EdtZIP.DataField := Value;
  end;
end;


{====================================}
{== TRkFieldCaptions_Frame Methods ==}
{====================================}

constructor TRkFieldCaptions_Frame.Create( Address: TRkDBAddress_Frame );
begin
  inherited Create;
  FAddress_Frame := Address;
end;


function TRkFieldCaptions_Frame.GetFieldCaption( Index: Integer ): string;
begin
  case Index of
    1: Result := FAddress_Frame.LblFirstName.Caption;
    2: Result := FAddress_Frame.LblLastName.Caption;
    3: Result := FAddress_Frame.LblAddress.Caption;
    4: Result := FAddress_Frame.LblCity.Caption;
    5: Result := FAddress_Frame.LblState.Caption;
    6: Result := FAddress_Frame.LblZIP.Caption;
  end;
end;


procedure TRkFieldCaptions_Frame.SetFieldCaption( Index: Integer; const Value: string );
begin
  case Index of
    1: FAddress_Frame.LblFirstName.Caption := Value;
    2: FAddress_Frame.LblLastName.Caption := Value;
    3: FAddress_Frame.LblAddress.Caption := Value;
    4: FAddress_Frame.LblCity.Caption := Value;
    5: FAddress_Frame.LblState.Caption := Value;
    6: FAddress_Frame.LblZIP.Caption := Value;
  end;
end;


{================================}
{== TRkDBAddress_Frame Methods ==}
{================================}

constructor TRkDBAddress_Frame.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );

  FDataFields := TRkDataFields_Frame.Create( Self );
  FFieldCaptions := TRkFieldCaptions_Frame.Create( Self );
end;


function TRkDBAddress_Frame.GetDataSource: TDataSource;
begin
  // Use EdtFirstName to get current DataSource
  Result := EdtFirstName.DataSource;
end;


procedure TRkDBAddress_Frame.SetDataSource( Value: TDataSource );
begin
  if Value <> EdtFirstName.DataSource then
  begin
    // Assign All Internal Controls to Same DataSource
    EdtFirstName.DataSource := Value;
    EdtLastName.DataSource := Value;
    EdtAddress1.DataSource := Value;
    EdtAddress2.DataSource := Value;
    EdtCity.DataSource := Value;
    CbxState.DataSource := Value;
    EdtZIP.DataSource := Value;
  end;
end;


procedure TRkDBAddress_Frame.SetDataFields( Value: TRkDataFields_Frame );
begin
  FDataFields.Assign( Value );
end;


procedure TRkDBAddress_Frame.SetFieldCaptions( Value: TRkFieldCaptions_Frame );
begin
  FFieldCaptions.Assign( Value );
end;


procedure TRkDBAddress_Frame.EdtZIPExit(Sender: TObject);
begin
  // Special lookup functionality

  if EdtZIP.Text = '60532' then
  begin
    EdtCity.Field.AsString := 'Lisle';
    CbxState.Field.AsString := 'IL';
  end;
end;

end.
