-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/24/2025 22:22:14"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Registros IS
    PORT (
	Output : OUT std_logic;
	CLK : IN std_logic;
	InputEnable : IN std_logic;
	D0 : IN std_logic;
	OutputEnable : IN std_logic
	);
END Registros;

-- Design Ports Information
-- Output	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OutputEnable	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D0	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InputEnable	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Registros IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Output : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_InputEnable : std_logic;
SIGNAL ww_D0 : std_logic;
SIGNAL ww_OutputEnable : std_logic;
SIGNAL \Output~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \InputEnable~input_o\ : std_logic;
SIGNAL \D0~input_o\ : std_logic;
SIGNAL \BIT~0_combout\ : std_logic;
SIGNAL \BIT~q\ : std_logic;
SIGNAL \OutputEnable~input_o\ : std_logic;

BEGIN

Output <= ww_Output;
ww_CLK <= CLK;
ww_InputEnable <= InputEnable;
ww_D0 <= D0;
ww_OutputEnable <= OutputEnable;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X24_Y0_N9
\Output~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BIT~q\,
	oe => \OutputEnable~input_o\,
	devoe => ww_devoe,
	o => \Output~output_o\);

-- Location: IOIBUF_X20_Y0_N1
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\InputEnable~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InputEnable,
	o => \InputEnable~input_o\);

-- Location: IOIBUF_X22_Y0_N8
\D0~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D0,
	o => \D0~input_o\);

-- Location: LCCOMB_X21_Y1_N28
\BIT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BIT~0_combout\ = (\InputEnable~input_o\ & ((\D0~input_o\))) # (!\InputEnable~input_o\ & (\BIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InputEnable~input_o\,
	datac => \BIT~q\,
	datad => \D0~input_o\,
	combout => \BIT~0_combout\);

-- Location: FF_X21_Y1_N29
BIT : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \BIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BIT~q\);

-- Location: IOIBUF_X24_Y0_N1
\OutputEnable~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OutputEnable,
	o => \OutputEnable~input_o\);

ww_Output <= \Output~output_o\;
END structure;


