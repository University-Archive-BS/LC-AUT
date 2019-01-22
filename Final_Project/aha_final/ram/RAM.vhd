library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SYNCSRAM is
   generic(W   	 : natural:= 22;    -- width=W
           N   	 : natural:= 7;	  -- depth=2**N
			  D   	 : natural:= 12);   -- 
				
   port( clk   	 :	in  std_logic; -- clock
         rst  		 : in  std_logic;
         cs  		 :	in  std_logic; -- chip select
         -- read/write control
         pass_rw   : in  std_logic; -- read=0/write=1
         admin_rw  : in  std_logic;
         lock_rw   : in  std_logic;
         count_rw  : in  std_logic;
         -- address
         addr 		 :	in  std_logic_vector(D-1 downto 0); -- address
         -- input data
         pass_in   : in  std_logic_vector(W-1 downto 6);
         count_in  : in  std_logic_vector(5 downto 2);
		   admin_in  : in  std_logic;
		   lock_in   : in  std_logic;
		     -- output data
         pass_out  : out std_logic_vector(W-1 downto 6); -- data
         count_out : out std_logic_vector(5 downto 2); -- user try count
	     	admin_out : out std_logic;
	     	lock_out  : out std_logic);
end entity SYNCSRAM;

architecture RTL of SYNCSRAM is
   type mem_array is array (1 to 2**N) of std_logic_vector(W-1 downto 0);
   signal ram : mem_array;
   signal binary_address : integer range 1 to 128;
begin
   binary_address <= ((100*conv_integer(addr(D-1 downto D-4))) + (10*conv_integer(addr(D-5 downto D-8)))+(conv_integer(addr(D-9 downto D-12))));
   process
   
   begin
   
      wait until rising_edge(clk);
	   if(rst = '1')then
	       ram(1) <= "0001000100010001000010";
      else	  
			if cs = '1' then
				if pass_rw = '1' then
					ram(binary_address)(W-1 downto 6) <= pass_in;
				else
					pass_out <= ram(binary_address)(W-1 downto 6);
				end if;
				
				if count_rw = '1' then
					ram(binary_address)(5 downto 2) <= count_in;
				else
					count_out <= ram(binary_address)(5 downto 2);
				end if;
				
				if admin_rw = '1' then
					ram(binary_address)(1) <= admin_in;
				else
					admin_out <= ram(binary_address)(1);
				end if;
				
				if lock_rw = '1' then
					ram(binary_address)(0) <= lock_in;
				else
					lock_out <= ram(binary_address)(0);
				end if;
			else
				pass_out  <= (others => 'Z');
				lock_out  <= 'Z';
				admin_out <= 'Z';
				count_out <= "ZZZZ";
			end if;
      end if;
   end process;
end RTL;