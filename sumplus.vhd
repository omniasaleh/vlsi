LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg.all;
entity sumplus is 
port(	clk    :in  std_logic ;
	inst,f  :in std_logic;
	input   :in ram_type(24 downto 0);
	outf   :out std_logic_vector (7 downto 0));
end sumplus;
architecture dataflow of sumplus is 
component MYNADDER IS 
		GENERIC (N            :  INTEGER := 8    ); 
		PORT (A,B 	      :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S             :  OUT   STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END component MYNADDER;
	
	signal acc : ram_type(11 downto 0);
	signal acc1 : ram_type(5 downto 0);
	signal acc2 : ram_type(2 downto 0);
	signal acc3 : ram_type(1 downto 0);
	signal finishsum :std_logic_vector (7 downto 0);
	
	
begin
	a0:  MYNADDER generic map(n=>8) PORT MAP(input(0),input(1),acc(0));
	a1:  MYNADDER generic map(n=>8) PORT MAP(input(2),input(5),acc(1));
	a2:  MYNADDER  generic map(n=>8) PORT MAP(input(6),input(7),acc(2));
	a3:  MYNADDER generic map(n=>8) PORT MAP(input(10),input(11),acc(3));
	a4:  MYNADDER generic map(n=>8) PORT MAP(input(3),input(4),acc(4));
	a5:  MYNADDER generic map(n=>8) PORT MAP(input(8),input(9),acc(5));
	a6:  MYNADDER generic map(n=>8) PORT MAP(input(13),input(14),acc(6));
	a7:  MYNADDER generic map(n=>8) PORT MAP(input(15),input(16),acc(7));
	a8:  MYNADDER generic map(n=>8) PORT MAP(input(17),input(18),acc(8));
	a9:  MYNADDER generic map(n=>8) PORT MAP(input(19),input(20),acc(9));
	a10: MYNADDER generic map(n=>8) PORT MAP(input(21),input(22),acc(10));
	a11: MYNADDER generic map(n=>8) PORT MAP(input(23),input(24),acc(11));

	a12: MYNADDER  PORT MAP(acc(0),acc(1),acc1(0));
	a13: MYNADDER  PORT MAP(acc(2),acc(3),acc1(1));
	a14: MYNADDER PORT MAP(acc(4),acc(5),acc1(2));
	a15: MYNADDER  PORT MAP(acc(6),acc(7),acc1(3));
	a16: MYNADDER  PORT MAP(acc(8),acc(9),acc1(4));
	a17: MYNADDER  PORT MAP(acc(10),acc(11),acc1(5));


	a18: MYNADDER PORT MAP(acc1(0),acc1(1),acc2(0));
	a19: MYNADDER  PORT MAP(acc1(2),acc1(3),acc2(1));
	a20: MYNADDER  PORT MAP(acc1(4),acc1(5),acc2(2));

	a21: MYNADDER  PORT MAP(acc2(0),input(12),acc3(0));
	a22: MYNADDER  PORT MAP(acc2(1),acc2(2),acc3(1));
	a23: MYNADDER  PORT MAP(acc3(0),acc3(1),finishsum);
	

	outf<=
	     acc3(0) when (inst='0' AND f='0')
	else finishsum  when (inst='0' and f='1')
	else  "000"&acc3(0)(7 downto 3) when (inst='1' and f='0')
	else "00000"&finishsum  (7 downto 5);
end architecture;