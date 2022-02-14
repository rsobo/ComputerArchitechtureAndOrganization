library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity regFile is
	port (we3: in bit; clock: in STD_LOGIC;
		a1, a2, a3: in STD_LOGIC_VECTOR(4 downto 0);
		wd3: in STD_LOGIC_VECTOR(31 downto 0);
		rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0));
	end regFile;
architecture behav of regFile is
	type ramtype is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
	signal mem: ramtype;
begin
	p1:process(clock)
	begin
		if rising_edge(clock) then
			if (we3='1') then
				mem(to_integer(a3))<=wd3;
			end if;
		end if;
	end process p1;

	p2:process(a1)
	begin
		if (to_integer(a1)=0) then
			rd1<=X"00000000";
		else 
			rd1<=mem(to_integer(a1));
		end if;
		if (to_integer(a2)=0) then--FILL--
			rd2<=X"00000000";
		else 
			rd2<=mem(to_integer(a2));
		end if;
	end process p2;
end architecture behav;
