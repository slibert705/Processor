--Sam Libert
--CE1921 
--Constant8
library ieee;
use ieee.std_logic_1164.all;

entity CONSTANT8 is
port(
	Y: out std_logic_vector(31 downto 0)
);
end entity CONSTANT8;

architecture DATAFLOW of CONSTANT8 is

begin
	Y <= X"00000008";
end architecture DATAFLOW;