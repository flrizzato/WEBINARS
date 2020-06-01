unit uRegister;

interface

uses Classes, DesignIntf;

procedure Register;

implementation

uses RkDBAddress, RkDBAddress_Frame, RkDBAddress_Sub, RkDBAddress_Common;

procedure Register;
begin
  {== Register Components ==}

  RegisterComponents( 'Raize VCL Samples',
                      [ TRkDBAddress, TRkDBAddress_Sub,
                        TRkDBAddress_Frame ] );
end;

end.
