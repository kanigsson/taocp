with Ada.Text_IO; use Ada.Text_IO;
package body Wordsearch is

	type Words_Type is array (1 .. 6, 1 .. 5) of Character;

	Words : Words_Type := (others => (others => '0'));

	type TA is array (1 .. 6) of Tries.Node_Id;
	B : TA := (others => 1);

	Count : Integer := 0;

	procedure Debug (Line, Col : Integer) is
	begin
		Count := Count + 1;
		if Count mod 10000 /= 0 then
			return;
		end if;
		Put_Line (Line'Image & Col'Image);
		for L in 1 .. 6 loop
			for C in 1 .. Col loop
				if C < Col or else L <= Line then
					Put (Words (L, C));
				end if;
			end loop;
			New_Line;
		end loop;
		New_Line;
	end Debug;

	procedure Search (L, C : Integer; A : Tries.Node_Id) is
		fdb : Tries.Node renames Six.Data (A);
		sda : Tries.Node := Five.Data (B (L));
		use type Tries.Node_Id;
		old : Tries.Node_Id := B (L);
	begin
		--Debug (L, C);
		for Ch in fdb'Range loop
			if fdb (Ch) /= 0 and then sda (Ch) /= 0 then
				Words (L, C) := Ch;
				B (L) := sda (Ch);
				if L = 6 then
					if C = 5 then
						Debug (6, 5);
					else
						Search (1, C + 1, 1);
					end if;
				else
					Search (L + 1, C, fdb (Ch));
				end if;
			end if;
			B (L) := Old;
		end loop;
	end Search;

end Wordsearch;
