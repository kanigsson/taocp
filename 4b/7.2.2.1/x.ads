with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package X is

   	type Item_Type is record
		Name : Unbounded_String;
		LLINK : Integer;
		RLINK : Integer;
	end record;

	type Item_Table is array (Natural range <>) of Item_Type;

	type Data_Type is record
		TOP, ULINK, DLINK : Integer;
	end record;

   type Data_Table is array (Natural range <>) of Data_Type;

   procedure Run (IT : in out Item_Table; DT : in out Data_Table);

end X;
