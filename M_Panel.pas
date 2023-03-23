unit M_Panel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, comobj,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Panel2: TPanel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    Panel3: TPanel;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Panel4: TPanel;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton14: TRadioButton;
    CheckBox3: TCheckBox;
    Panel6: TPanel;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Edit5: TEdit;
    CheckBox4: TCheckBox;
    Button1: TButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Edit6: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit7: TEdit;
    OpenDialog1: TOpenDialog;
    Edit8: TEdit;
    Button5: TButton;
    Button6: TButton;
    Label3: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit9: TEdit;
    Button7: TButton;
    Button8: TButton;
    Timer2: TTimer;
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  drv: variant;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
tx,s:shortstring;
sm,sm1:integer;
begin
   tx:='';
   if checkbox1.Checked then  tx:=tx+'0' else tx:=tx+'9';
   if checkbox3.Checked then  tx:=tx+'7' else tx:=tx+'0';
   if radiobutton1.Checked then  tx:=tx+'11';
   if radiobutton2.Checked then  tx:=tx+'22';
   if radiobutton3.Checked then  tx:=tx+'33';
   if radiobutton4.Checked then  tx:=tx+'44';
   if radiobutton14.Checked then  tx:=tx+'45';
   if radiobutton5.Checked then  tx:=tx+'00';
   if radiobutton6.Checked then  tx:=tx+'55';
   if radiobutton7.Checked then  tx:=tx+'58';
   if radiobutton19.Checked then  tx:=tx+'95';
   if radiobutton8.Checked then  tx:=tx+'88';
   if radiobutton9.Checked then  tx:=tx+'00';
   if radiobutton20.Checked then  tx:=tx+'77';
   if (radiobutton1.Checked or radiobutton2.Checked) then
       begin
          s:=edit3.Text;
          if length(s)=1 then  s:='0'+s;
          tx:=tx+s;
          s:=edit4.Text;
          if length(s)=1 then  s:='0'+s;
          tx:=tx+s;
       end;
   if radiobutton3.Checked then
       begin
          if checkbox2.Checked then tx:=tx+'00' else tx:=tx+'88';
          tx:=tx+'00';

       end;
   if (radiobutton4.Checked or radiobutton5.Checked) then
       begin
          sm:=strtoint(edit2.Text);
          sm:=sm div 10;
          s:=inttostr(sm);
          if length(s)=3 then  s:='0'+s;
          if length(s)=2 then  s:='00'+s;
          if length(s)=1 then  s:='000'+s;
          tx:=tx+s;
       end;

    if radiobutton10.Checked then  tx:=tx+'00';
    if radiobutton11.Checked then  tx:=tx+'66';

    if checkbox4.Checked then
       begin
         tx:=tx+'95';
          if radiobutton16.Checked then
            begin
               s:=edit6.Text;
               if length(s)=1 then  s:='0'+s;
            end
           else s:='00';
          tx:=tx+s;

         if radiobutton15.Checked then  tx:=tx+'00';
         if radiobutton16.Checked then  tx:=tx+'11';
         if radiobutton17.Checked then  tx:=tx+'22';
         if radiobutton18.Checked then  tx:=tx+'33';
       end;

   edit5.Text:=tx;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  drv:=CreateOleObject('AddIn.DrvFR');
    drv.ShowProperties;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     //drv.ReadSerialNumser;
     drv.Password:=30;
     drv.UpdateFirmwareMethod:=0;
     //if drv.connect=0 then  drv.beep;
     drv.FileName:=edit8.Text;
     drv.UpdateFirmware;
     label3.Caption:=drv.UpdateFirmwareStatusMessage;
     timer1.Enabled:=true;



end;

procedure TForm1.Button4Click(Sender: TObject);
var
sent: array of byte;
begin
  setlength(sent,8);
  //sent[1]:=$02;sent[2]:=$05;sent[3]:=$13;sent[4]:=$1e;sent[5]:=$00;sent[6]:=$00;sent[7]:=$00;sent[8]:=$08;
  drv.BinaryConversion:=1;
  drv.TransferBytes:= edit7.Text;
  drv.ExchangeBytes;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

  Opendialog1.Execute;
  Edit8.Text:=OpenDialog1.FileName;
  
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  drv.Password:=strtoint(edit1.Text);
  drv.ValueOfFieldString:=edit5.Text;
  drv.TableNumber:=12;
  drv.FieldNumber:=3;
  drv.WriteTable;
  drv.Password:=30;
  Button6.Caption:='OK!';
  Timer2.Enabled:=true;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Opendialog1.Execute;
  Edit9.Text:=OpenDialog1.FileName;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
f:TextFILE;
s,n,l:shortstring;
i:byte;
begin
  drv.GetLongSerialNumberAndLongRNM ;
  AssignFile(f, Edit9.Text);
  Reset(f);
  if IOResult<>0 then
    MessageDlg( 'Ошибка открытия файла', mtError, [mbOk], 0);

  repeat
    readln(f,s);
    n:=s;
    setlength(n,19);
    for i := 22 to 51 do
       begin
         l[i-21]:=s[i];
       end;
    Edit7.Text:=l;

  until(n=drv.SerialNumber) ;
  CloseFile(f);

end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
   if checkbox4.Checked then
       begin
         panel6.Visible:=true;
         radiobutton19.Visible:=true;
         edit6.Visible:=true;
         label6.Visible:=true;
       end
     else
        begin
          panel6.Visible:=false;
          radiobutton19.Visible:=false;
          edit6.Visible:=false;
          label6.Visible:=false;
        end;
end;



procedure TForm1.RadioButton14Click(Sender: TObject);
begin
  edit2.Visible:=true;
  edit3.Visible:=false;
  edit4.Visible:=false;
  checkbox2.Visible:=false;
  label1.Visible:=false;
  label2.Visible:=false;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  //Panel5.Visible:=false;
  edit2.Visible:=false;
  edit3.Visible:=true;
  edit4.Visible:=true;
  checkbox2.Visible:=false;
  label1.Caption:='Отдел1';
  label2.Caption:='Отдел2';
  label1.Visible:=true;
  label2.Visible:=true;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  //Panel5.Visible:=false;
  edit2.Visible:=false;
  edit3.Visible:=true;
  edit4.Visible:=true;
  checkbox2.Visible:=false;
  label1.Caption:='Проходит';
  label2.Caption:='Обрезается';
  label1.Visible:=true;
  label2.Visible:=true;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  //Panel5.Visible:=false;
  edit2.Visible:=false;
  edit3.Visible:=false;
  edit4.Visible:=false;
  checkbox2.Visible:=true;
  label1.Visible:=false;
  label2.Visible:=false;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  //Panel5.Visible:=true;
  edit2.Visible:=true;
  edit3.Visible:=false;
  edit4.Visible:=false;
  checkbox2.Visible:=false;
  label1.Visible:=false;
  label2.Visible:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

     label3.Caption:=drv.UpdateFirmwareStatusMessage;
     if ((drv.UpdateFirmwareStatus=0) or (drv.UpdateFirmwareStatus=3)) then
        begin
          timer1.Enabled:=false;
          //drv.beep;
        end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Button6.Caption:='Запись настроек';
  Timer2.Enabled:=false;
end;

end.
