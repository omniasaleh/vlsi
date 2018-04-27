LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity add3numbers is 
generic (N		:integer:=8);
port(	a,b,c  : in std_logic_vector (n-1 downto 0);
	out1   :out std_logic_vector (n+1 downto 0));
end entity;

architecture sum of add3numbers is 
	signal acc: unsigned(out1'range);
	signal a_aft,b_aft,c_aft :std_logic_vector (n+1 downto 0);
begin 
	a_aft<= "00"&a;
	b_aft<= "00"&b;
	c_aft<= "00"&c;
	acc <= unsigned(a_aft)+unsigned(b_aft);
	out1<= std_logic_vector(unsigned(acc)+unsigned(c_aft));
	--out1<= std_logic_vector(acc);
end sum;
