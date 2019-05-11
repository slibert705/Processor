library ieee;
use ieee.std_logic_1164.all;

entity REG10 is
port(
	D: 		in std_logic_vector(9 downto 0);
	LD,RST,CLK: in std_logic;
	Q: 		out std_logic_vector(31 downto 0)
);
end entity REG10;

--circuit description
architecture BEHAVIORAL of REG10 is
begin
	MEMORY: process(CLK, RST, LD)--Process means something in time(synchronous)
	begin 
		if RST='0' then Q<=(others => '0');
		elsif rising_edge(CLK) then
			if LD='1' then Q<=B"00000_00000_00000_00000_00"&D;
			end if;
		end if;
	end process memory;
	
end architecture BEHAVIORAL;
