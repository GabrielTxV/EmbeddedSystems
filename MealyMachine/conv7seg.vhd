-- conversor para 7 seg com habilitador

entity conv7seg is 
port (
	signal sel : in bit;
	signal dado : in bit_vector (3 downto 0);
	signal display : out bit_vector (6 downto 0)
);
end entity conv7seg;


architecture c_conv7seg of conv7seg is 

signal s_disp : bit_vector (6 downto 0);

begin 

display <= s_disp when sel='1' else "0000000";


with dado select
s_disp <= 
"0111111" when "0000",
"0000110" when "0001",
"1011011" when "0010",
"1001111" when "0011",
"1100110" when "0100",
"1101101" when "0101",
"1111101" when "0110",
"0000111" when "0111",
"1111111" when "1000",
"1101111" when "1001",
"1110111" when "1010",
"1111100" when "1011",
"0111001" when "1100",
"1011110" when "1101",
"1111001" when "1110",
"1110001" when "1111";

end;