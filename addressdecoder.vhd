library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--Entity means schematic block symbol
entity ADDRESSDECODER is
port(
	ADDR: in std_logic_vector(31 downto 0);
	MEMRD,MEMWR: in std_logic;
	
	LD2, LD1, LD0, DATAS: out std_logic
	
);
end entity ADDRESSDECODER;

--circuit description
architecture DATAFLOW of ADDRESSDECODER is 
begin

	LD2 <=  '1' when ADDR < X"0000001F" and MEMRD='0' and MEMWR='1' else
			  '0';
	
	LD1 <=  '1' when ADDR = X"000000F8" and MEMRD='0' and MEMWR='1' else
			  '0';
	
	LD0 <=  '1' when ADDR = X"000000FC" and MEMRD='0' and MEMWR='1' else
			  '0';
	
	DATAS <='1' when ADDR < X"0000001F" and MEMRD='1' and MEMWR='0' else
			  '0';
	
	
	
	
	

end architecture;