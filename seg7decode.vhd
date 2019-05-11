library ieee;
use ieee.std_logic_1164.all;

entity SEG7DECODE is port(
	A: in std_logic_vector(31 downto 0);
	SEG5:	out std_logic_vector(7 downto 0);
	SEG4:	out std_logic_vector(7 downto 0);
	SEG3:	out std_logic_vector(7 downto 0);
	SEG2:	out std_logic_vector(7 downto 0);
	SEG1:	out std_logic_vector(7 downto 0);
	SEG0:	out std_logic_vector(7 downto 0)
	
);
end entity SEG7DECODE;

architecture df of SEG7DECODE is
	begin

--Using with select with always give a MUX

with A(23 downto 20) select SEG5 <=
	x"C0" when x"0",
	x"F9" when x"1",
	x"A4" when x"2",
   x"B0" when x"3",

	x"99" when x"4",
	x"92" when x"5",	
	x"82" when x"6",
	x"D8" when x"7",
	
	x"80" when x"8",
   x"90" when x"9",
	x"88" when x"A",
	x"83" when x"B",
	
   x"A7" when x"C",
   x"A1" when x"D",
	x"86" when x"E",
	x"8E" when x"F",
	
	x"7F" when others;
	
	
with A(19 downto 16) select SEG4 <=
	x"C0" when x"0",
	x"F9" when x"1",
	x"A4" when x"2",
   x"B0" when x"3",

	x"99" when x"4",
	x"92" when x"5",	
	x"82" when x"6",
	x"D8" when x"7",
	
	x"80" when x"8",
   x"90" when x"9",
	x"88" when x"A",
	x"83" when x"B",
	
   x"A7" when x"C",
   x"A1" when x"D",
	x"86" when x"E",
	x"8E" when x"F",
	
	x"7F" when others;

with A(15 downto 12) select SEG3 <=
	x"C0" when x"0",
	x"F9" when x"1",
	x"A4" when x"2",
   x"B0" when x"3",

	x"99" when x"4",
	x"92" when x"5",	
	x"82" when x"6",
	x"D8" when x"7",
	
	x"80" when x"8",
   x"90" when x"9",
	x"88" when x"A",
	x"83" when x"B",
	
   x"A7" when x"C",
   x"A1" when x"D",
	x"86" when x"E",
	x"8E" when x"F",
	
	x"7F" when others;
	
	
with A(11 downto 8) select SEG2 <=
	x"C0" when x"0",
	x"F9" when x"1",
	x"A4" when x"2",
   x"B0" when x"3",

	x"99" when x"4",
	x"92" when x"5",	
	x"82" when x"6",
	x"D8" when x"7",
	
	x"80" when x"8",
   x"90" when x"9",
	x"88" when x"A",
	x"83" when x"B",
	
   x"A7" when x"C",
   x"A1" when x"D",
	x"86" when x"E",
	x"8E" when x"F",
	
	x"7F" when others;
	
	
with A(7 downto 4) select SEG1 <=
	x"C0" when x"0",
	x"F9" when x"1",
	x"A4" when x"2",
   x"B0" when x"3",

	x"99" when x"4",
	x"92" when x"5",	
	x"82" when x"6",
	x"D8" when x"7",
	
	x"80" when x"8",
   x"90" when x"9",
	x"88" when x"A",
	x"83" when x"B",
	
   x"A7" when x"C",
   x"A1" when x"D",
	x"86" when x"E",
	x"8E" when x"F",
	
	x"7F" when others;
	
	
with A(3 downto 0) select SEG0 <=
	x"C0" when x"0",
	x"F9" when x"1",
	x"A4" when x"2",
   x"B0" when x"3",

	x"99" when x"4",
	x"92" when x"5",	
	x"82" when x"6",
	x"D8" when x"7",
	
	x"80" when x"8",
   x"90" when x"9",
	x"88" when x"A",
	x"83" when x"B",
	
   x"A7" when x"C",
   x"A1" when x"D",
	x"86" when x"E",
	x"8E" when x"F",
	
	x"7F" when others;
	
	
end;