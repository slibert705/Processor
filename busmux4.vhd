library ieee;
use ieee.std_logic_1164.all;

--Strong 1,0
--Weak 1,0
--Conflict
--Unknown


--Entity means schematic block symbol
entity BUSMUX4 is
generic(N: positive := 8);
port(
	D3,D2,D1,D0: in std_logic_vector(N-1 downto 0);
	S: in std_logic_vector(1 downto 0);
	Y: out std_logic_vector(N-1 downto 0)
);
end entity BUSMUX4;

--circuit description
architecture DATAFLOW of BUSMUX4 is 
begin

	--mux
	with s select
	Y <= D3 when b"11",
	D2 when b"10",
	D2 when b"01",
	D0 when others;
	

end architecture;