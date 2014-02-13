unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, Menus, SdpoSerial;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart2: TChart;
    gas14: TLineSeries;
    gas13: TLineSeries;
    gas12: TLineSeries;
    gas11: TLineSeries;
    temperature: TLineSeries;
    serSdpo1: TSdpoSerial;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit3: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit4: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit5: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit6: TEdit;
    Edit60: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    runtime: TLabel;
    SaveDialog1: TSaveDialog;
    serSdpo: TSdpoSerial;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure DosaClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure serSdpoRxData(Sender: TObject);

    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { private declarations }
    FComBuffer: string;
  public
    { public declarations }
    counter: integer;
    x: integer;
    minutes: integer;
  end;

var
  Form1: TForm1;
  passtime: array [1..10] of TEdit;
  gas1: array [1..10] of TEdit;
  gas2: array [1..10] of TEdit;
  gas3: array [1..10] of TEdit;
  gas4: array [1..10] of TEdit;
  temp: array [1..10] of TEdit;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  passtime[1] := Edit1;
  passtime[2] := Edit2;
  passtime[3] := Edit3;
  passtime[4] := Edit4;
  passtime[5] := Edit5;
  passtime[6] := Edit6;
  passtime[7] := Edit7;
  passtime[8] := Edit8;
  passtime[9] := Edit9;
  passtime[10] := Edit10;
  gas1[1] := Edit11;
  gas1[2] := Edit12;
  gas1[3] := Edit13;
  gas1[4] := Edit14;
  gas1[5] := Edit15;
  gas1[6] := Edit16;
  gas1[7] := Edit17;
  gas1[8] := Edit18;
  gas1[9] := Edit19;
  gas1[10] := Edit20;
  gas2[1] := Edit21;
  gas2[2] := Edit22;
  gas2[3] := Edit23;
  gas2[4] := Edit24;
  gas2[5] := Edit25;
  gas2[6] := Edit26;
  gas2[7] := Edit27;
  gas2[8] := Edit28;
  gas2[9] := Edit29;
  gas2[10] := Edit30;
  gas3[1] := Edit31;
  gas3[2] := Edit32;
  gas3[3] := Edit33;
  gas3[4] := Edit34;
  gas3[5] := Edit35;
  gas3[6] := Edit36;
  gas3[7] := Edit37;
  gas3[8] := Edit38;
  gas3[9] := Edit39;
  gas3[10] := Edit40;
  gas4[1] := Edit41;
  gas4[2] := Edit42;
  gas4[3] := Edit43;
  gas4[4] := Edit44;
  gas4[5] := Edit45;
  gas4[6] := Edit46;
  gas4[7] := Edit47;
  gas4[8] := Edit48;
  gas4[9] := Edit49;
  gas4[10] := Edit50;
  temp[1] := Edit51;
  temp[2] := Edit52;
  temp[3] := Edit53;
  temp[4] := Edit54;
  temp[5] := Edit55;
  temp[6] := Edit56;
  temp[7] := Edit57;
  temp[8] := Edit58;
  temp[9] := Edit59;
  temp[10] := Edit60;
  x := 1;
  minutes := 0;
end;

procedure TForm1.Label7Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  filename: string;
  File1: TextFile;
  str: string;
  i: integer;
begin
  if OpenDialog1.Execute then
  begin
    filename := OpenDialog1.Filename;
    ListBox1.Items.Add(filename + ' is opened');
    ShowMessage(filename);
    AssignFile(File1, filename);
    Reset(File1);
    Readln(File1, Str);       // ignore first 3 read lines
    Readln(File1, Str);
    Readln(File1, Str);
    for i := 1 to 10 do
    begin
      Readln(File1, Str); // Reads the whole line from the file
      passtime[i].Caption := Copy(Str, 1, 3);
      gas1[i].Caption := Copy(Str, 5, 6);
      gas2[i].Caption := Copy(Str, 12, 6);
      gas3[i].Caption := Copy(Str, 19, 6);
      gas4[i].Caption := Copy(Str, 26, 6);
      temp[i].Caption := Copy(Str, 33, 3);
    end;
    CloseFile(File1);
  end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var
  fs: TFileStream;
  Filevar1: TextFile;
  i: integer;
  MyTime: TDateTime;
begin
  MyTime := Now;
  if SaveDialog1.Execute then
  begin
    fs := nil;
    fs := TFileStream.Create(Utf8ToAnsi(SaveDialog1.FileName), fmCreate);
    fs.Free;
    AssignFile(FileVar1, SaveDialog1.FileName);
    Rewrite(FileVar1);
    Writeln(FileVar1, 'File created at ' + DateTimeToStr(MyTime));
    Writeln(FileVar1, '------------------------------------------------');
    Writeln(FileVar1, 'Time,Gas1,Gas2,Gas3,Gas4,Temperature');
    for i := 1 to 10 do
    begin
      Writeln(FileVar1, (passtime[i].Caption + ',' + gas1[i].Caption + ',' +
        gas2[i].Caption + ',' + gas3[i].Caption + ',' + gas4[i].Caption + ',' + temp[i].Caption));
    end;
    CloseFile(FileVar1);
    ListBox1.Items.Add(SaveDialog1.FileName + ' is Saved');
  end;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to 10 do
  begin
    passtime[i].Caption := '';
    gas1[i].Caption := '';
    gas2[i].Caption := '';
    gas3[i].Caption := '';
    gas4[i].Caption := '';
    temp[i].Caption := '';
  end;
  ListBox1.Items.Add('File Closed');
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  if serSdpo.Active then
    serSdpo.Close;
  if serSdpo1.Active then
    serSdpo1.Close;
  Form1.Close;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  serSdpo.Open;
  serSdpo1.Open;
  ListBox1.Items.Add('Run Started');
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  Timer1.Enabled := False;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
var
  SendText: string;
  Res: integer;
begin
  SendText := 'SP10.0000' + #13;
  if (SendText <> '') and serSdpo.Active then
    Res := serSdpo.WriteData(SendText);
  sleep(2500);
  SendText := 'SP20.0000' + #13;
  if (SendText <> '') and serSdpo.Active then
    Res := serSdpo.WriteData(SendText);
  sleep(2500);
  SendText := 'SP30.0000' + #13;
  if (SendText <> '') and serSdpo.Active then
    Res := serSdpo.WriteData(SendText);
  sleep(2500);
  SendText := 'SP40.0000' + #13;
  if (SendText <> '') and serSdpo.Active then
    Res := serSdpo.WriteData(SendText);
  SendText := #2 + '01010WWRD0114,01,0000' + #3 + #13;
  if (SendText <> '') and serSdpo1.Active then
    Res := serSdpo1.WriteData(SendText);
  x := x + 1;

  //serSdpo.Close;
  //serSdpo1.Close;
  // Form1.Close;
end;




procedure TForm1.serSdpoRxData(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := False;
end;



procedure TForm1.DosaClick(Sender: TObject);
begin

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  //Timer2.Enabled := True;
  serSdpo.Open;
  serSdpo1.Open;
  ListBox1.Items.Add('Run Started');
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if serSdpo.Active then
    serSdpo.Close;
  if serSdpo1.Active then
    serSdpo1.Close;
end;

procedure TForm1.Timer1StartTimer(Sender: TObject);
begin
  FComBuffer := '';
  serSdpo.Open;
  serSdpo1.Open;
  runtime.Caption := IntToStr(StrToInt(passtime[1].Text)) + ' minute to step '
  + IntToStr(x);
end;

procedure TForm1.Timer1StopTimer(Sender: TObject);
begin
  ListBox1.Items.Add('Run Paused');
  serSdpo.Close;
  serSdpo1.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  SendText: string;
  Data: string;
  Res: integer;
  mystring: string;
  num: real;
  reader: integer;
begin
  //reader := 6;
  counter := counter + 1;
  minutes := minutes + 1;
  SendText := 'C1' + #13;
  sleep(4000);
  Res := serSdpo.WriteData(SendText);
  sleep(2500);
  Data := serSdpo.ReadData();
  sleep(2500);
  ListBox1.Items.Add(Data);
  if Length(Data) > 0 then
  begin
    //while Data[reader] <> ' ' do
    //reader := reader + 1;
    //mystring := Copy(Data, 6, reader-3);
    mystring := Copy(Data, 5, 7);
    ListBox1.Items.Add(mystring);
    //   ListBox1.Items.Add(Data);
    num := StrToFloat(mystring);
    //     ListBox1.Items.Add(mystring);
    gas11.AddXY(minutes, num);
    //      PlotPanel1.AddXY(num, num);
  end
  else
  ListBox1.Items.Add('No Data');

  if StrToInt(passtime[x].Text) <> counter then
    runtime.Caption := (IntToStr(StrToInt(passtime[x].Text) - counter) +
      ' minute(s)  to step ' + IntToStr(x + 1))

  else
  begin
    ListBox1.Items.Add('Beginning step ' + IntToStr(x));
    SendText := 'SP2' + gas1[x].Text + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    sleep(2500);
    SendText := 'SP1' + gas2[x].Text + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    sleep(2500);
    SendText := 'SP3' + gas3[x].Text + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    sleep(4000);
    SendText := 'SP4' + gas4[x].Text + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    SendText := #2 + '01010WWRD0114,01,' + IntToHex(StrToInt(temp[x].Text),
      4) + #3 + #13;
    if (SendText <> '') and serSdpo1.Active then
      Res := serSdpo1.WriteData(SendText);
    x := x + 1;
    runtime.Caption := IntToStr(StrToInt(passtime[x].Text) - counter) +
      ' minutes to step ' + IntToStr(x + 1);

  end;
  if ((StrToInt(passtime[x].Text) = 0) or (x = 11)) then
    //this part to get out of run
  begin
    SendText := 'SP10.0000' + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    sleep(2500);
    SendText := 'SP20.0000' + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    sleep(2500);
    SendText := 'SP30.0000' + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    sleep(4000);
    SendText := 'SP40.0000' + #13;
    if (SendText <> '') and serSdpo.Active then
      Res := serSdpo.WriteData(SendText);
    SendText := #2 + '01010WWRD0114,01,0000' + #3 + #13;
    if (SendText <> '') and serSdpo1.Active then
      Res := serSdpo1.WriteData(SendText);
    x := x + 1;

    //serSdpo.Close;
    //serSdpo1.Close;
    // Form1.Close;
  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
//var
//  Data: string;
//SendText: string;
// mystring: string;
//  Res: integer;
// num: real;
//  reader: integer;
begin
  //ListBox1.Items.Add('Yes, hello');
  //sleep(10000);
  //reader := 6;
  //  minutes := minutes + 1;
  //SendText := 'C2' + #13;
  //   Res := serSdpo.WriteData(SendText);
  // sleep(2500);
  //  Data := serSdpo.ReadData();
  //   ListBox1.Items.Add(Data);
  //   if Length(Data) = 0 then
  //    ListBox1.Items.Add('No Data');
  //   if Length(Data) > 0 then
  // begin
  //while Copy(Data, reader, reader) <> ' ' do
  //begin
  //ListBox1.Items.Add('Hello there');
  //reader:=reader + 1;
  //end;
  //mystring := Copy(Data, 6, reader-1);
  //    mystring := Copy(Data, 5, 6);
  //    ListBox1.Items.Add(mystring);
  //  ListBox1.Items.Add(Data);
  //    num := StrToFloat(mystring);
  //    gas11.AddXY(minutes,num);
  //      PlotPanel1.AddXY(num, num);
  //  end;
end;

end.
