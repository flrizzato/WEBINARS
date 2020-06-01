In order to get the composite controls (including the frame component sample)
installed into Delphi, you need to make a call to RegisterComponents in a
Register procedure (usually in a registration unit that is contained in a 
design package). For example,

procedure Register;
begin
  {== Register Components ==}

  RegisterComponents( 'Raize VCL Samples',
                      [ TRkDBAddress, TRkDBAddress_Sub, 
                        TRkDBAddress_Frame ] );

end;


