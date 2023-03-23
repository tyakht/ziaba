program Ziaba;

uses
  Vcl.Forms,
  M_Panel in 'M_Panel.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
