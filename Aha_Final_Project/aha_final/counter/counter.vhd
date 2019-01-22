library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           direction : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is
signal count_s : std_logic_vector( 3 downto 0) := X"0";
begin
    process (clk, rst)
    begin
        if (rst = '1') then
            count_s <= "0000";
        elsif( rising_edge(clk)) then
            if (direction = '0') then
                count_s <= count_s + '1';
            else 
                count_s <= count_s - '1';
            end if;
        end if;
    end process;
count <= count_s;
end Behavioral;
