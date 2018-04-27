LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY alu IS
PORT( Clk,Rst,ena,enp,inst,finishmul       : IN std_logic;
		inp                      : in std_logic_vector(7 downto 0); 
		res                      : OUT std_logic_vector (7 DOWNTO 0));
END alu;

architecture aluFlow of alu is 
component my_nDFFfalling IS
GENERIC ( n : integer := 16);
PORT( Clk,Rst        : IN std_logic;
		  EN : IN STD_LOGIC;
		   d : IN std_logic_vector(n-1 DOWNTO 0);
		   q : OUT std_logic_vector(n-1 DOWNTO 0));
END component my_nDFFfalling;

component MYNADDER IS 
		GENERIC (N            :  INTEGER := 17    ); 
		PORT (A,B 	      :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S             :  OUT   STD_LOGIC_VECTOR (N-1 DOWNTO 0)); 
END component MYNADDER;

signal outa: std_logic_vector (16 downto 0);
signal outp: std_logic_vector (16 downto 0);
signal s   : std_logic_vector (16 downto 0);
signal inpa: std_logic_vector (16 downto 0);
signal inpp: std_logic_vector (16 downto 0);
signal invt: std_logic_vector (7 downto 0);
signal enablep :std_logic;
signal outmux,outadder1,outadder2,outshift,inppfinal :std_logic_vector (16 downto 0); 

begin 
	inppfinal<= inpp  when (enp='1')
	else outshift;
	enablep <= enp or (not finishmul);
	inpp<="00000000"&inp&"0";
	inpa<=inp&"000000000";
	p:  my_nDFFfalling  generic map(n=>17) port map (Clk,Rst,enablep,inppfinal,outp);
	a:  my_nDFFfalling  generic map(n=>17) port map (Clk,Rst,ena,inpa,outa);
	invt<= not outa(16 downto 9);
	s   <= std_logic_vector(unsigned(invt) + 1)&"000000000";
	adder1: MYNADDER generic map (n=>17)  port map (outp,outa,outadder1);
	adder2: MYNADDER generic map (n=>17)  port map (outp,s,outadder2);
	outmux<=
	outp when (outp(0)='0' and outp(1)='0')
	else outadder1 when (outp(0)='1' and outp(1)='0')
	else outadder2 when (outp(0)='0' and outp(1)='1')
	else outp;
	outshift<=outmux(16)&outmux(16 downto 1);
	res<=outp(8 downto 1);
end architecture;