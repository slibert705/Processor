library ieee;
use ieee.std_logic_1164.all;

--Entity means schematic block symbol
entity DECODER is
port(
	WRADDR: in std_logic_vector(1 downto 0);
	LD: in std_logic;
	Y3,Y2,Y1,Y0: out std_logic
);
end entity DECODER;

--circuit description
architecture DATAFLOW of DECODER is 
begin

	Y3<= WRADDR(1) and WRADDR(0) and LD;
	Y2<= WRADDR(1) and not WRADDR(0) and LD;
	Y1<= not WRADDR(1) and WRADDR(0) and LD;
	Y0<= not WRADDR(1) and not WRADDR(0) and LD;
	

end architecture DATAFLOW;