program subprocess;

{$SetPEFlags $0001}

{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

uses
  Windows,
  ceflib,
  SysUtils;

{
  Simple CEF3 host application to be used in multi-process mode (e.g. with
  CefSingleProcess := False). Needs to be specified in the main application
  with CefBrowserSubprocessPath := [Filename of this executable]

  This simple application has been developed by Eric Grange. If called
  standalone it only shows the version of the libcef.dll
}


function GetCEFVersion : String;
var
  size, handle, n: Cardinal;
  buf, info: Pointer;
begin
  Result := 'unknown';
  handle := 0;
  size := GetFileVersionInfoSize(PChar(CefLibrary), handle);
  if size = 0 then
    Exit;

  GetMem(buf, size);
  try
    if GetFileVersionInfo(PChar(CefLibrary), handle, size, buf) then
    begin
      if VerQueryValue(buf, '\', info, n) then
        with PVSFixedFileInfo(info)^ do
        begin
          Result := Format('%d.%d.%d.%d', [HiWord(dwFileVersionMS),
            LoWord(dwFileVersionMS), HiWord(dwFileVersionLS),
            LoWord(dwFileVersionLS)]);
        end;
    end;
  finally
    FreeMem(buf);
  end;
end;

const
  cTitle = 'Chromium Embedded Framework Host Process';
begin
  // multi process only
  CefSingleProcess := False;
  try
    if not CefLoadLibDefault then
      Halt;
    MessageBox(0, PChar('libcef.dll version ' + GetCEFVersion), cTitle,
      MB_ICONINFORMATION + MB_OK);
  except
    on E: Exception do
      MessageBox(0, PChar(E.Message), cTitle, MB_ICONERROR + MB_OK);
  end;
end.
