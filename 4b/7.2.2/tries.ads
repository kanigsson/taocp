package Tries is

	type Node_Id is range 0 .. 200000;
	subtype Valid_Node_Id is Node_Id range 1 .. 200000;
	subtype Letter is Character range 'a' .. 'z';
	type Node is array (Letter) of Node_Id;

	type Data_Type is array (Node_Id) of Node;

	type Trie is record
		Data : Data_Type := (others => (others => 0));
		Max : Valid_Node_Id := 1;
	end record;

	procedure Insert (T : in out Trie; S : String);

	function Mem (T : Trie; S : String) return Boolean;

	function Num_Elts (T : Trie) return Natural;

end Tries;
