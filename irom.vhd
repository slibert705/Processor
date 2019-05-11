--*********************************************************
--* FILENAME: irom.vhd
--* AUTHOR:   meier@msoe.edu <Dr. Meier>
--* MODIFIED: durant@msoe.edu <Dr. Durant>, 2018-05-06
--* - added assembly syntax as comments behind hexadecimal
--* DATE:     Spring Quarter 2018
--* PROVIDES: 
--* - ROM for test program for the single cycle processor
--* - calculates the sum of the first n integers
--*   where n is loaded into register R8
--* - sets memory[4] = 1 if sum >=32
--* - tests memory-mapped I/O (sliders for input, SEG7 and LEDs for output)
--*********************************************************

--*********************************************************
--* INCLUDE LIBRARIES AND PACKAGES
--* - std_logic_1164: 9-valued logic
--*********************************************************
library ieee;
use ieee.std_logic_1164.all;

--*********************************************************
--* ENTITY DECLARATION
--* INPUT PORTS
--* - A: 32-bit memory address
--* 
--* OUTPUT PORTS
--* - RD: 32-bit memory data
--*********************************************************

entity irom is 
port(A: in std_logic_vector(31 downto 0);
     RD: out std_logic_vector(31 downto 0));
end entity irom;

architecture dataflow of irom is
begin
  with A select RD <=
	X"E3A0_4004" when X"00000000", --0main:   MOV R4,#4       ; R4 = memory address
	X"E3A0_C000" when X"00000004", -- 4        MOV R12,#0      ; temp = 0
	X"E584_C000" when X"00000008", -- 8        STR R12,[R4]    ; MEM[4] = 0 : init memory
	X"E3A0_C0F4" when X"0000000C", --12        MOV R12,#SLIDE  ; address of sliders (.equ SLIDE,0x000000F4)
	X"E59C_8000" when X"00000010", --16        LDR R8,[R12]    ; i = n
	X"E3A0_9000" when X"00000014", --20        MOV R9,#0       ; sum = 0
	X"E358_0000" when X"00000018", --24        CMP R8,#0       ; i=0?
	X"0A00_000A" when X"0000001C", --28        BEQ print       ; if yes branch to print
	X"E089_9008" when X"00000020", --32loop:   ADD R9,R9,R8    ; sum = sum + i
	X"E248_8001" when X"00000024", --36        SUB R8,R8,#1    ; i = i - 1
	X"E358_0000" when X"00000028", --40        CMP R8,#0
	X"1AFF_FFFB" when X"0000002C", --44        BNE loop
	X"E3A0_A000" when X"00000030", --48if:     MOV R10,#0      ; creating FFFFFFE0
	X"E24A_A020" when X"00000034", --52        SUB R10,R10,#32 ; 0 - 32 = -32 = FFFFFFE0
	X"E009_A00A" when X"00000038", --56	AND R10,R9,R10
	X"E35A_0000" when X"0000003C", --60        CMP R10,#0
	X"0A00_0000" when X"00000040", --64        BEQ else        ; if (R9 > 32) MEM[4] = 1
	X"E3A0_A001" when X"00000044", --68        MOV R10,#1      ; set the 1
	X"E584_A000" when X"00000048", --72else:   STR R10,[R4]    ; memory[4] = either 1 or 0
	X"E3A0_C0FC" when X"0000004C", --76print:  MOV R12,#SEG7   ; seg7 data reg address (.equ SEG7,0x000000fc)
	X"E58C_9000" when X"00000050", --80        STR R9,[R12]    ; seg7 = sum
	X"E3A9_C0F8" when X"00000054", --84        MOV 12,#LED     ; LED reg address (.equ LED,0x000000F8)
	X"E594_3000" when x"00000058", --88        LDR R3,[R4]     ; get stored memory value back
	X"E58C_3000" when x"0000005C", --92        STR R3,[R12]    ; leds = mem[4] : is it >32? LED0 on
	X"EAFF_FFFE" when others;      --96done:   B done 

end architecture dataflow;