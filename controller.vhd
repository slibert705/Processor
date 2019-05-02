library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--Entity means schematic block symbol
entity CONTROLLER is
port(
	COND: in std_logic_vector(3 downto 0);
	OP: in std_logic_vector(1 downto 0);
	FUNCT: in std_logic_vector(5 downto 0);
	ROT: in std_logic_vector(3 downto 0);
	C,V,N,Z: in std_logic;
	
	
	PCSRC: out std_logic;
	PCWR: out std_logic;
	REGDST: out std_logic;
	REGWR: out std_logic;
	EXTS: out std_logic_vector(1 downto 0);
	ALUSRCB: out std_logic;
	ALUS: out std_logic_vector(2 downto 0);
	CPSRWR: out std_logic;
	MEMWR: out std_logic;
	REGSRC: out std_logic;
	ROTATE: out std_logic_vector(3 downto 0)
	
);
end entity CONTROLLER;

--circuit description
architecture DATAFLOW of CONTROLLER is 
begin

	PCSRC <= '0' when (OP=B"10" and COND=X"E") or (OP=B"10" and COND=X"0" and Z='1') or (OP=B"10" and COND=X"1" and Z='0') else --
	'1';
	
	PCWR <= '1';
	
	REGDST <= '1' when OP=1 and FUNCT(0)='0' else --when STR
				 '0';
	
	REGWR <= '0' when FUNCT(4 downto 1)=X"A" OR (OP=B"01" and FUNCT(0)='0') OR OP=B"10" else 
				'1';
	
	EXTS <= OP;
	
	ALUSRCB <= '1' when (OP=B"00" and FUNCT(5)='0') else --high when register mode
				  '0';
	
	ALUS <= O"1" when OP=B"00" and (FUNCT(4 downto 1)= X"A" or FUNCT(4 downto 1) = X"2") else--CMP or 
			  O"2" when OP=B"00" and FUNCT(4 downto 1) = X"0" else
			  O"3" when OP=B"00" and FUNCT(4 downto 1) = X"C" else
			  O"4" when OP=B"00" and FUNCT(4 downto 1) = X"1" else
			  O"6" when OP=B"00" and FUNCT(4 downto 1) = X"D" else
			  O"0";
	
	CPSRWR <= '1' when OP=B"00" and FUNCT(4 downto 1) = X"A" else
				 '0';
	
	MEMWR <= '1' when OP=1 and FUNCT(0)='0' else
				'0';
	
	REGSRC <= '0' when OP=1 and FUNCT(0)='1' else
				 '1';
	
	ROTATE <= X"0";
	
	
	
	
	

end architecture;