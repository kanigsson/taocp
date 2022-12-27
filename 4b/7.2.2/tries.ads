package Tries is

	type Node_Id is range 0 .. 200000;
	subtype Valid_Node_Id is Node_Id range 1 .. 200000;
	subtype Letter is Character range 'a' .. 'z';
	type Node is array (Letter) of Node_Id;

	type T is array (Node_Id) of Node;

	Data : T := (others => (others => 0));
	Max : Valid_Node_Id := 1;

	procedure Insert (S : String);

	function Mem (S : String) return Boolean;

	function Num_Elts return Natural;

end Tries;
