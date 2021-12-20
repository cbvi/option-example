generic
   type T is private;
package Option is

   type State is (Just, Nothing);

   type Option (Match : State := Nothing) is record
      case Match is
         when Just =>
            Value : T;
         when Nothing =>
            null;
      end case;
   end record;

end Option;


