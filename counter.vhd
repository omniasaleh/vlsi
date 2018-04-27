LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY counter IS
PORT( Clk,Rst,enable			         : IN std_logic;
		outcnt                           : OUT std_logic_vector (3 DOWNTO 0));
END counter;

architecture counterflow of counter is 
signal outc : std_logic_vector (3 downto 0):=(others =>'0');
begin
outcnt<=outc;
process (Clk,enable,Rst)
begin
  if (Rst='1') then 
	outc <="0000";
  elsif (rising_edge(Clk) and enable='1') then 
	outc<=std_logic_vector (unsigned (outc)+1);
  end if;
end process;
end counterflow;

