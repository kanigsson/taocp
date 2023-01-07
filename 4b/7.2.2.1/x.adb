with Ada.Text_IO;
package body X is

   Debug_Out : Boolean := False;

   procedure Debug (S : String) is
   begin
      if Debug_Out then
         Ada.Text_IO.Put_Line (S);
      end if;
   end Debug;

	procedure Run (IT : in out Item_Table; DT : in out Data_Table) is

      function RLINK (I : Integer) return Integer is (IT (I).RLINK);
      function LLINK (I : Integer) return Integer is (IT (I).LLINK);
      function DLINK (I : Integer) return Integer is (DT (I).DLINK);
      function ULINK (I : Integer) return Integer is (DT (I).ULINK);
      function TOP (I : Integer) return Integer is (DT (I).TOP);
      function LEN (I : Integer) return Integer is (DT (I).TOP);

      type Result_Type is array (Integer range <>) of Integer;

      procedure Print_Node (X : Integer) is
         Q: Integer;
      begin
         Q := X;
         loop
            Ada.Text_IO.Put (To_String (IT (TOP (Q)).Name));
            Q := Q + 1;
            if TOP (Q) <= 0 then
               Q := ULINK (Q);
            end if;
            exit when X = Q;
         end loop;
         Ada.Text_IO.New_Line;
      end Print_Node;

      procedure Visit (R : Result_Type) is
      begin
         Ada.Text_IO.Put ("SOLUTION  ");
         for X in R'Range loop
            Print_Node (R (X));
         end loop;
      end Visit;

      procedure Hide (P : Integer) is
         Q : Integer;
         X, U, D : Integer;
      begin
         Debug ("Hide " & P'Img);
         Q := P + 1;
         while Q /= P loop
            X := TOP (Q);
            U := ULINK (Q);
            D := DLINK (Q);
            if X <= 0 then
               Q := U;
            else
               DT (U).DLINK := D;
               DT (D).ULINK := U;
               DT (X).TOP := LEN (X) - 1;
               Q := Q + 1;
            end if;
         end loop;
      end Hide;

      procedure Cover (I : Integer) is
         P : Integer := DLINK (I);
         L, R : Integer;
      begin
         Debug ("Cover " & I'Img);
         while P /= I loop
            Hide (P);
            P := DLINK (P);
         end loop;
         L := LLINK (I);
         R := RLINK (I);
         IT (L).RLINK := R;
         IT (R).LLINK := L;
      end Cover;

      procedure Unhide (P : Integer) is
         Q, X, U, D : Integer;
      begin
         Debug ("Unhide " & P'Img);
         Q := P - 1;
         while Q /= P loop
            X := TOP (Q);
            U := ULINK (Q);
            D := DLINK (Q);
            if X <= 0 then
               Q := D;
            else
               DT (U).DLINK := Q;
               DT (D).ULINK := Q;
               DT (X).TOP := LEN (X) + 1;
               Q := Q - 1;
            end if;
         end loop;
      end Unhide;

      procedure Uncover (I : Integer) is
         L, R, P : Integer;
      begin
         Debug ("Uncover " & I'Img);
         L := LLINK (I);
         R := RLINK (I);
         IT (L).RLINK := I;
         IT (R).LLINK := I;
         P := ULINK (I);
         while P /= I loop
            Unhide (P);
            P := ULINK (P);
         end loop;
      end Uncover;


      I, J, L, N, P, Z : Integer;
      X : Result_Type (0 .. 100);
   begin
      << X1 >>
      Debug ("X1");
      pragma Assert (IT'First = 0);
      pragma Assert (DT'First = 0);
      N := IT'Last;
      Z := DT'Last;
      L := 0;

      <<X2 >>
      Debug ("X2");
      if RLINK (0) = 0 then
         pragma Warnings (Off, "before it has a value");
         Visit ( X (0 .. L - 1));
         pragma Warnings (On, "before it has a value");
         goto X8;
      end if;

      << X3 >>
      --  TODO choose the element based on MRV heuristics
      I := RLINK (0);
      Debug ("X3: I = " & I'Img);


      << X4 >>
      Cover (I);
      X (L) := DLINK (I);

      << X5 >>
      if X (L) = I then
         goto X7;
      end if;
      P := X (L) + 1;
      while P /= X (L) loop
         J := TOP (P);
         if J <= 0 then
            P := ULINK (P);
         else
            Cover (J);
            P := P + 1;
         end if;
      end loop;
      L := L + 1;
      goto X2;

      << X6>>
      P := X (L) - 1;
      while P /= X (L) loop
         J := TOP (P);
         if J <= 0 then
            P := DLINK (P);
         else
            Uncover (J);
            P := P - 1;
         end if;
      end loop;
      I := TOP (X (L));
      X (L) := DLINK (X (L));
      goto X5;

      << X7 >>
      Uncover (I);

      << X8 >>
      if L = 0 then
         return;
      else
         L := L - 1;
         goto X6;
      end if;
   end Run;

end X;
