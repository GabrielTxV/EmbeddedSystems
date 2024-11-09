-- componente entrada / fluxo de bits

entity entrada is 
port (
-- entradas
signal sel, carga : in bit;
signal sw : in bit_vector (17 downto 0);
signal estado : in bit_vector (3 downto 0);

-- saida
signal dado_bit : out bit;
signal v_led : out bit_vector (17 downto 0)
);
end entity entrada;



architecture c_entrada of entrada is 

begin





p_entrada : process (sel)

variable v_entrada : bit_vector (17 downto 0) := "000000000000000000";

begin

if sel='0' and sel'event then 

	if estado /= "0000" then
	
		v_entrada(16 downto 0) := v_entrada(17 downto 1);
		v_entrada(17) := '0';
	
	elsif carga = '1' then
	
		v_entrada := SW;
	
	end if;
	
	dado_bit <= v_entrada(0);
	v_led <= v_entrada;


end if;

end process p_entrada;




end architecture c_entrada;