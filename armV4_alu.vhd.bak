--Sam Libert
--CE1921 03/14/19
--ARM V4 Arithmetic Logic Unit
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity armV4_alu is
port(A, B: in std_logic_vector(31 downto 0);
	  ALUS: in std_logic_vector(2 downto 0);
	  
			  F: inout std_logic_vector(31 downto 0);
	  C,V,N,Z: out   std_logic);
	 
end entity armV4_alu;

architecture BEHAVIORAL of armV4_alu is 

	signal INTA, INTB, INTF: std_logic_vector(32 downto 0);

begin

	INTA <= '0'&A;
	INTB <= '0'&B;
	   F <= INTF(31 downto 0);

	--Flags
	C <= INTF(32);
	N <= F(31);
	
	with F select 
	Z <= '1' when X"00000000",
		  '0' when others;
	
	with ALUS select
	v <= (A(31) and B(31) and (not F(31)))	or ((not A(31)) and (not B(31)) and F(31)) when O"0",
		 (A(31) and ( not B(31)) and (not F(31))) or ((not A(31)) and B(31) and F(31)) when O"1",
																											'0' when others;
		  
	
	with ALUS select
	INTF <= INTA+INTB when O"0",
			  INTA-INTB when O"1",
		 INTA and INTB when O"2",
		  INTA or INTB when O"3",
		 INTA xor INTB when O"4",
				    INTA when O"5",
				    INTB when O"6",
	  '0'&X"00000001" when others;
	
	
			
end architecture BEHAVIORAL;

