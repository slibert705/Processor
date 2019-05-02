library ieee;
use ieee.std_logic_1164.all;

entity reg is
generic(N: positive := 4);
port(
	D: 		in std_logic_vector(N-1 downto 0);
	LD,RST,CLK: in std_logic;
	Q: 		out std_logic_vector(N-1 downto 0)
);
end entity reg;

--circuit description
architecture BEHAVIORAL of REG is
begin
	MEMORY: process(CLK, RST, LD)--Process means something in time(synchronous)
	begin 
		if rising_edge(CLK) then
			if RST='1' then Q<=(others => '0');
			elsif LD='1' then Q<=D;
			end if;
		end if;
	end process memory;
	
end architecture BEHAVIORAL;
