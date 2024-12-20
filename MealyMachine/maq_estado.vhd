-- Maquina de estado do tipo mealy


entity maq_estado is 
port (
--entrada
signal sel, dado_bit, start, reset : in bit;
signal estado_in : in bit_vector (3 downto 0);
--saidas

signal estado_out : out bit_vector (3 downto 0);
signal tipo : out bit_vector (1 downto 0)

);
end entity maq_estado;


architecture c_maq_estado of maq_estado is 

begin


mealy : process (sel) 

variable vestado : bit_vector (3 downto 0);
variable vtipo : bit_vector (1 downto 0);

begin
if sel='0' and sel'event then

	vestado := estado_in;

	if vestado = "0000" and start = '1' then
		vestado := "0001";
		vtipo := "11";
	end if;

	if vestado /= "0000" and reset = '1' then 
		vestado := "0000";
		vtipo := "01";
	end if;
	
	if vestado="0000" then
		vtipo := "01";
	else 
	-- elaborar a tabela de estado
	
		case vestado is
			when "0001" =>
				if dado_bit= '0' then
					vestado := "0001";
					vtipo := "11";
				else
					vestado := "0010";
					vtipo := "11";
				end if;
			
			when "0010" => 
				if dado_bit= '0' then
					vestado := "0011";
					vtipo := "11";
				else
					vestado := "0010";
					vtipo := "11";
				end if;

			when "0011" =>
				if dado_bit= '0' then
					vestado := "0001";
					vtipo := "11";
				else
					vestado := "0100";
					vtipo := "11";
				end if;

			when "0100"=>
				if dado_bit= '0' then
					vestado := "0011";
					vtipo := "11";
				else
					vestado := "1111";
					vtipo := "10";
				end if;
			
			when "1111" =>	
				if dado_bit= '0' then
					vestado := "1111";
					vtipo := "10";
				else
					vestado := "1111";
					vtipo := "10";
				end if;
			
			when others =>
				vestado := "0000";
				vtipo := "01";
				
		end case;
	end if;

	estado_out <= vestado;
	tipo <= vtipo;
end if;


end process mealy;




end architecture c_maq_estado;