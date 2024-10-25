
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.std_logic_signed.all;
--use IEEE.NUMERIC_STD.ALL;
use work.regs_package.all;
LIBRARY WORK;
USE WORK.Generic_size_of_matrices_pkg.ALL;

entity neuron_with_sigmoid_activation is
   Port (    i_clk : in STD_LOGIC;
             enable :in std_logic;
             input:datain_type_out_layer;
             neuron_w:weight_type_out_layer;
             output1:out std_logic_vector(31 downto 0);
             valid_out_neuron:out std_logic
              );
end neuron_with_sigmoid_activation;
architecture Behavioral of neuron_with_sigmoid_activation is
--type my_type is array (0 to 783) of std_logic_vector(7 downto 0);
type my_type2 is array (0 to 9) of signed(39 downto 0);
-- signal neuron_1_w    :  my_type;
-- signal neuron_2_w    :  my_type;
-- signal neuron_3_w    :  my_type;
--signal input              : my_type;
signal out1_reg        : my_type2;--  std_logic_vector (15 downto 0);
--signal out2_reg        : my_type2;-- std_logic_vector (15 downto 0);
--signal out3_reg        : my_type2;--  std_logic_vector (15 downto 0);
signal out_neuron1   :  signed (39 downto 0):=(others=>'0');
 
 
type my_type3 is (loop_state,sum_loop,sigmoid_state);
signal fully_connected_state:my_type3:=loop_state;
signal count:integer:=0;
--COMPONENT blk_mem_gen_0
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
--  );
--END COMPONENT;
-- component sigmoid is
    -- Port ( Y : in STD_LOGIC_VECTOR (31 downto 0);
           -- O : out STD_LOGIC_VECTOR (31 downto 0);
           -- clk: in STD_LOGIC );
-- end component;

component Sigmoid IS
       PORT ( Din: IN Fixed_Point;
              Dout: OUT Fixed_Point);
        
END component;
signal output1_mem:std_logic_vector(31 downto 0);
signal addres     :signed(31 downto 0);
begin


process(i_clk)
begin
if rising_edge(i_clk) then
case fully_connected_state is 
when loop_state=>
if enable ='1' then
valid_out_neuron<='0';
for i in 0 to 9 loop
   out1_reg(i)<= (input(i) ) * signed(neuron_w(i));-- 24bit(1,3,20) * 16 bit(1,2,13)=40bit (1,6,33)
    
 end loop;
 fully_connected_state<=sum_loop;
 end if;
when sum_loop=>
 if count < 10 then 
     out_neuron1<=out_neuron1 + out1_reg(count);--40bit(1,6,33)
     count<=count+1;
  else
    fully_connected_state<=sigmoid_state;
    count<=0;
   end if;
when sigmoid_state=>
 addres<=((out_neuron1(39)&out_neuron1(39)&out_neuron1(39)&out_neuron1(39)&out_neuron1(39)&out_neuron1(39)
                          &out_neuron1(39)&out_neuron1(39)&out_neuron1(39)&out_neuron1(39)&out_neuron1(38 downto 17)));
 valid_out_neuron<='1';
 --fully_connected_state<=loop_state;
  
end case;

end if;       
end process;
output1<=output1_mem;
sigmoid_instant: sigmoid  port map
(
        Din=>std_logic_vector(addres),
        Dout=> output1_mem
		);


end Behavioral;
