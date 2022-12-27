with Ada.Characters.Handling;

package body Tries is

	function Mem (S : String) return Boolean is
		function Aux (I : Integer; N : Node) return Boolean is
			C : Character renames Ada.Characters.Handling.To_Lower (S (I));
		begin
			if C not in Letter then
				return False;
			end if;
			if N (C) /= 0 then
				if I = S'Last then
					return True;
				else
					return Aux (I + 1, Data (N (C)));
				end if;
			else
				return False;
			end if;
		end Aux;
	begin
		if S'Length = 0 then 
			return True;
		end if;
		return Aux (S'First, Data (1));
	end Mem;

	procedure Insert (S : String) is
		procedure Aux (I : Integer; N : Node_Id) is
			No : Node renames Data (N);
			C : Character renames Ada.Characters.Handling.To_Lower (S (I));
		begin
			if C not in Letter then
				return;
			end if;
			if No (C) = 0 then
				Max := Max + 1;
				No (C) := Max;
			end if;
			if I < S'Last then
				Aux (I + 1, No (C));
			end if;
		end Aux;
	begin
		if S'Length = 0 then
			return;
		end if;
		Aux (S'First, 1);
	end Insert;

	function Num_Elts return Natural is
		Result : Natural := 0;

		procedure Aux (N : Node_Id; I : Integer) is
			No : Node renames Data (N);
		begin
			for C in No'Range loop
				if (No (C)) /= 0 then
					if I = 5 then
						Result := Result + 1;
					else
						Aux (No (C), I + 1);
					end if;
				end if;
			end loop;
		end Aux;

	begin
		Aux (1, 1);
		return Result;
	end Num_Elts;
end Tries;
