--Sam Libert
--CE1921 
--ADDER
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ADDER is
port(
	A, B: in std_logic_vector(31 downto 0);
	Y: out std_logic_vector(31 downto 0)
);
end entity ADDER;

architecture DATAFLOW of ADDER is

begin
	Y <= A+B;
end architecture DATAFLOW;