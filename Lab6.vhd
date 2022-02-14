library ieee;
use ieee.std_logic_1164.all;

entity reg_16bit is
port (reset,enable:in bit;clock:inout bit;i:in bit_vector(15 downto 0);
q:out bit_vector(15 downto 0));
end entity reg_16bit;

architecture behav of reg_16bit is
begin
	p1:process(clock,i,reset,enable)
	begin
		if (reset='1') then
			q<="0000000000000000";
		end if;
		if (clock='1') and (reset='0') and (enable='1') then
			q<=i;
		end if;
	end process p1;
end architecture behav;
