-- gerador de clock de 800ms


entity gerador_clk is 
port (
	signal clk : in bit;
	signal clk1, clk2, clk3 : out bit;
	signal clkv1, clkv2 : out bit
);
end entity gerador_clk;


architecture c_gerador_clk of gerador_clk is 

signal clock_in : bit;
signal clk1ms : bit;
signal sclkv1, sclkv2 : bit;


begin

clock_in <= clk;
clkv1 <= sclkv1;
clkv2 <= sclkv2;

pclk1ms : process(clock_in)

variable clk : bit := '0';

--constant pclk1_real : integer := 800;
--constant pclkv1_real : integer := 1000;
--constant pclkv2_real : integer := 500;
--
--constant pclk1_teste :integer := 8;
--constant pclkv1_teste :integer := 10;
--constant pclkv2_teste :integer := 5;

variable contador : integer range 0 to 25000 := 0;
--variable contador : integer range 0 to 25 := 0; --teste

begin

if clock_in = '0' and clock_in'event then

	if contador<(25000-1) then
	--if contador<(25-1) then
		contador := contador + 1;
	else
		contador := 0;
		clk := not clk;
	end if;
	
	clk1ms <= clk;
	
end if;
end process pclk1ms;


pclk1 : process(clk1ms)

variable vclk1, vclk2, vclk3 : bit := '1';
variable contador : integer range 0 to 800 := 0;
--variable contador : integer range 0 to 8 := 0; -- teste

begin

if clk1ms = '0' and clk1ms'event then

	if contador<(800-1) then
	--if contador<(8-1) then --teste
	
		contador := contador + 1;
		
		if contador=2 then vclk1 := '0'; end if;
		if contador=4 then vclk2 := '0'; end if;
		if contador=6 then vclk3 := '0'; end if;		
		
	else
	
		contador := 0;
		vclk1 := '1';
		vclk2 := '1';
		vclk3 := '1';
		
	end if;
	
	clk1 <= vclk1;
	clk2 <= vclk2;
	clk3 <= vclk3;
	
end if;
end process pclk1;


pclkv1 : process(clk1ms)

variable clk : bit := '0';
variable contador : integer range 0 to 1000 := 0;
--variable contador : integer range 0 to 10 := 0; --teste

begin

if clk1ms = '0' and clk1ms'event then

	if contador<(1000-1) then
	--if contador<(10-1) then -- teste
		contador := contador + 1;
	else
		contador := 0;
		clk := not clk;
	end if;
	
	sclkv1 <= clk;
	
end if;
end process pclkv1;

pclkv2 : process(clk1ms)

variable clk : bit := '0';
variable contador : integer range 0 to 500 := 0;
--variable contador : integer range 0 to 5 := 0; -- teste

begin

if clk1ms = '0' and clk1ms'event then

	if contador<(500-1) then
	--if contador<(5-1) then
		contador := contador + 1;
	else
		contador := 0;
		clk := not clk;
	end if;
	
	sclkv2 <= clk;
	
end if;
end process pclkv2;

end architecture c_gerador_clk;