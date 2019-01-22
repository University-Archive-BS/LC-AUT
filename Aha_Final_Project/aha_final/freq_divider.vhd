library ieee;
use ieee.std_logic_1164.all;

entity freq_divider is
    generic ( n : integer := 40000000; 
              m : integer := 1);            -- n must be the multiple of m
    port    ( in_freq   : in   std_logic;
              out_freq  : out  std_logic;
              reset     : in  std_logic);
end freq_divider;

architecture behavioral of freq_divider is
    signal step : std_logic;
    signal counter : integer range 0 to n/(m*2);

begin
	process (in_freq, reset) 
	begin
	   if reset = '0' then 
            step <= '0';
            counter <= 0;	   
	   elsif ( in_freq'event and in_freq = '1') then
			if (counter < n/(m*2)) then
				counter <= counter + 1;		
            else
				step <= not step;
				counter <= 1;
			end if;
		end if;
	end process;
    out_freq <= step;
end behavioral;


