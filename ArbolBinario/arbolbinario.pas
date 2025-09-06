program arbolbinario;
type
  PNode = ^TNode;
  TNode = record
    key: LongInt;
    L, R: PNode;
  end;

procedure Insert(var root: PNode; x: LongInt);
begin
  if root = nil then begin
    New(root); root^.key := x; root^.L := nil; root^.R := nil;
  end
  else if x < root^.key then Insert(root^.L, x)
  else Insert(root^.R, x);
end;

procedure PreOrder(t: PNode);
begin
  if t = nil then exit;
  Write(t^.key, ' ');
  PreOrder(t^.L);
  PreOrder(t^.R);
end;

procedure InOrder(t: PNode);
begin
  if t = nil then exit;
  InOrder(t^.L);
  Write(t^.key, ' ');
  InOrder(t^.R);
end;

procedure PostOrder(t: PNode);
begin
  if t = nil then exit;
  PostOrder(t^.L);
  PostOrder(t^.R);
  Write(t^.key, ' ');
end;

var
  n, i, x: LongInt; root: PNode;
begin
  root := nil;
  Write('Numero de nodos: '); ReadLn(n);
  Writeln('Nodos a insertar:');
  for i := 1 to n do begin Read(x); Insert(root, x); end;

  Writeln; Write('Preorden: ');  PreOrder(root);  Writeln;
  Write('Inorden: ');  InOrder(root);   Writeln;
  Write('Postorden: '); PostOrder(root); Writeln;
end.
