{�������� ����吝��� ᯨ᪠ �� ����ࠬ, ��⠢��� ��ப� � �㦭�� ���� �
����� �⥭�� �� 䠩��.
����祭�� ����� ����� � �㦭�� ���� � ᯨ᪥
���� ����� �� �������� � �����
�뢮� ᯨ᪠ � 2 ���ࠢ�����}

program var19;
uses crt;

type
    a = ^dan;
      dan = record
      num: integer;
      author: string;
      name: string;
      year: string;
      cost: string;
      sled: a;
      pred: a;
      end;

procedure form(var head,ass: a);
var
ukzv,this: a;
f: text;
before: a;
i,j: integer;
str: string;
begin
assign(f,'vhod.inp');
reset(f);
{������� ���� � ��᫥���� �������� ����묨}
new(ukzv);
ukzv^.pred:=nil;
head:=ukzv;
before:=ukzv;
new(ukzv^.sled);
ukzv:=ukzv^.sled;
ukzv^.sled:=nil;
{��稭��� ���� ����� �� ᯨ᪠}
while not eof(f) do begin
readln(f,str); {��⠥� ���� ������ ��� ��ப�}
new(this);
i:=1;
this^.num:=0;
while str[i] <> ' ' do begin {����� ���� ��ॢ�� � �᫮ �� ��ப�}
this^.num:=this^.num*10+ord(str[i])-48;
i:=i+1;
end;
i:=i+1; {���室�� � �����}
j:=i;
while str[j]<>' ' do {��室�� ����, ��� ���� ���砥���}
j:=j+1;
this^.author:=copy(str,i,j-i); {�����㥬 �������� ᨬ����� � ���� ᯨ᪠}
i:=j+1; {���室�� � �������� � �����塞 ���㪠������, ��� � ���஬}
j:=i;
while str[j]<>' ' do
j:=j+1;
this^.name:=copy(str,i,j-i); {��� ⮦� ����஢����}
i:=j+1; {���室 �� �⥭�� ����}
j:=i;
while str[j]<>' ' do
j:=j+1;
this^.year:=copy(str,i,j-i); {���� ����஢����}
i:=j+1;
this^.cost:=copy(str,i,length(str)-i+1); {�����㥬 ��⠢訥�� ᨬ���� � ���� 業�}

{�饬 ���� ��� ��⠢�� ����� �����. ���� ���� �� ��᫥����� �����⮣�
�������, � �᫨ ��諨 ⠪�� �������, �� ᫥���騩 �� ��� �� ������
����� ������, � ��⠭����������.}
ukzv:=head;
while (ukzv^.sled^.sled<>nil) and (ukzv^.sled^.num < this^.num) do
ukzv:=ukzv^.sled;
{���� ��७�ᨬ ��� 㪠��⥫�. ����騩 㪠�뢠�� ⥯��� ᫥��� �� ����,
� ���� ᫥��� 㪠�뢠�� �� ���⮪ ᯨ᪠}
this^.sled:=ukzv^.sled;
ukzv^.sled:=this;
end;

{���⠢�� 㪠��⥫� �� ����� ���冷� � �������� ��᫥���� ���⮩}
ukzv:=head^.sled;
before:=head;
while ukzv<>nil do begin
ukzv^.pred:=before;
before:=ukzv;
ukzv:=ukzv^.sled;
end;
ass:=before;
close(f);
end;

{��楤�� ��⠢�� ����� �����. ����� �� �� ������, �� � ��
�ନ஢���� ᯨ᪠, ����� ��⠢�﫨 �� ����� ���� ���� �������}
procedure newelem(var head:a);
var
mem,ukzv: a;
i,j: integer;
str: string;
begin
writeln('������ ���� �����: (�஡��� � �������� ࠧ����� ������ _ )');
readln(str);
{������� �祩�� � ����� ����� � �⠥� �������筮 �⥭�� ���}
new(mem);
i:=1;
mem^.num:=0;
while str[i] <> ' ' do begin
mem^.num:=mem^.num*10+ord(str[i])-48;
i:=i+1;
end;
i:=i+1;
j:=i;
while str[j]<>' ' do
j:=j+1;
mem^.author:=copy(str,i,j-i);
i:=j+1;
j:=i;
while str[j]<>' ' do
j:=j+1;
mem^.name:=copy(str,i,j-i);
i:=j+1;
j:=i;
while str[j]<>' ' do
j:=j+1;
mem^.year:=copy(str,i,j-i);
i:=j+1;
mem^.cost:=copy(str,i,length(str)-i+1);

{�஢���� ���� ���� ��� ��⠢�� ������ �������, ��� ��� � ��楤�� ���}
ukzv:=head;
while (ukzv^.sled^.sled<>nil) and (ukzv^.sled^.num < mem^.num) do
ukzv:=ukzv^.sled;
{���塞 ⠪ �� ���⠬�, �� �������� ��७����祭�� 㪠��⥫�� �� �।���.}
mem^.sled:=ukzv^.sled;
mem^.pred:=ukzv;
ukzv^.sled:=mem;
ukzv:=mem^.sled;
ukzv^.pred:=mem;
end;

{����� �஡�� �� ����� �������. + ���� �� ��ࠪ�}
procedure poisk(head,ass: a);
var
ukzv:a;
i: integer;
avtor,nazv: string;
f: text;
begin
assign(f,'out.out');
append(f);
writeln('����� �㤥� �᪠�� �����');
write('������ �������� �����: ');
readln(nazv);
write('������ ���� �����: ');
readln(avtor);
i:=1;
{�᫨ ��ࢠ� �㪢� ���� �� � �� �, � ���� ���� ᫥��}
if avtor[1] <= 'K' then begin
ukzv:=head^.sled;
while ukzv^.sled <> nil do begin
{�᫨ ��諨 - ���� ����⢨�. �믨�뢠�� � 䠩� �����}
if (ukzv^.author = avtor) and (ukzv^.name = nazv) then begin
writeln('��� ����� �������. ��� ',i,' ᫥�� � ᯨ᪥');
writeln(f,'�� �᪠�� � ��諨 ����� - ',ukzv^.name);
write(f,'���� - ',ukzv^.cost,'rub');
writeln(f,'��� ������� - ',ukzv^.year);
i:=0;
break; end; {� ���砥� 横� ���᪠}
i:=i+1;
ukzv:=ukzv^.sled;
end;
{�᫨ �� ��諨, � �뢥��� ᮮ�饭��}
if i<>0 then writeln(f,'����� ����� ���');
end;
{�᫨ ���� � L-Z, � ���� �ࠢ� �������筮}
if avtor[1] > 'K' then begin
ukzv:=ass^.pred;
while ukzv^.pred <> nil do begin
if (ukzv^.author = avtor) and (ukzv^.name = nazv) then begin
writeln('��� ����� �������. ��� ',i,' �ࠢ� � ᯨ᪥');
writeln(f,'�� �᪠�� � ��諨 ����� - ',ukzv^.name);
write(f,'���� - ',ukzv^.cost,'rub ');
writeln(f,'��� ������� - ',ukzv^.year);
i:=0;
break; end;
i:=i+1;
ukzv:=ukzv^.pred;
end;
if i<>0 then writeln(f,'����� ����� ���');
end;
writeln('Done');
writeln(f,' ');
close(f);
end;

{��楤�� �뢮�� � �롮஬ ���ࠢ�����}
procedure vivod(head,ass: a);
label 1;
var
ukzv: a;
co: string;
f: text;
begin
assign(f,'out.out');
append(f);
writeln(f,'Data:');
1: writeln('�㤠 �뢮���? right or left?');
readln(co);
if (co <> 'right') and (co <> 'left') then begin
writeln('�訡�窠 � �롮஬, ���. Go again');
goto 1;
end;
{�뢮� ��ࠢ�. ���� � ������}
if co = 'right' then begin
ukzv:=head^.sled;
while ukzv^.sled <> nil do begin
write(f,ukzv^.num,' ');
write(f,ukzv^.author,' ',ukzv^.name,' ');
writeln(f,ukzv^.year,' ',ukzv^.cost);
ukzv:=ukzv^.sled;
end;
writeln('Done');
end;
{�뢮� ����� - ���� � ����}
if co = 'left' then begin
ukzv:=ass^.pred;
while ukzv^.pred <> nil do begin
write(f,ukzv^.num,' ');
write(f,ukzv^.author,' ',ukzv^.name,' ');
writeln(f,ukzv^.year,' ',ukzv^.cost);
ukzv:=ukzv^.pred;
end;
writeln('Done');
end;
writeln(f);
close(f);
end;

var
ukstr,last: a;
uksp: a;
i: integer;
f1: text;

begin
clrscr;
{��� �� �᭮:) }
assign(f1,'out.out');
rewrite(f1);
close(f1);
form(ukstr,last);
writeln('���᮪ ���� ᮧ���');
vivod(ukstr,last);
newelem(ukstr);
vivod(ukstr,last);
poisk(ukstr,last);
vivod(ukstr,last);
readkey;
end.