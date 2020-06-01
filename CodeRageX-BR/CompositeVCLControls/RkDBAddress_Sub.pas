{=======================================================================================================================
  RkDBAddress_Sub Unit

  RK Components - Component Source Unit


  Components            Description
  ----------------------------------------------------------------------------------------------------------------------
  TRzDBAddress_Sub      This TRkDBAddress_Sub component is comprised of the following edit fields: First Name, 
                          Last Name, Street, City, and ZIP. The State field is actually a combo box which is populated 
                          with the 50 states including the District of Columbia. The edit fields are data-aware, and 
                          thus this component can be hooked up to a DataSource.

                          Note: This example illustrates how to implement Sub-Components.

  
  Copyright © 2001-2003 by Ray Konopka.  All Rights Reserved.
=======================================================================================================================}

//{$I RkComps.inc}

unit RkDBAddress_Sub;

interface

uses
  Classes, 
  Messages, 
  Controls, 
  StdCtrls, 
  DB, 
  DBCtrls, 
  Graphics, 
  ExtCtrls,
  RkDBAddress_Common;

type
  TRkDBAddress_Sub = class( TWinControl )
  private
    FEdtFirstName: TDBEdit;
    FLblFirstName: TLabel;
    FEdtLastName: TDBEdit;
    FLblLastName: TLabel;
    FEdtAddress1: TDBEdit;
    FEdtAddress2: TDBEdit;
    FLblAddress: TLabel;
    FEdtCity: TDBEdit;
    FLblCity: TLabel;
    FCbxState: TDBComboBox;
    FLblState: TLabel;
    FEdtZIP: TDBEdit;
    FLblZIP: TLabel;

    FStateList: TStrings;    // Defaults to a list of state abbreviations

    FLabelPosition: TRkLabelPosition;
    FOnChange: TRkEditChangeEvent;      // Change event for all edit fields

    function GetCharCase: TEditCharCase;
    procedure SetCharCase( Value: TEditCharCase );
    function GetFieldColor: TColor;
    procedure SetFieldColor( Value: TColor );
    function GetDataSource: TDataSource;
    procedure SetDataSource( Value: TDataSource );
    procedure SetLabelPosition( Value: TRkLabelPosition );
    procedure SetStateList( Value: TStrings );

    // Update methods
    function CreateEdit( const AName: string ): TDBEdit;
    function CreateLabel( const AName: string; ACaption: TCaption ): TLabel;
    function CreateCombo( const AName: string ): TDBComboBox;

    procedure CreateStateList;
    procedure DoChange( Sender: TObject );
    function GetFontHeight( Font: TFont ): Integer;
    procedure WMSize( var Msg: TWMSize ); message wm_Size;
    procedure CMFontChanged( var Msg: TMessage ); message cm_FontChanged;
  protected
    procedure Change( Field: TRkEditField; Text: string ); dynamic;
    procedure CreateWnd; override;
    procedure PositionControls; virtual;
    procedure Resize; override;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;

  published
    property CharCase: TEditCharCase
      read GetCharCase
      write SetCharCase;

    property FieldColor: TColor
      read GetFieldColor
      write SetFieldColor;

    property DataSource: TDataSource
      read GetDataSource
      write SetDataSource;

    property FirstNameLabel: TLabel
      read FLblFirstName;

    property FirstNameEdit: TDBEdit
      read FEdtFirstName;

    property LastNameLabel: TLabel
      read FLblLastName;

    property LastNameEdit: TDBEdit
      read FEdtLastName;

    property AddressLabel: TLabel
      read FLblAddress;

    property Address1Edit: TDBEdit
      read FEdtAddress1;

    property Address2Edit: TDBEdit
      read FEdtAddress2;

    property CityLabel: TLabel
      read FLblCity;

    property CityEdit: TDBEdit
      read FEdtCity;

    property StateLabel: TLabel
      read FLblState;

    property StateCombo: TDBComboBox
      read FCbxState;

    property ZIPLabel: TLabel
      read FLblZIP;

    property ZIPEdit: TDBEdit
      read FEdtZIP;

    property LabelPosition: TRkLabelPosition
      read FLabelPosition
      write SetLabelPosition
      default lpOnTop;

    property StateList: TStrings
      read FStateList
      write SetStateList;

    property OnChange: TRkEditChangeEvent
      read FOnChange
      write FOnChange;

    property Font;
    property ParentFont;
  end;


implementation

uses
  Windows;

resourcestring
  SAddrFirstName = 'First Name';
  SAddrLastName  = 'Last Name';
  SAddrAddress   = 'Address';
  SAddrCity      = 'City';
  SAddrState     = 'State';
  SAddrZIP       = 'ZIP';


{==============================}
{== TRkDBAddress_Sub Methods ==}
{==============================}

constructor TRkDBAddress_Sub.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );

  // Don't allow other controls to be dropped onto the address component
  ControlStyle := ControlStyle - [csAcceptsControls ];

  // Clean up is handled when the TComponent ancestor class frees
  // all components on the Components list.

  FLblFirstName := CreateLabel( 'FirstNameLabel', SAddrFirstName );
  FEdtFirstName := CreateEdit( 'FirstNameEdit' );

  FLblLastName := CreateLabel( 'LastNameLabel', SAddrLastName );
  FEdtLastName := CreateEdit( 'LastNameEdit' );

  FLblAddress := CreateLabel( 'AddressLabel', SAddrAddress );
  FEdtAddress1 := CreateEdit( 'Address1Edit' );
  FEdtAddress2 := CreateEdit( 'Address2Edit' );

  FLblCity := CreateLabel( 'CityLabel', SAddrCity );
  FEdtCity := CreateEdit( 'CityEdit' );

  FLblState := CreateLabel( 'StateLabel', SAddrState );
  FCbxState := CreateCombo( 'StateCombo' );

  FLblZIP := CreateLabel( 'ZIPLabel', SAddrZIP );
  FEdtZIP := CreateEdit( 'ZIPEdit' );

  CreateStateList;

  Width := 382;
  Height := 78;

  LabelPosition := lpOnTop;
  PositionControls;
end; {= TRkDBAddress_Sub.Create =}


destructor TRkDBAddress_Sub.Destroy;
begin
  // No need to destroy the embedded components, because the inherited
  // destructor will destroy all components on the Components list.
  // FStateList is not on that list, so we need to destroy it here.
  FStateList.Free;
  inherited Destroy;
end;


function TRkDBAddress_Sub.CreateLabel( const AName: string; ACaption: TCaption ): TLabel;
begin
  Result := TLabel.Create( Self );          // Labels are owned by the container
  Result.Parent := Self;
  Result.Visible := True;
  Result.Caption := ACaption;

  Result.Name := AName;                      // Need for Sub-Component operation
  Result.SetSubComponent( True );
end;


function TRkDBAddress_Sub.CreateEdit( const AName: string ): TDBEdit;
begin
  Result := TDBEdit.Create( Self );
  Result.Parent := Self;
  Result.Visible := True;

  // Assign OnChange event of each Edit field to point to
  // TRkDBAddress_Sub.DoChange method
  Result.OnChange := DoChange;

  Result.Name := AName;                      // Need for Sub-Component operation
  Result.SetSubComponent( True );
end;


function TRkDBAddress_Sub.CreateCombo( const AName: string ): TDBComboBox;
begin
  Result := TDBComboBox.Create( Self );
  Result.Parent := Self;
  Result.Visible := True;
  Result.Sorted := True;

  Result.Name := AName;                      // Need for Sub-Component operation
  Result.SetSubComponent( True );
end;


procedure TRkDBAddress_Sub.CreateWnd;
begin
  inherited CreateWnd;

  // When CreateWnd is called, the Items list of FCbxState is cleared.
  // Therefore, the contents of the FStateList are copied back into
  // FCbxState.

  // Plus, you cannot add items to a ComboBox until its Parent's window
  // handle has been allocated. Therefore, this code also serves to
  // initially populate the ComboBox with state names.
  FCbxState.Items.Assign( FStateList );
end;


procedure TRkDBAddress_Sub.CreateStateList;
begin
  FStateList := TStringList.Create;
  FStateList.BeginUpdate;
  try
    FStateList.Add( 'AK' );      // Alaska
    FStateList.Add( 'AL' );      // Alabama
    FStateList.Add( 'AR' );      // Arkansas
    FStateList.Add( 'AZ' );      // Arizona
    FStateList.Add( 'CA' );      // California
    FStateList.Add( 'CO' );      // Colorado
    FStateList.Add( 'CT' );      // Connecticut
    FStateList.Add( 'DC' );      // District of Columbia
    FStateList.Add( 'DE' );      // Delaware
    FStateList.Add( 'FL' );      // Florida
    FStateList.Add( 'GA' );      // Georgia
    FStateList.Add( 'HI' );      // Hawaii
    FStateList.Add( 'IA' );      // Iowa
    FStateList.Add( 'ID' );      // Idaho
    FStateList.Add( 'IL' );      // Illinois
    FStateList.Add( 'IN' );      // Indiana
    FStateList.Add( 'KS' );      // Kansas
    FStateList.Add( 'KY' );      // Kentucky
    FStateList.Add( 'LA' );      // Louisiana
    FStateList.Add( 'MA' );      // Massachusetts
    FStateList.Add( 'MD' );      // Maryland
    FStateList.Add( 'ME' );      // Maine
    FStateList.Add( 'MI' );      // Michigan
    FStateList.Add( 'MN' );      // Minnesota
    FStateList.Add( 'MO' );      // Missouri
    FStateList.Add( 'MS' );      // Mississippi
    FStateList.Add( 'MT' );      // Montana
    FStateList.Add( 'NC' );      // North Carolina
    FStateList.Add( 'ND' );      // North Dakota
    FStateList.Add( 'NE' );      // Nebraska
    FStateList.Add( 'NH' );      // New Hampshire
    FStateList.Add( 'NJ' );      // New Jersey
    FStateList.Add( 'NM' );      // New Mexico
    FStateList.Add( 'NV' );      // Nevada
    FStateList.Add( 'NY' );      // New York
    FStateList.Add( 'OH' );      // Ohio
    FStateList.Add( 'OK' );      // Oklahoma
    FStateList.Add( 'OR' );      // Oregon
    FStateList.Add( 'PA' );      // Pennsylvania
    FStateList.Add( 'RI' );      // Rhode Island
    FStateList.Add( 'SC' );      // South Carolina
    FStateList.Add( 'SD' );      // South Dakota
    FStateList.Add( 'TN' );      // Tennessee
    FStateList.Add( 'TX' );      // Texas
    FStateList.Add( 'UT' );      // Utah
    FStateList.Add( 'VA' );      // Virginia
    FStateList.Add( 'VT' );      // Vermont
    FStateList.Add( 'WA' );      // Washington
    FStateList.Add( 'WI' );      // Wisconsin
    FStateList.Add( 'WV' );      // West Virginia
    FStateList.Add( 'WY' );      // Wyoming
  finally
    FStateList.EndUpdate;
  end;
end; {= TRkDBAddress_Sub.CreateStateList =}


procedure TRkDBAddress_Sub.SetStateList( Value: TStrings );
begin
  FStateList.Assign( Value );
end;


procedure TRkDBAddress_Sub.Change( Field: TRkEditField; Text: string );
begin
  if Assigned( FOnChange ) then
    FOnChange( Field, Text );
end;


{=========================================================================
  TRkDBAddress_Sub.DoChange

  This method gets called if the OnChange event occurs for any of the
  edit fields contained in this component.  The Change event dispatch
  method is called to surface those events to the user.
=========================================================================}

procedure TRkDBAddress_Sub.DoChange( Sender: TObject );
var
  Field: TRkEditField;
begin
  if Sender = FEdtFirstName then
    Field := efFirstName
  else if Sender = FEdtLastName then
    Field := efLastName
  else if Sender = FEdtAddress1 then
    Field := efAddress1
  else if Sender = FEdtAddress2 then
    Field := efAddress2
  else if Sender = FEdtCity then
    Field := efCity
  else if Sender = FCbxState then
    Field := efState
  else
    Field := efZIP;

  if Sender = FCbxState then
    Change( Field, TDBComboBox( Sender ).Text )
  else
    Change( Field, TDBEdit( Sender ).Text );
end;


function TRkDBAddress_Sub.GetCharCase: TEditCharCase;
begin
  Result := FEdtFirstName.CharCase;
end;


procedure TRkDBAddress_Sub.SetCharCase( Value: TEditCharCase );
begin
  if Value <> FEdtFirstName.CharCase then
  begin
    FEdtFirstName.CharCase := Value;
    FEdtLastName.CharCase := Value;
    FEdtAddress1.CharCase := Value;
    FEdtAddress2.CharCase := Value;
    FEdtCity.CharCase := Value;
    FEdtZIP.CharCase := Value;
  end;
end;


function TRkDBAddress_Sub.GetFieldColor: TColor;
begin
  Result := FEdtFirstName.Color;
end;


procedure TRkDBAddress_Sub.SetFieldColor( Value: TColor );
begin
  if Value <> FEdtFirstName.Color then
  begin
    FEdtFirstName.Color := Value;
    FEdtLastName.Color := Value;
    FEdtAddress1.Color := Value;
    FEdtAddress2.Color := Value;
    FEdtCity.Color := Value;
    FCbxState.Color := Value;
    FEdtZIP.Color := Value;
  end;
end;


function TRkDBAddress_Sub.GetDataSource: TDataSource;
begin
  // Use FEdtFirstName to get current DataSource
  Result := FEdtFirstName.DataSource;
end;


procedure TRkDBAddress_Sub.SetDataSource( Value: TDataSource );
begin
  if Value <> FEdtFirstName.DataSource then
  begin
    // Assign All Internal Controls to Same DataSource
    FEdtFirstName.DataSource := Value;
    FEdtLastName.DataSource := Value;
    FEdtAddress1.DataSource := Value;
    FEdtAddress2.DataSource := Value;
    FEdtCity.DataSource := Value;
    FCbxState.DataSource := Value;
    FEdtZIP.DataSource := Value;
  end;
end;


function TRkDBAddress_Sub.GetFontHeight( Font: TFont ): Integer;
var
  Canvas: TCanvas;
begin
  Canvas := TCanvas.Create;
  try
    Canvas.Handle := GetDC( 0 );
    try
      Canvas.Font := Font;
      Result := Canvas.TextHeight( 'Yy' );
    finally
      ReleaseDC( 0, Canvas.Handle );
    end;
  finally
    Canvas.Free;
  end;
end;


procedure TRkDBAddress_Sub.PositionControls;
var
  FldH: Integer;
  LblH: Integer;
  Line2, Line3, Line4: Integer;
begin
  LblH := GetFontHeight( Font );
  FldH := LblH + GetSystemMetrics( sm_CyBorder ) * 4 + 4;

  if FLabelPosition = lpOnLeft then
  begin
    Line2 := FldH + 4;
    Line3 := 2 * Line2;
    Line4 := 3 * Line2;

    // Arrange fields and labels so that labels are located to the
    // left of each field

    FLblFirstName.SetBounds( 0, 2, 65, LblH  );
    FEdtFirstName.SetBounds( 65, 0, 105, FldH );

    FLblLastName.SetBounds( 170, 2, 63, LblH );
    FLblLastName.Alignment := taRightJustify;
    FEdtLastName.SetBounds( 235, 0, 140, FldH );

    FLblAddress.SetBounds( 0, Line2 + 2, 65, LblH );
    FEdtAddress1.SetBounds( 65, Line2, 310, FldH );

    FEdtAddress2.SetBounds( 65, Line3, 310, FldH );

    FLblCity.SetBounds( 0, Line4 + 2, 65, LblH );
    FEdtCity.SetBounds( 65, Line4, 125, FldH );

    FLblState.SetBounds( 190, Line4 + 2, 43, LblH );
    FLblState.Alignment := taRightJustify;
    FCbxState.SetBounds( 235, Line4, 60, FldH );

    FLblZIP.SetBounds( 295, Line4 + 2, 28, LblH );
    FLblZIP.Alignment := taRightJustify;
    FEdtZIP.SetBounds( 325, Line4, 50, FldH );
  end
  else  // lpOnTop
  begin
    Line2 := LblH + FldH + 2;
    Line3 := 2 * Line2 + 2;
    Line4 := Line3 + FldH + 2;

    // Arrange fields and labels so that labels are located above
    // each field

    FLblFirstName.SetBounds( 0, 0, 120, LblH );
    FEdtFirstName.SetBounds( 0, LblH, 120, FldH );

    FLblLastName.SetBounds( 130, 0, 150, LblH );
    FLblLastName.Alignment := taLeftJustify;
    FEdtLastName.SetBounds( 130, LblH, 150, FldH );

    FLblAddress.SetBounds( 0, Line2, 280, LblH );
    FEdtAddress1.SetBounds( 0, Line2 + LblH, 280, FldH );

    FEdtAddress2.SetBounds( 0, Line3, 280, FldH );

    FLblCity.SetBounds( 0, Line4, 121, LblH );
    FEdtCity.SetBounds( 0, Line4 + LblH, 121, FldH );

    FLblState.SetBounds( 130, Line4, 70, LblH );
    FLblState.Alignment := taLeftJustify;
    FCbxState.SetBounds( 130, Line4 + LblH, 70, FldH );

    FLblZIP.SetBounds( 210, Line4, 70, LblH );
    FLblZIP.Alignment := taLeftJustify;
    FEdtZIP.SetBounds( 210, Line4 + LblH, 70, FldH );
  end;
  Resize;
end; {= TRkDBAddress_Sub.PositionControls =}


procedure TRkDBAddress_Sub.SetLabelPosition( Value: TRkLabelPosition );
begin
  if FLabelPosition <> Value then
  begin
    FLabelPosition := Value;
    PositionControls;
  end;
end;


procedure TRkDBAddress_Sub.WMSize( var Msg: TWMSize );
begin
  inherited;
  Resize;
end;


procedure TRkDBAddress_Sub.Resize;
var
  FldH: Integer;
  LblH: Integer;
begin
  inherited Resize;
  
  LblH := GetFontHeight( Font );
  FldH := LblH + GetSystemMetrics( sm_CyBorder ) * 4 + 4;

  if FLabelPosition = lpOnLeft then
  begin
    Width := 375;
    Height := ( 4 * FldH ) + 3 * 4;
  end
  else
  begin
    Width := 280;
    Height := ( 4 * FldH ) + ( 3 * LblH ) + 8 {4 * LblH + 4 * FldH + 4};
  end;
end;


procedure TRkDBAddress_Sub.CMFontChanged( var Msg: TMessage );
begin
  inherited;
  // If the font changes, update the position and size of the controls
  PositionControls;
end;


end.
