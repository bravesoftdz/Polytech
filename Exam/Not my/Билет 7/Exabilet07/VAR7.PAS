{�������� ����୮�� ��ॢ� �� �����஢����� ᯨ᪠ � 䠬���ﬨ � ����ࠬ�
�뢮� ᯨ᪠ "�����-��७�-�ࠢ��"
�뢮� ������ ����쥢 ᯨ᪠ �ࠢ� ������}

program bilet07;
uses crt;

type
    a= ^dan;
    dan=record
       fam: string[10];
       num: integer;
       left,rt: a;
    end;

procedure putree(var uk1: a;buf: a);  {ᮧ����� ��ॢ�}
var
uksp: a;
begin
if uk1=nil then begin     {�᫨ 㧫� �� ���, � ᮧ���� ���}
   new(uksp);             {� ������� �㤠 ����� ����}
   uksp^.fam:=buf^.fam;   {�, ����筮, ��������� ���}
   uksp^.num:=buf^.num;
   uksp^.left:=nil;
   uksp^.rt:=nil;
   uk1:=uksp;
   end
else begin                      {�᫨ �� 㧥� �������, � �ࠢ���}
     if buf^.num > uk1^.num then   {���� ������� ����� 㧫�����}
     putree(uk1^.rt,buf)           {�맮� �ࠢ��� ��⮬��}
     else                          {���� ����� 㧫�����}
     putree(uk1^.left,buf);        {�맮� ������ ��⮬��}
end;
end;

procedure gettree(var uk2: a;var f: text);  {�뢮� ��ॢ�}
begin
if uk2^.left<> nil then          {���� �஢�ઠ �� ����稥 � �뢮�}
gettree(uk2^.left,f);
writeln(f,uk2^.fam,' ',uk2^.num);
if uk2^.rt<> nil then
gettree(uk2^.rt,f);
end;

procedure vivodLIST(var uk3: a;var f: text);  {�뢮� ���� ����쥢}
begin
if uk3^.rt<>nil then              {��ࠢ� ��-� ����  -  �뢮���}
vivodLIST(uk3^.rt,f);
if (uk3^.left=nil) and (uk3^.rt=nil) then  {���� �� ����� ��������!!}
writeln(f,uk3^.fam,' ',uk3^.num);
if uk3^.left<>nil then           {����� ���� - �뢮��� ���}
vivodLIST(uk3^.left,f);
end;


var
uktree,temp: a;
f1: text;

begin
clrscr;
assign(f1,'vhod.inp');
reset(f1);
uktree:=nil;   {��ॢ� ���}
new(temp);                     {��⠥� �� �६����� �࠭���� �����}
while not eof(f1) do begin
readln(f1,temp^.fam,temp^.num);
putree(uktree,temp);          {� ��뢠�� � ����}
end;
close(f1);
assign(f1,'rez.out');
rewrite(f1);
gettree(uktree,f1);    {�뢮��� ��ॢ�}
writeln(f1);
writeln(f1,'������ �ࠢ� ������:');
writeln('Done');
vivodLIST(uktree,f1);  {�뢮��� ������}
close(f1);
readkey;
end.