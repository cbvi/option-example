with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Option;

procedure Main
is
   package IO renames Ada.Text_IO;

   package Random is new Ada.Numerics.Discrete_Random (0 .. 1);
   package Integer_Option is new Option (Integer);

   function Get_Maybe return Integer_Option.Option
   is
      Maybe : Integer_Option.Option (Integer_Option.Just);
   begin
      Maybe.Value := 42;
      return Maybe;
   end Get_Maybe;

   This_Maybe : Integer_Option.Option;
begin
   This_Maybe := Get_Maybe;

   case This_Maybe.Match is
      when Integer_Option.Just =>
         IO.Put_Line (Integer'Image (This_Maybe.Value));
      when Integer_Option.Nothing =>
         IO.Put_Line ("Nothing");
   end case;
end Main;
