{�������� ���筮�� ��㭠�ࠢ������� ᯨ᪨ �� ����ᥩ "������� �����"
�뢮� �⮣� ᯨ᪠ � �������� ���ࠢ�����
�������� 2�� �������ࠢ������ ᯨ᪮� �� �⮣�, ��� ���� ���� �� �����⠭��
����஢, � ��ன �� ��䠢���. �뢥��}

program bilet5;
uses crt;

type
    a = ^dan;
    dan = record
        fam: string;
        num: integer;
        sled,pred:a;
        end;

{��ନ�㥬 ᯨ᮪ �� 䠩��}
procedure form(var head,ass: a);
var
ukzv,before: a;
str: string;
i,j: integer;
f: text;
begin
assign(f,'vhod.inp');
reset(f);
new(ukzv);      {���� ���⮩}
ukzv^.pred:=nil;
head:=ukzv;
before:=ukzv;
while not eof(f) do begin   {�⥭�� ������ ������� �����⬮� ����}
new(ukzv^.sled);
ukzv:=ukzv^.sled;
ukzv^.pred:=before; {����⠢��� 㪠��⥫�}
before:=ukzv;
readln(f,str);    {��⠥� �� 䠩�� ��ப� � �⤥���� ��६�����}
i:=1;
while str[i] <> ' ' do  {��⠥� ����� 䠬����}
i:=i+1;
ukzv^.fam:=copy(str,1,i-1); {��⠢�塞 䠬���� � ���� ������� ᯨ᪠}
i:=i+1;
ukzv^.num:=0;
while i<=length(str) do begin          {��⠥� ���祭�� ����� � ��⥦��}
ukzv^.num:=ukzv^.num*10+ord(str[i])-48;
i:=i+1;
end;
end;
new(ukzv^.sled);   {��᫥���� ���⮩}
ukzv:=ukzv^.sled;
ukzv^.pred:=before;
ass:=ukzv;          {��᫥���� 㪠��⥫� �� ����� - ��������� ���}
ukzv^.sled:=nil;
close(f);
end;

procedure vivod(head,ass: a);
var
ukzv: a;
f: text;
co: char;
begin
assign(f,'out.out');
append(f);
writeln('�㤠 �뢮���? 2 - ��ࠢ�, �� ��⠫쭮� - �����');
readln(co);
if co = '2' then begin      {���⮩ �뢮� ��ࠢ�}
ukzv:=head^.sled;
while ukzv^.sled <> nil do begin
writeln(f,ukzv^.num,' ',ukzv^.fam);
ukzv:=ukzv^.sled;
end;
end
else begin       {���⮩ �뢮� �����}
ukzv:=ass^.pred;
while ukzv^.pred <> nil do begin
writeln(f,ukzv^.num,' ',ukzv^.fam);
ukzv:=ukzv^.pred;
end;
end;
writeln('Done');
writeln(f);
close(f);
end;

{��ନ஢���� 2�� ᯨ᪮� �� ������}
procedure spis2(head:a);
var
ukzv,beg1,beg2,golova1,golova2: a;  {�㦭� 㪠��⥫� ��� ᮧ�����}
min,work,temp: a;    {�㦭� ��� ���஢��}
f: text;
begin
assign(f,'out.out');
append(f);
writeln(f);
new(beg1);            {���� ����� ᤥ����}
golova1:=beg1;
new(beg2);
golova2:=beg2;
ukzv:=head^.sled;

while ukzv^.sled <> nil do begin     {�����뢠�� ��������� � ��� ����}
new(beg1^.sled); beg1:=beg1^.sled;   {�� ᯨ᪠-�।��}
new(beg2^.sled); beg2:=beg2^.sled;
beg1^.num:= ukzv^.num; beg1^.fam:=ukzv^.fam;
beg2^.num:= ukzv^.num; beg2^.fam:=ukzv^.fam;
ukzv:=ukzv^.sled;
end;
new(beg1^.sled); beg1:=beg1^.sled;   {������ ��᫥���� �����}
new(beg2^.sled); beg2:=beg2^.sled;
beg1^.sled:=nil; beg2^.sled:=nil;

{����஢�� 1��� ᯨ᪠ �� ����� ���ଠ樥� �롮஬}
beg1:=golova1^.sled;
while beg1^.sled^.sled<> nil do begin
ukzv:=beg1;
min:=ukzv;
work:=ukzv;
while ukzv^.sled <> nil do begin
if ukzv^.num < min^.num then     {�饬 ��������}
min:=ukzv;
ukzv:=ukzv^.sled;
end;
if min <> work then begin    {����� ���� ��࠭���� � �������쭮��}
temp^.num:=min^.num; temp^.fam:=min^.fam;
min^.num:=work^.num; min^.fam:=work^.fam;
work^.num:=temp^.num; work^.fam:=temp^.fam;
end;
beg1:=beg1^.sled;
end;

{�������筮 - �� 䠬����}
beg2:=golova2^.sled;
while beg2^.sled^.sled<> nil do begin
ukzv:=beg2;
min:=ukzv;
work:=ukzv;
while ukzv^.sled <> nil do begin
if ukzv^.fam < min^.fam then
min:=ukzv;
ukzv:=ukzv^.sled;
end;
if min <> work then begin
temp^.num:=min^.num; temp^.fam:=min^.fam;
min^.num:=work^.num; min^.fam:=work^.fam;
work^.num:=temp^.num; work^.fam:=temp^.fam;
end;
beg2:=beg2^.sled;
end;

{����� �뢮� ����� ᯨ᪮�}
beg1:=golova1^.sled;
while beg1^.sled <> nil do begin
writeln(f,beg1^.num,' ',beg1^.fam);
beg1:=beg1^.sled;
end;
writeln(f);
beg2:=golova2^.sled;
while beg2^.sled <> nil do begin
writeln(f,beg2^.fam,' ',beg2^.num);
beg2:=beg2^.sled;
end;
writeln(f);
close(f);
end;

var
ukstr,last,uksp: a;
f1: text;

begin
clrscr;
assign(f1,'out.out');  {���砫� ���⨬ ���� �����}
rewrite(f1);
close(f1);
form(ukstr,last);
vivod(ukstr,last);
spis2(ukstr);
readkey;
end.