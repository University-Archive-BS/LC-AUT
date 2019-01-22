library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compare is
  generic (W : natural := 8);
  Port (
        a, b : in std_logic_vector(W-1 downto 0);
         result : out boolean );
end compare;

architecture RTL of compare is

begin

process (a, b)
begin
    if(a = b) then
        result <= TRUE;
    else
        result <= FALSE;
    end if;
end process;
end RTL;
