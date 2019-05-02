--Sam Libert
--CE1921 
--Constant
library ieee;
use ieee.std_logic_1164.all;


entity CONSTANT4 is
port(
	Y: out std_logic_vector(31 downto 0)
);
end entity CONSTANT4;

architecture DATAFLOW of CONSTANT4 is

begin
	Y <= X"00000004";
end architecture DATAFLOW;