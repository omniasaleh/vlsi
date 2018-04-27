LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY MYNADDER IS 
		GENERIC (N            :  INTEGER := 17    ); 
		PORT (A,B 	      :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S             :  OUT   STD_LOGIC_VECTOR (N-1 DOWNTO 0));
		   
END ENTITY MYNADDER;
ARCHITECTURE DATA_FLOW OF MYNADDER IS 
COMPONENT MYADDER IS  
		PORT (A,B,CIN 	      :  IN   std_logic;
		      COUT,S          :  OUT  STD_LOGIC);    
END COMPONENT MYADDER;
SIGNAL TEMP : STD_LOGIC_VECTOR (N-1 DOWNTO 0);
signal cin : std_logic;
BEGIN 
	cin<='0';
	ADD1:MYADDER PORT MAP(A(0),B(0),cin,TEMP(0),S(0));
	loop1: FOR I IN 1 TO N-1 GENERATE
		ADD:MYADDER PORT MAP(A(I),B(I),TEMP(I-1),TEMP(I),S(I));
	   END GENERATE ;
END ARCHITECTURE DATA_FLOW;