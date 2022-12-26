with Ada.Text_IO;
procedure Queens is
	procedure Run (R : Integer) is
		N : constant := 8;
		A : array (1 .. N) of Boolean;
		X : array (1 .. N) of Integer;
		B, C : array (1 .. 2 * N - 1) of Boolean;
		L, T : Integer;

		Count : Integer := 0;
		procedure Visit is
		begin
			Count := Count + 1;
		end Visit;
	begin
		<<B1>>
		L := 1; A := (others => False); B := (others => False); C := (others => False);
		<<B2>>
		if L > N then
			Visit;
			goto B5;
		else
			T := 1;
		end if;

		<< B3>>
		if L = R then
			L := L + 1;
			goto B2;
		elsif A (T) or else B (T + L -1) or else C (T - L + N) then
			goto B4;
		else
			A (T) := True; B (T + L -1) := True; C (T - L + N) := True; X (L) := T; L:= L + 1;
			goto B2;
		end if;

		<<B4>>
		if T < N then
			T := T + 1;
			goto B3;
		end if;

		<<B5>>
		L := L - 1;
		if L = R then
			L := L - 1;
		end if;
		if L > 0 then
			T := X (L); C (T - L + N) := False; B (T + L - 1) := False; A (T) := False;
			goto B4;
		end if;
	  Ada.Text_IO.Put_Line (Integer'image (Count));
	end Run;
begin
	for I in 1 .. 8 loop
		Run (I);
	end loop;
end Queens;