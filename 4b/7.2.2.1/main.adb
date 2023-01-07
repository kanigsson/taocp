with X; use X;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   A : Item_Table := (0 => (To_Unbounded_String (""), 7, 1),
                      1 => (To_Unbounded_String ("a"), 0, 2),
                      2 => (To_Unbounded_String ("b"), 1, 3),
                      3 => (To_Unbounded_String ("c"), 2, 4),
                      4 => (To_Unbounded_String ("d"), 3, 5),
                      5 => (To_Unbounded_String ("e"), 4, 6),
                      6 => (To_Unbounded_String ("f"), 5, 7),
                      7 => (To_Unbounded_String ("g"), 6, 0));
   B : Data_Table :=
     (0  => ( 0,  0,  0),
      1  => ( 2, 20, 12),
      2  => ( 2, 24, 16),
      3  => ( 2, 17, 9),
      4  => ( 3, 27, 13),
      5  => ( 2, 28, 10),
      6  => ( 2, 22, 18),
      7  => ( 3, 29, 14),
      8  => ( 0,  0, 10),
      9  => ( 3,  3, 17),
      10 => ( 5,  5, 28),
      11 => (-1,  9, 14),
      12 => ( 1,  1, 20),
      13 => ( 4,  4, 21),
      14 => ( 7,  7, 25),
      15 => (-2, 12, 18),
      16 => ( 2,  2, 24),
      17 => ( 3,  9,  3),
      18 => ( 6,  6, 22),
      19 => (-3, 16, 22),
      20 => ( 1, 12,  1),
      21 => ( 4, 13, 27),
      22 => ( 6, 18,  6),
      23 => (-4, 20, 25),
      24 => ( 2, 16,  2),
      25 => ( 7, 14, 29),
      26 => (-5, 24, 29),
      27 => ( 4, 21,  4),
      28 => ( 5, 10,  5),
      29 => ( 7, 25,  7),
      30 => (-6, 27,  0));
begin
   Run (A, B);
end Main;
