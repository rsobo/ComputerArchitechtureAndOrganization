library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mult16 is
port(num1, num2: in std_logic_vector(15 downto 0);
	product: out std_logic_vector (31 downto 0));
end mult16;

architecture behavior of mult16 is
begin
	process(num1, num2)
	variable num1_reg: std_logic_vector(15 downto 0);
	variable product_reg: std_logic_vector(31 downto 0);
	begin
		num1_reg := num1;
		product_reg := "0000000000000000" & num2;
		for i in 1 to 16 loop
			if product_reg(0)='1' then
				product_reg(31 downto 16) := product_reg(31 downto 16) + num1_reg(15 downto 0);
			end if;
			product_reg(31 downto 0) := '0' & product_reg(31 downto 1);
		end loop;
		product <= product_reg(31 downto 0);
	end process;
end behavior;
