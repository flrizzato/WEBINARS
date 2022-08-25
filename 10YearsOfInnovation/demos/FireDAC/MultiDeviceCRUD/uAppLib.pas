unit uAppLib;

interface

type
  TAppLib = class
    class function NumberFormat(value: string): double;
  end;

implementation

uses
  System.SysUtils, FMX.DialogService;

{ TAppLib }

class function TAppLib.NumberFormat(value: string): double;
var s: string;
begin
  s := StringReplace(value, '.', '', [rfReplaceAll]);
  if not TryStrToFloat(s, result) then
    TDialogService.ShowMessage('Not a valid number!');
end;

end.
