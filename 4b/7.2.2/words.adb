with Ada.Text_IO; use Ada.Text_IO;
with Tries;
with Wordsearch;

procedure Words is

	procedure Read_Trie_From_File (T : in out Tries.Trie; Fn : String; Len : Integer) is
		S : String (1 .. 200);
		F : File_Type;
		Last : Integer;
	begin
		Open (F, In_File, Fn);
		loop
			Get_Line (F, S, Last);
			if Last = Len then
				Tries.Insert (T, S (S'First .. Last));
			end if;
			exit when End_Of_File (F);
		end loop;
		Close (F);
	end Read_Trie_From_File;

begin
	Read_Trie_From_File (Wordsearch.Six, "english-words/words6.txt", 6);
	Read_Trie_From_File (Wordsearch.Five, "words.txt", 5);
	Wordsearch.Search (1, 1, 1);
end Words;
