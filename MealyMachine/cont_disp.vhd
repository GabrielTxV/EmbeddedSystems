--


entity cont_disp is 
port (
-- entradas
signal clk, clk1, clk2 : in bit;
signal dado : in bit_vector (3 downto 0);
signal tipo : in bit_vector (1 downto 0);
-- saidas
signal disp7, disp6, disp5, disp4,
       disp3, disp2, disp1, disp0  : out bit_vector (6 downto 0)
);
end entity cont_disp;



architecture c_cont_disp of cont_disp is 

component conv7seg is 
port (
	signal sel : in bit;
	signal dado : in bit_vector (3 downto 0);
	signal display : out bit_vector (6 downto 0)
);
end component conv7seg;


signal sdado7, sdado6, sdado5, sdado4,
       sdado3, sdado2, sdado1, sdado0  : bit_vector (3 downto 0);
		 
signal stipo7, stipo6, stipo5, stipo4,
       stipo3, stipo2, stipo1, stipo0  : bit_vector (1 downto 0);

signal ssel7, ssel6, ssel5, ssel4, 
       ssel3, ssel2, ssel1, ssel0  : bit;
		 
		 

		 
begin


controlador : process (clk)


begin

	if clk='0' and clk'event then
	if not (dado=sdado7 and tipo=stipo7) then
	
		sdado0 <= sdado1;
		stipo0 <= stipo1;
		
		sdado1 <= sdado2;
		stipo1 <= stipo2;
		
		sdado2 <= sdado3;
		stipo2 <= stipo3;
		
		sdado3 <= sdado4;
		stipo3 <= stipo4;
		
		sdado4 <= sdado5;
		stipo4 <= stipo5;
		
		sdado5 <= sdado6;
		stipo5 <= stipo6;
		
		sdado6 <= sdado7;
		stipo6 <= stipo7;
		
		sdado7 <= dado;
		stipo7 <= tipo;
		
	end if;
	end if;

end process controlador;


xdisp7 : conv7seg port map (ssel7, sdado7, disp7);
xdisp6 : conv7seg port map (ssel6, sdado6, disp6);
xdisp5 : conv7seg port map (ssel5, sdado5, disp5);
xdisp4 : conv7seg port map (ssel4, sdado4, disp4);
xdisp3 : conv7seg port map (ssel3, sdado3, disp3);
xdisp2 : conv7seg port map (ssel2, sdado2, disp2);
xdisp1 : conv7seg port map (ssel1, sdado1, disp1);
xdisp0 : conv7seg port map (ssel0, sdado0, disp0);


with stipo7 select
ssel7 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";
			 
			 
with stipo6 select
ssel6 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";
			
			
with stipo5 select
ssel5 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";	
		
		
with stipo4 select
ssel4 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";
			 
with stipo3 select
ssel3 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";
		
		
with stipo2 select
ssel2 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";
	
	
with stipo1 select
ssel1 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";			 

			 
with stipo0 select
ssel0 <= 
          '0' 	when "00",
			 clk1	when "01",
			 clk2	when "10",
			 '1'	when "11";
			 
			 
end architecture c_cont_disp;