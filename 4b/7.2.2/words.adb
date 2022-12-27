with Ada.Text_IO; use Ada.Text_IO;
with Tries;

procedure Words is
	S : String (1 .. 200);
	F : File_Type;
	Last : Integer;
	Count : Integer := 0;

	procedure Read_Trie is
	begin
		Open (F, In_File, "english-words/words.txt");
		loop
			Get_Line (F, S, Last);
			if Last = 6 then
				Count := Count + 1;
				Tries.Insert (S (S'First .. Last));
			end if;
			exit when End_Of_File (F);
		end loop;
		Put_Line (Count'Image);
		Put_Line (Tries.Num_Elts'Image);
	Put_Line (Tries.Max'Image);
	end Read_Trie;

	procedure Read_Words is
	begin
	end Read_Words;
begin
	Read_Trie;
end Words;
