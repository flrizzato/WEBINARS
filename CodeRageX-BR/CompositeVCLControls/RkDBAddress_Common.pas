{=======================================================================================================================
  RkDBAddress_Common Unit

  RK Components - Support Source Unit


  This unit defines common types used by the various TRkAddress*** compound components.


  Copyright © 1995-2003 by Ray Konopka.  All Rights Reserved.
=======================================================================================================================}

//{$I RkComps.inc}

unit RkDBAddress_Common;

interface

type
  TRkLabelPosition = ( lpOnLeft, lpOnTop );

  TRkEditField = ( efFirstName, efLastName, efAddress1, efAddress2, efCity, efState, efZIP );

  TRkEditChangeEvent = procedure( Field: TRkEditField; Text: string ) of object;

  TRkDataField = string;                // Required for property editor override


implementation

end.
