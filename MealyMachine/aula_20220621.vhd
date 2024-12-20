-- aula do dia 21/06/2022


entity aula_20220621 is 
port (
-- entradas
signal CLOCK_50 : in bit;
signal SW : in bit_vector (17 downto 0);
signal KEY : in bit_vector (3 downto 0);

-- saidas
--signal estado_out: out bit_vector(3 downto 0);
--signal tipo_out : out bit_vector(1 downto 0);
--signal sel1_out, sel2_out, sel3_out, clkv1_out, clkv2_out : out bit;
signal LEDR : out bit_vector (17 downto 0);
signal HEX7, HEX6, HEX5, HEX4,
       HEX3, HEX2, HEX1, HEX0 : out bit_vector (6 downto 0)
);
end entity aula_20220621;



architecture c_aula_20220621 of aula_20220621 is 


component gerador_clk is 
port (
	signal clk : in bit;
	signal clk1, clk2, clk3 : out bit;
	signal clkv1, clkv2 : out bit
);
end component gerador_clk;

component entrada is 
port (
-- entradas
signal sel, carga : in bit;
signal sw : in bit_vector (17 downto 0);
signal estado : in bit_vector (3 downto 0);

-- saida
signal dado_bit : out bit;
signal v_led : out bit_vector (17 downto 0)
);
end component entrada;

component maq_estado is 
port (
--entrada
signal sel, dado_bit, start, reset : in bit;
signal estado_in : in bit_vector (3 downto 0);

--saidas
signal estado_out : out bit_vector (3 downto 0);
signal tipo : out bit_vector (1 downto 0)

);
end component maq_estado;


component cont_disp is 
port (
-- entradas
signal clk, clk1, clk2 : in bit;
signal dado : in bit_vector (3 downto 0);
signal tipo : in bit_vector (1 downto 0);
-- saidas
signal disp7, disp6, disp5, disp4,
       disp3, disp2, disp1, disp0  : out bit_vector (6 downto 0)
);
end component cont_disp;

signal clk, clkv1, clkv2 : bit;

signal sel1, carga : bit;
signal ssw : bit_vector (17 downto 0);
signal estado : bit_vector (3 downto 0);
signal v_led : bit_vector (17 downto 0);


signal sel2, dado_bit, start, reset : bit;
signal tipo : bit_vector (1 downto 0);

signal sel3: bit;
signal disp7, disp6, disp5, disp4,
       disp3, disp2, disp1, disp0  : bit_vector (6 downto 0);



begin

clk <= CLOCK_50;
carga <= not KEY(3);
start <= not KEY(2);
reset <= not KEY(1);
ssw <= SW;
LEDR <= v_led;

HEX0 <= not disp0;
HEX1 <= not disp1;
HEX2 <= not disp2;
HEX3 <= not disp3;
HEX4 <= not disp4;
HEX5 <= not disp5;
HEX6 <= not disp6;
HEX7 <= not disp7;

--estado_out <= estado;
--tipo_out <= tipo;
--sel1_out <= sel1;
--sel2_out <= sel2;
--sel3_out <= sel3;
--clkv1_out <= clkv1;
--clkv2_out <= clkv2;
----------------------------------


x1 : gerador_clk port map (clk, sel1, sel2, sel3, clkv1, clkv2);
x2 : entrada port map (sel1, carga, ssw, estado, dado_bit, v_led); --sel1
x3 : maq_estado port map (sel2, dado_bit, start, reset, estado, estado, tipo); -- sel2
x4 : cont_disp port map (sel3, clkv1, clkv2, estado, tipo,
                         disp7, disp6, disp5, disp4,
								 disp3, disp2, disp1, disp0);



end architecture c_aula_20220621;