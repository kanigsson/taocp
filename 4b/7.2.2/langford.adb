with Ada.Text_IO;
procedure Langford is
	N : constant := 7;
	subtype Elts is Integer range -N .. N;
	subtype Pos_Elts is Elts range 0 .. N;
	X : array (1 .. 2 * N) of Elts;
	P : array (0 .. N) of Pos_Elts;
	Y : array (1 .. 2 * N) of Elts;
	J, K, L : Integer;

	procedure Visit is
	begin
		--Ada.Text_IO.Put_Line ("visit: " & X'Image);
		null;
	end Visit;

	procedure Debug (S : String) is
	begin
		--Ada.Text_IO.Put_Line (S & ": " & X'Image & P'Image & L'Image & J'Image & K'Image & L'Image);
		Ada.Text_IO.Put_Line (S & ": " & J'Image & K'Image & P'Image);
	end Debug;
begin
	<<L1>>
	X := (others => 0);
	L := 1;
	for I in 0 .. N - 1 loop
		P (I) := I + 1;
	end loop;
	P (N) := 0;

	<< L2>>
	K := P (0);
	if K = 0 then
		Visit;
		goto L5;
	else
		J := 0;
		while X (L) < 0 loop
			L := L + 1;
		end loop;
	end if;

	<< L3 >>
	Debug("L3");
	if L + K + 1 > 2 * N then
		goto L5;
	elsif X (L + K + 1) = 0 then
		X (L) := K;
		X (L + K + 1) := -K;
		Y (L) := J;
		P (J) := P (K);
		L := L + 1;
		goto L2;
	end if;

	<< L4 >>
	J := K;
	K := P (J);
	if K /= 0 then
		goto L3;
	end if;

	<< L5 >>
	Debug("L5");
	L := L - 1;
	if L > 0 then
		while X (L) < 0 loop
			L := L - 1;
		end loop;
		K := X (L);
		X (L) := 0;
		X (L + K + 1) := 0;
		J := Y (L);
		P (J) := K;
		goto L4;
	end if;
end Langford;
