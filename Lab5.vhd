library ieee;
use ieee.std_logic_1164.all;

entity dC is
port (d, r:in bit; clk:inout bit; q:out bit);

end dC;

architecture behav of dC is
begin
	p1: process(clk,d,r)
	begin
		if(r='1')then
			q<='0';
		elsif(clk='1')then
			q<=d;
		end if;
	end process p1;
end behav;
