{���� ����� � ������, �㦭� ᮧ���� ���⮩ ��㭠�ࠢ����� ᯨ᮪
���⮩ �뢮� � ��� ��஭�
����஢�� �� 䠬���� ���஢ ��������� ���ଠ樥�}

program bilet12;
uses crt;

type
    a = ^dan;
    dan = record
        num: integer;
        other: string;
        sled,pred:a;
    end;

procedure making(var head,ass: a);
var
uksp,before: a;
str: string;
i,j: integer;
f: text;
begin
assign(f,'vhod.inp');
reset(f);
new(uksp);
uksp^.pred:=nil;                  {���� ���⮩}
before:=uksp;
head:=uksp;
while not eof(f) do begin       {���筮� ᮧ����� ���� �� ����� 䠩��}
new(uksp^.sled);
uksp:=uksp^.sled;
uksp^.pred:=before;
read(f,uksp^.num);
readln(f,uksp^.other);
before:=uksp;
end;
new(uksp^.sled);
uksp:=uksp^.sled;               {��᫥���� ���⮩ - ����� ᯨ᪠}
uksp^.pred:=before;
uksp^.sled:=nil;
ass:=uksp;
close(f);
end;

procedure vivod(var head,ass: a; co: string);
var
uksp: a;
f: text;
begin
assign(f,'rez.out');
append(f);
if co='true' then begin           {�뢮� �� ���祭�� �� ����������� ����}
uksp:=head^.sled;
while uksp^.sled<>nil do begin
writeln(f,uksp^.num,' ',uksp^.other);   {᫥�� ���ࠢ�}
uksp:=uksp^.sled;
end; end
else begin
uksp:=ass^.pred;
while uksp^.pred<>nil do begin          {�ࠢ� ������}
writeln(f,uksp^.num,' ',uksp^.other);
uksp:=uksp^.pred;
end;
end;
writeln(f);
close(f);
end;

procedure sort(var head: a);
var
pered,uksp: a;
n: integer;
m: string;
begin
uksp:=head^.sled;                       {�⠢�� �� ����}
while uksp^.sled<>nil do begin
      n:=uksp^.num; m:=uksp^.other;      {������ १��}
      pered:=uksp^.pred;                 {�⠢�� ���. 㪠�. �� ��। ��ᬠ��}
      while (pered^.pred<>nil) and (pered^.other > m) do begin
            pered^.sled^.num:=pered^.num;     {����� ���� �� ��砫� ᯨ᪠}
            pered^.sled^.other:=pered^.other; {��� ���� �饬 ����}
            pered^.num:=n; pered^.other:=m;   {� ���塞 ���ଠ�� ��蠣���}
            pered:=pered^.pred;
      end;
      uksp:=uksp^.sled;   {���� �� ᫥�. ��ᬠ�ਢ����}
      end;
end;

var
ukstr,last1: a;
c: string;
f1:text;

begin
clrscr;
assign(f1,'rez.out');
rewrite(f1);                        {��������� ���� � ��}
close(f1);
making(ukstr,last1);
write('� ����� �뢮���? ��ࠢ� - true: ');
readln(c);
vivod(ukstr,last1,c);
sort(ukstr);
write('� ����� �뢮���? ��ࠢ� - true: ');
readln(c);
vivod(ukstr,last1,c);
writeln('Done');
readkey;
end.

