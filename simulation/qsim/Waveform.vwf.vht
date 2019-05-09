-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/09/2019 03:10:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          scp
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY scp_vhd_vec_tst IS
END scp_vhd_vec_tst;
ARCHITECTURE scp_arch OF scp_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALUS : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ALUSRCB : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL CPSRWR : STD_LOGIC;
SIGNAL EXTS : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL FUNCT : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL MEMADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MEMDATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MEMWR : STD_LOGIC;
SIGNAL PC4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL PCSRC : STD_LOGIC;
SIGNAL PCWR : STD_LOGIC;
SIGNAL REGDST : STD_LOGIC;
SIGNAL REGSRC : STD_LOGIC;
SIGNAL REGWR : STD_LOGIC;
SIGNAL ROTATE : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RST : STD_LOGIC;
SIGNAL WD3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT scp
	PORT (
	ALUS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALUSRCB : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	CPSRWR : OUT STD_LOGIC;
	EXTS : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	FUNCT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	MEMADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MEMDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MEMWR : OUT STD_LOGIC;
	PC4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	PCSRC : OUT STD_LOGIC;
	PCWR : OUT STD_LOGIC;
	REGDST : OUT STD_LOGIC;
	REGSRC : OUT STD_LOGIC;
	REGWR : OUT STD_LOGIC;
	ROTATE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	RST : IN STD_LOGIC;
	WD3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : scp
	PORT MAP (
-- list connections between master ports and signals
	ALUS => ALUS,
	ALUSRCB => ALUSRCB,
	CLK => CLK,
	CPSRWR => CPSRWR,
	EXTS => EXTS,
	FUNCT => FUNCT,
	MEMADDR => MEMADDR,
	MEMDATA => MEMDATA,
	MEMWR => MEMWR,
	PC4 => PC4,
	PCSRC => PCSRC,
	PCWR => PCWR,
	REGDST => REGDST,
	REGSRC => REGSRC,
	REGWR => REGWR,
	ROTATE => ROTATE,
	RST => RST,
	WD3 => WD3
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 5000 ps;
	CLK <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- RST
t_prcs_RST: PROCESS
BEGIN
	RST <= '1';
	WAIT FOR 60000 ps;
	RST <= '0';
WAIT;
END PROCESS t_prcs_RST;
END scp_arch;
