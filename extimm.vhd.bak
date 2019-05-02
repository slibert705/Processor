library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity EXTIMM is
port(
	  IMM: in std_logic_vector(23 downto 0);
	 EXTS: in std_logic_vector( 1 downto 0);
	IMM32: out std_logic_vector(31 downto 0)
);
end entity EXTIMM;

architecture DATAFLOW of EXTIMM is

begin
	with EXTS select
	IMM32 <= X"000000"&IMM(7 downto 0) when B"00",
				X"00000"&IMM(11 downto 0) when B"01",
				IMM(23)&IMM(23)&IMM(23)&IMM(23)&IMM(23)&IMM(23)&IMM(23 downto 0)&B"00" when others;
end architecture DATAFLOW;
