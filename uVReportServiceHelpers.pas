unit uVReportServiceHelpers;

interface

uses
 System.SysUtils, uResults, Variants,
 VReportServiceLibrary_Intf;

type
  TroResultHelper = class helper for roReportResult
  private
    function GetResult: TResultRecord;
    procedure SetResult(const Value: TResultRecord);
  published
    property Result: TResultRecord read GetResult write SetResult;
  end;

implementation

{ TroResultHelper }

function TroResultHelper.GetResult: TResultRecord;
begin
  Result.Code        := ResultCode;
  Result.Description := ResultMsg;
end;

procedure TroResultHelper.SetResult(const Value: TResultRecord);
begin
  ResultCode := Value.Code;
  ResultMsg  := Value.Description;
end;

end.
