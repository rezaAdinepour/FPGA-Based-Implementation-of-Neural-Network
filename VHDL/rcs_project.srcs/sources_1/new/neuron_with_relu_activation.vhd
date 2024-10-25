
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

--use IEEE.NUMERIC_STD.ALL;
use work.regs_package.all;
entity neuron_with_relu_activation is
   Port (    i_clk : in STD_LOGIC;
             enable :in std_logic;
             input:datain_type;
             neuron_w:weight_type;
             output1:out signed(23 downto 0);
             valid_out_neuron:out std_logic
              );
end neuron_with_relu_activation;
architecture Behavioral of neuron_with_relu_activation is
type my_type is array (0 to 783) of std_logic_vector(7 downto 0);
type my_type2 is array (0 to 783) of signed(23 downto 0);
 
 
signal out1_reg        : my_type2;--  std_logic_vector (15 downto 0);
--signal out2_reg        : my_type2;-- std_logic_vector (15 downto 0);
--signal out3_reg        : my_type2;--  std_logic_vector (15 downto 0);
signal out_neuron1   :  signed (23 downto 0):=(others=>'0');
--signal out_neuron2   :  std_logic_vector (23 downto 0);
--signal out_neuron3   :  std_logic_vector (23 downto 0);
signal output1_relu   :  signed (23 downto 0):=(others=>'0');
--signal output2_relu   :  std_logic_vector (23 downto 0);
--signal output3_relu   :  std_logic_vector (23 downto 0);
type my_type3 is (loop_state,sum_loop,relu_state);
signal fully_connected_state:my_type3:=loop_state;
signal count:integer:=0;
begin


process(i_clk)
begin
if rising_edge(i_clk) then
case fully_connected_state is 
when loop_state=>
if enable ='1' then
valid_out_neuron<='0';
for i in 0 to 774 loop
   out1_reg(i)  <= signed(input(i)   ) *signed( neuron_w(i))  ;--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+1)<= signed(input(i+1) ) *signed( neuron_w(i+1));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+2)<= signed(input(i+2) ) *signed( neuron_w(i+2));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+3)<= signed(input(i+3) ) *signed( neuron_w(i+3));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+4)<= signed(input(i+4) ) *signed( neuron_w(i+4));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+5)<= signed(input(i+5) ) *signed( neuron_w(i+5));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+6)<= signed(input(i+6) ) *signed( neuron_w(i+6));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+7)<= signed(input(i+7) ) *signed( neuron_w(i+7));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+8)<= signed(input(i+8) ) *signed( neuron_w(i+8));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
   out1_reg(i+9)<= signed(input(i+9) ) *signed( neuron_w(i+9));--  8bit(1,0,7) * 16 bit (1,2,13)=24bit(1,3,20)
    
 end loop;
 fully_connected_state<=sum_loop;
 end if;
when sum_loop=>
 if count < 784 then 
     out_neuron1<=out_neuron1 + out1_reg(count);--24bit(1,3,20)+24bit(1,3,20)=24bit(1,3,20)
     count<=count+1;
  else
    fully_connected_state<=relu_state;
   end if;
when relu_state=>
if (out_neuron1) >0 then 
 output1_relu<=out_neuron1;
 
else
   output1_relu<=(others=>'0');
end if;
 valid_out_neuron<='1';
 --fully_connected_state<=loop_state;
  
end case;

end if;       
end process;

output1<=output1_relu;

end Behavioral;
