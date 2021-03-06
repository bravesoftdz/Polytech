type
List = ^TList;
	TList = record
		num:integer;
		fam:string[10];
		left, right:List;
	end;

{�����ᨢ��� ����������}
procedure P1(var Tree:List;num:integer; fam:string); {�室�� ��ࠬ���� - ���� ���� ��ॢ� � ������ ������� }
begin
 if not Assigned(tree) then  {�᫨ ��ॢ� ���⮥ � ᮧ��� ��� ��७�}
   begin
     New(tree);   {�뤥�塞 ������ }
     Tree^.num:=num;     {������塞 ����� }
     Tree^.fam:=fam;    {������塞 ����� }
     Tree^.left:=nil;     {����塞 㪠��⥫� �� ������ }
     Tree^.right:=nil;  {� �ࠢ��� �뭮��� }
      exit;
   end;
 if num < Tree^.num then   {��� � ������ ��� �ࠢ��� �����ॢ� �� ����� �� ��������� �������}
     P1(Tree^.left,num,fam)  {�᫨ ����� ���� � � ����� �����ॢ� }
  else
    P1(Tree^.right,num,fam);  {�᫨ ����� � � �ࠢ��}
end;	

{���⨢��� ���������� (�� �������� ��� �⮩ �ணࠬ��, �������� ᠬ�� �� ��������, �᫨ �㦭�)}
{procedure P1(first: list; strok:string);
var	tree:list; i:byte;
	str: char;
begin
i:=1;
	while i<length(strok) do
	begin
		tree:= first;
		inc(i);
		str:=strok[i];
		while true do
		begin
			if ord(str) >= ord(tree^.data) then
			begin 
				if tree^.right <> nil then tree:=tree^.right
				else
				begin
					new(tree^.right);
					tree^.right^.data:=str;
					tree^.right^.left:=nil;
					tree^.right^.right:=nil;
					break;
				end;
			end
			else
			begin
				if tree^.left <> nil then tree:=tree^.left
				else
				begin
					new(tree^.left);
					tree^.left^.data:=str;
					tree^.left^.left:=nil;
					tree^.left^.right:=nil;
					break;
				end;
			end;
		end;
	end;
end;}

procedure P2(const name:string; tree: list);
var output:text;
begin
if tree=nil then
	begin
	Writeln(output,'��ॢ� �� �������.');
	exit;  
end;
Assign(output, name);
Append(output); {��������� 䠩�, � �� ��१������}
Writeln(output, tree^.num,' ',tree^.fam);
close(output);
	if tree^.left <> nil then P2(name, tree^.left);
	if tree^.right <> nil then P2(name, tree^.right);
end;

{procedure P3(const name:string; tree: list);
var output:text;
begin
if tree=nil then
	begin
	Writeln(output,'��ॢ� �� �������.');
	exit;  
end;
Assign(output, name);
Append(output);
if (tree^.left = nil) and (tree^.right = nil) then Writeln(output, tree^.num,' ',tree^.fam);
close(output);
	if tree^.left <> nil then P3(name, tree^.left);
	if tree^.right <> nil then P3(name, tree^.right);
end;}

procedure P3(const name:string; tree: list);  {�뢮� ���� ����쥢}
begin
if tree^.right<>nil then              {��ࠢ� ��-� ����  -  �뢮���}
P3(name,tree^.right);
if (tree^.left=nil) and (tree^.right=nil) then  {���� �� ����� ��������!!}
begin
	Assign(output, name);
	Append(output); {��������� 䠩�, � �� ��१������}
	writeln(output, tree^.num,' ',tree^.fam);
	close(output);
end;
if tree^.left<>nil then           {����� ���� - �뢮��� ���}
P3(name,tree^.left);
end;

var nach:List; data:TList; input:text;
	name:string;
	i,D:longint;
begin
Assign(input,'B7_F1.IN');
Reset(input);
Writeln('����쪮 ��ப 䠩�� ������?'); Readln(D);
for i:=1 to D do
begin
if not EoF(input) then 
with data do Readln(input, num, fam) else begin
 Writeln('���������� ������ ',D,'-�� ����� 䠩��.');
 Writeln;
 Writeln('���� �����稫��. ��᫥���� ���⠭��� ��ப�� �뫠 ',(i-1),'-��.');
 Writeln;
 Writeln('������ Enter, �⮡� �த������...'); Readln;
 break;
end;
with data do
 P1(nach, num, fam);
end;
close(input);
Write('������ �������� ��室���� 䠩�� ��� ��楤�� P2 � P3: '); Readln(name);
Assign(output,name);
Rewrite(output);
Writeln(output,'��砫� P2');
close(output);
P2(name,nach);
Assign(output,name);
Append(output);
Writeln(output);
Writeln(output,'��砫� P3');
close(output);
P3(name,nach);
end.