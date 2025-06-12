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

-- DATE "06/11/2025 23:42:29"

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

ENTITY 	Semaforo IS
    PORT (
	V1 : OUT std_logic;
	\VCC\ : IN std_logic;
	CLK : IN std_logic;
	RST : IN std_logic;
	A1 : OUT std_logic;
	R1 : OUT std_logic;
	V2 : OUT std_logic;
	A2 : OUT std_logic;
	R2 : OUT std_logic;
	V3 : OUT std_logic;
	A3 : OUT std_logic;
	R3 : OUT std_logic
	);
END Semaforo;

-- Design Ports Information
-- V1	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A1	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V2	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A2	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V3	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A3	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VCC	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Semaforo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_V1 : std_logic;
SIGNAL \ww_VCC\ : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_A1 : std_logic;
SIGNAL ww_R1 : std_logic;
SIGNAL ww_V2 : std_logic;
SIGNAL ww_A2 : std_logic;
SIGNAL ww_R2 : std_logic;
SIGNAL ww_V3 : std_logic;
SIGNAL ww_A3 : std_logic;
SIGNAL ww_R3 : std_logic;
SIGNAL \RST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \V1~output_o\ : std_logic;
SIGNAL \A1~output_o\ : std_logic;
SIGNAL \R1~output_o\ : std_logic;
SIGNAL \V2~output_o\ : std_logic;
SIGNAL \A2~output_o\ : std_logic;
SIGNAL \R2~output_o\ : std_logic;
SIGNAL \V3~output_o\ : std_logic;
SIGNAL \A3~output_o\ : std_logic;
SIGNAL \R3~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst2|inst5~0_combout\ : std_logic;
SIGNAL \VCC~input_o\ : std_logic;
SIGNAL \inst|inst4~1_combout\ : std_logic;
SIGNAL \inst|inst9~0_combout\ : std_logic;
SIGNAL \inst|inst4~_emulated_q\ : std_logic;
SIGNAL \inst|inst4~0_combout\ : std_logic;
SIGNAL \inst|inst3~1_combout\ : std_logic;
SIGNAL \inst|inst3~_emulated_q\ : std_logic;
SIGNAL \inst|inst3~0_combout\ : std_logic;
SIGNAL \inst|inst15~0_combout\ : std_logic;
SIGNAL \inst|inst7~1_combout\ : std_logic;
SIGNAL \inst|inst7~_emulated_q\ : std_logic;
SIGNAL \inst|inst7~0_combout\ : std_logic;
SIGNAL \inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst9~3_combout\ : std_logic;
SIGNAL \inst|inst9~_emulated_q\ : std_logic;
SIGNAL \inst|inst9~2_combout\ : std_logic;
SIGNAL \inst|inst10~combout\ : std_logic;
SIGNAL \inst|inst11~1_combout\ : std_logic;
SIGNAL \inst|inst11~_emulated_q\ : std_logic;
SIGNAL \inst|inst11~0_combout\ : std_logic;
SIGNAL \inst|inst8~0_combout\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \inst|inst21~combout\ : std_logic;
SIGNAL \inst|inst9~1_combout\ : std_logic;
SIGNAL \inst|inst5~1_combout\ : std_logic;
SIGNAL \inst|inst5~_emulated_q\ : std_logic;
SIGNAL \inst|inst5~0_combout\ : std_logic;
SIGNAL \inst|inst2~1_combout\ : std_logic;
SIGNAL \inst2|inst3~0_combout\ : std_logic;
SIGNAL \inst|inst2~0_combout\ : std_logic;
SIGNAL \inst2|inst~combout\ : std_logic;
SIGNAL \RST~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst2|D0~q\ : std_logic;
SIGNAL \inst2|inst28~0_combout\ : std_logic;
SIGNAL \inst2|inst28~1_combout\ : std_logic;
SIGNAL \inst2|D2~q\ : std_logic;
SIGNAL \inst2|inst12~0_combout\ : std_logic;
SIGNAL \inst2|inst14~0_combout\ : std_logic;
SIGNAL \inst2|inst11~combout\ : std_logic;
SIGNAL \inst2|D1~q\ : std_logic;
SIGNAL \inst3|inst5~0_combout\ : std_logic;
SIGNAL \inst3|inst5~1_combout\ : std_logic;
SIGNAL \inst2|inst3~1_combout\ : std_logic;
SIGNAL \inst3|inst5~2_combout\ : std_logic;
SIGNAL \inst2|inst5~1_combout\ : std_logic;
SIGNAL \ALT_INV_RST~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|ALT_INV_inst9~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_inst5~2_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_inst5~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_inst14~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_inst12~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_inst5~0_combout\ : std_logic;

BEGIN

V1 <= ww_V1;
\ww_VCC\ <= \VCC\;
ww_CLK <= CLK;
ww_RST <= RST;
A1 <= ww_A1;
R1 <= ww_R1;
V2 <= ww_V2;
A2 <= ww_A2;
R2 <= ww_R2;
V3 <= ww_V3;
A3 <= ww_A3;
R3 <= ww_R3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RST~input_o\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_RST~inputclkctrl_outclk\ <= NOT \RST~inputclkctrl_outclk\;
\inst|ALT_INV_inst9~0_combout\ <= NOT \inst|inst9~0_combout\;
\inst3|ALT_INV_inst5~2_combout\ <= NOT \inst3|inst5~2_combout\;
\inst2|ALT_INV_inst5~0_combout\ <= NOT \inst2|inst5~0_combout\;
\inst2|ALT_INV_inst3~0_combout\ <= NOT \inst2|inst3~0_combout\;
\inst2|ALT_INV_inst14~0_combout\ <= NOT \inst2|inst14~0_combout\;
\inst2|ALT_INV_inst12~0_combout\ <= NOT \inst2|inst12~0_combout\;
\inst3|ALT_INV_inst5~0_combout\ <= NOT \inst3|inst5~0_combout\;

-- Location: IOOBUF_X33_Y14_N2
\V1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|ALT_INV_inst5~0_combout\,
	devoe => ww_devoe,
	o => \V1~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\A1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_inst12~0_combout\,
	devoe => ww_devoe,
	o => \A1~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\R1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|inst5~1_combout\,
	devoe => ww_devoe,
	o => \R1~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\V2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_inst14~0_combout\,
	devoe => ww_devoe,
	o => \V2~output_o\);

-- Location: IOOBUF_X33_Y12_N9
\A2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \A2~output_o\);

-- Location: IOOBUF_X33_Y22_N9
\R2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|inst3~1_combout\,
	devoe => ww_devoe,
	o => \R2~output_o\);

-- Location: IOOBUF_X33_Y24_N2
\V3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_inst5~0_combout\,
	devoe => ww_devoe,
	o => \V3~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\A3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|ALT_INV_inst5~2_combout\,
	devoe => ww_devoe,
	o => \A3~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\R3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|inst5~1_combout\,
	devoe => ww_devoe,
	o => \R3~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G17
\CLK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: LCCOMB_X31_Y18_N12
\inst2|inst5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst5~0_combout\ = (!\inst2|D2~q\ & (\inst2|D0~q\ & !\inst2|D1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|D2~q\,
	datab => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst5~0_combout\);

-- Location: IOIBUF_X33_Y12_N1
\VCC~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_VCC\,
	o => \VCC~input_o\);

-- Location: LCCOMB_X30_Y18_N12
\inst|inst4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst4~1_combout\ = \inst|inst4~0_combout\ $ (!\inst|inst9~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst4~0_combout\,
	datad => \inst|inst9~1_combout\,
	combout => \inst|inst4~1_combout\);

-- Location: LCCOMB_X30_Y18_N14
\inst|inst9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst9~0_combout\ = (\inst|inst21~combout\) # (!\VCC~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \VCC~input_o\,
	datad => \inst|inst21~combout\,
	combout => \inst|inst9~0_combout\);

-- Location: FF_X30_Y18_N13
\inst|inst4~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst|inst4~1_combout\,
	clrn => \inst|ALT_INV_inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst4~_emulated_q\);

-- Location: LCCOMB_X30_Y18_N30
\inst|inst4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst4~0_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\ $ (\inst|inst4~_emulated_q\)) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datab => \VCC~input_o\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst4~_emulated_q\,
	combout => \inst|inst4~0_combout\);

-- Location: LCCOMB_X30_Y18_N0
\inst|inst3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst3~1_combout\ = \inst|inst9~1_combout\ $ (\inst|inst4~0_combout\ $ (\inst|inst3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datac => \inst|inst4~0_combout\,
	datad => \inst|inst3~0_combout\,
	combout => \inst|inst3~1_combout\);

-- Location: FF_X30_Y18_N1
\inst|inst3~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst|inst3~1_combout\,
	clrn => \inst|ALT_INV_inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst3~_emulated_q\);

-- Location: LCCOMB_X30_Y18_N6
\inst|inst3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst3~0_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\ $ (\inst|inst3~_emulated_q\)) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datab => \VCC~input_o\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst3~_emulated_q\,
	combout => \inst|inst3~0_combout\);

-- Location: LCCOMB_X30_Y18_N8
\inst|inst15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst15~0_combout\ = (\inst|inst4~0_combout\ & \inst|inst3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst4~0_combout\,
	datad => \inst|inst3~0_combout\,
	combout => \inst|inst15~0_combout\);

-- Location: LCCOMB_X30_Y18_N16
\inst|inst7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst7~1_combout\ = \inst|inst7~0_combout\ $ (\inst|inst9~1_combout\ $ (((\inst|inst15~0_combout\ & \inst|inst5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst7~0_combout\,
	datab => \inst|inst9~1_combout\,
	datac => \inst|inst15~0_combout\,
	datad => \inst|inst5~0_combout\,
	combout => \inst|inst7~1_combout\);

-- Location: FF_X30_Y18_N17
\inst|inst7~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst|inst7~1_combout\,
	clrn => \inst|ALT_INV_inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst7~_emulated_q\);

-- Location: LCCOMB_X30_Y18_N22
\inst|inst7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst7~0_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\ $ (\inst|inst7~_emulated_q\)) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datab => \VCC~input_o\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst7~_emulated_q\,
	combout => \inst|inst7~0_combout\);

-- Location: LCCOMB_X30_Y18_N20
\inst|inst6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst6~combout\ = (\inst|inst3~0_combout\ & (\inst|inst4~0_combout\ & \inst|inst5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst3~0_combout\,
	datac => \inst|inst4~0_combout\,
	datad => \inst|inst5~0_combout\,
	combout => \inst|inst6~combout\);

-- Location: LCCOMB_X30_Y18_N28
\inst|inst9~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst9~3_combout\ = \inst|inst9~1_combout\ $ (\inst|inst9~2_combout\ $ (((\inst|inst7~0_combout\ & \inst|inst6~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst7~0_combout\,
	datab => \inst|inst9~1_combout\,
	datac => \inst|inst9~2_combout\,
	datad => \inst|inst6~combout\,
	combout => \inst|inst9~3_combout\);

-- Location: FF_X30_Y18_N29
\inst|inst9~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst|inst9~3_combout\,
	clrn => \inst|ALT_INV_inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst9~_emulated_q\);

-- Location: LCCOMB_X30_Y18_N26
\inst|inst9~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst9~2_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\ $ (\inst|inst9~_emulated_q\)) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datab => \VCC~input_o\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst9~_emulated_q\,
	combout => \inst|inst9~2_combout\);

-- Location: LCCOMB_X30_Y18_N10
\inst|inst10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst10~combout\ = (\inst|inst7~0_combout\ & (\inst|inst3~0_combout\ & (\inst|inst4~0_combout\ & \inst|inst5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst7~0_combout\,
	datab => \inst|inst3~0_combout\,
	datac => \inst|inst4~0_combout\,
	datad => \inst|inst5~0_combout\,
	combout => \inst|inst10~combout\);

-- Location: LCCOMB_X30_Y18_N24
\inst|inst11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst11~1_combout\ = \inst|inst9~1_combout\ $ (\inst|inst11~0_combout\ $ (((\inst|inst9~2_combout\ & \inst|inst10~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datab => \inst|inst11~0_combout\,
	datac => \inst|inst9~2_combout\,
	datad => \inst|inst10~combout\,
	combout => \inst|inst11~1_combout\);

-- Location: FF_X30_Y18_N25
\inst|inst11~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst|inst11~1_combout\,
	clrn => \inst|ALT_INV_inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst11~_emulated_q\);

-- Location: LCCOMB_X30_Y18_N18
\inst|inst11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst11~0_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\ $ (\inst|inst11~_emulated_q\)) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~1_combout\,
	datab => \VCC~input_o\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst11~_emulated_q\,
	combout => \inst|inst11~0_combout\);

-- Location: LCCOMB_X30_Y18_N4
\inst|inst8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst8~0_combout\ = (!\inst|inst9~2_combout\ & (!\inst|inst3~0_combout\ & (!\inst|inst7~0_combout\ & \inst|inst11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~2_combout\,
	datab => \inst|inst3~0_combout\,
	datac => \inst|inst7~0_combout\,
	datad => \inst|inst11~0_combout\,
	combout => \inst|inst8~0_combout\);

-- Location: IOIBUF_X16_Y0_N22
\RST~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

-- Location: LCCOMB_X30_Y18_N2
\inst|inst21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst21~combout\ = (\RST~input_o\) # ((\inst|inst4~0_combout\ & (\inst|inst5~0_combout\ & \inst|inst8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst4~0_combout\,
	datab => \inst|inst5~0_combout\,
	datac => \inst|inst8~0_combout\,
	datad => \RST~input_o\,
	combout => \inst|inst21~combout\);

-- Location: LCCOMB_X31_Y18_N28
\inst|inst9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst9~1_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VCC~input_o\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst9~1_combout\,
	combout => \inst|inst9~1_combout\);

-- Location: LCCOMB_X31_Y18_N16
\inst|inst5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst5~1_combout\ = \inst|inst5~0_combout\ $ (\inst|inst9~1_combout\ $ (((\inst|inst3~0_combout\ & \inst|inst4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst5~0_combout\,
	datab => \inst|inst9~1_combout\,
	datac => \inst|inst3~0_combout\,
	datad => \inst|inst4~0_combout\,
	combout => \inst|inst5~1_combout\);

-- Location: FF_X31_Y18_N17
\inst|inst5~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst|inst5~1_combout\,
	clrn => \inst|ALT_INV_inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst5~_emulated_q\);

-- Location: LCCOMB_X31_Y18_N22
\inst|inst5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst5~0_combout\ = (!\inst|inst21~combout\ & ((\inst|inst9~1_combout\ $ (\inst|inst5~_emulated_q\)) # (!\VCC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VCC~input_o\,
	datab => \inst|inst9~1_combout\,
	datac => \inst|inst21~combout\,
	datad => \inst|inst5~_emulated_q\,
	combout => \inst|inst5~0_combout\);

-- Location: LCCOMB_X31_Y18_N18
\inst|inst2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst2~1_combout\ = (\inst|inst5~0_combout\ & !\inst|inst4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst5~0_combout\,
	datad => \inst|inst4~0_combout\,
	combout => \inst|inst2~1_combout\);

-- Location: LCCOMB_X31_Y18_N14
\inst2|inst3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst3~0_combout\ = (\inst2|D2~q\ & (!\inst2|D0~q\ & \inst2|D1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|D2~q\,
	datab => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst3~0_combout\);

-- Location: LCCOMB_X31_Y18_N0
\inst|inst2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst2~0_combout\ = (\inst|inst9~2_combout\ & (\inst|inst7~0_combout\ & (\inst|inst3~0_combout\ & !\inst|inst11~0_combout\))) # (!\inst|inst9~2_combout\ & (!\inst|inst7~0_combout\ & (!\inst|inst3~0_combout\ & \inst|inst11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst9~2_combout\,
	datab => \inst|inst7~0_combout\,
	datac => \inst|inst3~0_combout\,
	datad => \inst|inst11~0_combout\,
	combout => \inst|inst2~0_combout\);

-- Location: LCCOMB_X31_Y18_N26
\inst2|inst\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst~combout\ = (\inst|inst2~1_combout\ & ((\inst|inst2~0_combout\ & ((\inst2|inst3~0_combout\))) # (!\inst|inst2~0_combout\ & (\inst2|inst5~0_combout\)))) # (!\inst|inst2~1_combout\ & (\inst2|inst5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst5~0_combout\,
	datab => \inst|inst2~1_combout\,
	datac => \inst2|inst3~0_combout\,
	datad => \inst|inst2~0_combout\,
	combout => \inst2|inst~combout\);

-- Location: CLKCTRL_G19
\RST~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RST~inputclkctrl_outclk\);

-- Location: FF_X31_Y18_N27
\inst2|D0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst2|inst~combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|D0~q\);

-- Location: LCCOMB_X31_Y18_N30
\inst2|inst28~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst28~0_combout\ = (!\inst2|D1~q\) # (!\inst2|D0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst28~0_combout\);

-- Location: LCCOMB_X31_Y18_N20
\inst2|inst28~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst28~1_combout\ = (\inst2|inst28~0_combout\ & (\inst2|D2~q\ $ (((\inst|inst2~1_combout\ & \inst|inst2~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst28~0_combout\,
	datab => \inst|inst2~1_combout\,
	datac => \inst2|D2~q\,
	datad => \inst|inst2~0_combout\,
	combout => \inst2|inst28~1_combout\);

-- Location: FF_X31_Y18_N21
\inst2|D2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst2|inst28~1_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|D2~q\);

-- Location: LCCOMB_X31_Y18_N10
\inst2|inst12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst12~0_combout\ = (\inst2|D2~q\ & (!\inst2|D0~q\ & !\inst2|D1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|D2~q\,
	datab => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst12~0_combout\);

-- Location: LCCOMB_X31_Y18_N8
\inst2|inst14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst14~0_combout\ = (!\inst2|D2~q\ & (!\inst2|D0~q\ & \inst2|D1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|D2~q\,
	datab => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst14~0_combout\);

-- Location: LCCOMB_X31_Y18_N24
\inst2|inst11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst11~combout\ = (\inst|inst2~1_combout\ & ((\inst|inst2~0_combout\ & (\inst2|inst12~0_combout\)) # (!\inst|inst2~0_combout\ & ((\inst2|inst14~0_combout\))))) # (!\inst|inst2~1_combout\ & (((\inst2|inst14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst12~0_combout\,
	datab => \inst|inst2~1_combout\,
	datac => \inst2|inst14~0_combout\,
	datad => \inst|inst2~0_combout\,
	combout => \inst2|inst11~combout\);

-- Location: FF_X31_Y18_N25
\inst2|D1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inst2|inst11~combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|D1~q\);

-- Location: LCCOMB_X32_Y18_N8
\inst3|inst5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst3|inst5~0_combout\ = (!\inst2|D1~q\ & (!\inst2|D0~q\ & !\inst2|D2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|D1~q\,
	datac => \inst2|D0~q\,
	datad => \inst2|D2~q\,
	combout => \inst3|inst5~0_combout\);

-- Location: LCCOMB_X32_Y18_N14
\inst3|inst5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst3|inst5~1_combout\ = (!\inst2|D0~q\ & !\inst2|D1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst3|inst5~1_combout\);

-- Location: LCCOMB_X32_Y18_N16
\inst2|inst3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst3~1_combout\ = (!\inst2|D0~q\ & \inst2|D1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst3~1_combout\);

-- Location: LCCOMB_X32_Y18_N18
\inst3|inst5~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst3|inst5~2_combout\ = (!\inst2|D1~q\ & (\inst2|D0~q\ & \inst2|D2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|D1~q\,
	datac => \inst2|D0~q\,
	datad => \inst2|D2~q\,
	combout => \inst3|inst5~2_combout\);

-- Location: LCCOMB_X32_Y18_N12
\inst2|inst5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|inst5~1_combout\ = (\inst2|D0~q\ & !\inst2|D1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|D0~q\,
	datad => \inst2|D1~q\,
	combout => \inst2|inst5~1_combout\);

ww_V1 <= \V1~output_o\;

ww_A1 <= \A1~output_o\;

ww_R1 <= \R1~output_o\;

ww_V2 <= \V2~output_o\;

ww_A2 <= \A2~output_o\;

ww_R2 <= \R2~output_o\;

ww_V3 <= \V3~output_o\;

ww_A3 <= \A3~output_o\;

ww_R3 <= \R3~output_o\;
END structure;


