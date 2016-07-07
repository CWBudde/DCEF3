program guiclient;

uses
  Windows,
  Forms,
  SysUtils,
  main in 'main.pas' {MainForm},
  ceflib in '..\..\src\ceflib.pas',
  cefgui in '..\..\src\cefgui.pas',
  cefvcl in '..\..\src\cefvcl.pas',
  ceffilescheme in '..\filescheme\ceffilescheme.pas';

{$R *.res}

procedure RegisterSchemes(const registrar: ICefSchemeRegistrar);
begin
  registrar.AddCustomScheme('local', True, True, False);
end;

begin
  CefCache := 'cache';
  CefOnRegisterCustomSchemes := RegisterSchemes;
  CefSingleProcess := False;
  if not CefLoadLibDefault then
    Exit;

  CefRegisterSchemeHandlerFactory('local', '', TFileScheme);

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
