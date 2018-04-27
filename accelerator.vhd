LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.pkg.all;

entity accelerator is 
	port (clk,rst,enp,ena,rstcnt,enablecnt,inst,f        :in std_logic;
		input 				: in ram_type(0 TO 24);
	        result				       	:out std_logic_vector (7 downto 0);
	      finishacc                               :out std_logic);
	                                   
end entity;

architecture accflow of accelerator is
component  alu IS
PORT( Clk,Rst,ena,enp,inst,finishmul       : IN std_logic;
		inp                      : in std_logic_vector(7 downto 0); 
		res                      : OUT std_logic_vector (7 DOWNTO 0));
END component alu;
 
component counter IS
PORT( Clk,Rst,enable			         : IN std_logic;
		outcnt                           : OUT std_logic_vector (3 DOWNTO 0));
END  component counter;

component sumplus is 
port(	clk    :in  std_logic ;
	inst,f  :in std_logic;
	input   :in ram_type(24 downto 0);
	outf   :out std_logic_vector (7 downto 0));
end  component sumplus;

signal finishmul,rstcnt1 :std_logic;
signal outcnt1   :std_logic_vector (3 downto 0); 
signal outalu 	 :ram_type (0 TO 24);
begin 

finishmul <= inst or(outcnt1(3));
rstcnt1<=Rst or rstcnt;
cnt1: counter port map (Clk ,rstcnt1,enablecnt,outcnt1);
 loop1: FOR I IN 0 TO 24 GENERATE
	alu0:alu PORT MAP(Clk,Rst,ena,enp,inst,finishmul,input(I),outalu(I));
	
 END GENERATE ;
	sum:sumplus port map (Clk,inst,f,outalu,result);
end accflow;