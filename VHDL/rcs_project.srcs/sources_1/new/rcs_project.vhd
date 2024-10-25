library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.std_logic_signed.all;
--use IEEE.NUMERIC_STD.ALL;
use work.regs_package.all;
entity rcs_project is
   Port (    i_clk : in STD_LOGIC;
             START_ANN : in STD_LOGIC;
             inputs            :datain_type;
             outlayer_neuron1_w:weight_type_out_layer;
             outlayer_neuron2_w:weight_type_out_layer;
             outlayer_neuron3_w:weight_type_out_layer;
             outlayer_neuron4_w:weight_type_out_layer;
             outlayer_neuron5_w:weight_type_out_layer;
             outlayer_neuron6_w:weight_type_out_layer;
             outlayer_neuron7_w:weight_type_out_layer;
             outlayer_neuron8_w:weight_type_out_layer;
             outlayer_neuron9_w:weight_type_out_layer;
             outlayer_neuron10_w:weight_type_out_layer;
             hidden_neuron1_w:weight_type;
             hidden_neuron2_w:weight_type;
             hidden_neuron3_w:weight_type;
             hidden_neuron4_w:weight_type;
             hidden_neuron5_w:weight_type;
             hidden_neuron6_w:weight_type;
             hidden_neuron7_w:weight_type;
             hidden_neuron8_w:weight_type;
             hidden_neuron9_w:weight_type;
             hidden_neuron10_w:weight_type;
             output0          :out std_logic_vector(31 downto 0);
             output1          :out std_logic_vector(31 downto 0);
             output2          :out std_logic_vector(31 downto 0);
             output3          :out std_logic_vector(31 downto 0);
             output4          :out std_logic_vector(31 downto 0);
             output5          :out std_logic_vector(31 downto 0);
             output6          :out std_logic_vector(31 downto 0);
             output7          :out std_logic_vector(31 downto 0);
             output8          :out std_logic_vector(31 downto 0);
             output9          :out std_logic_vector(31 downto 0)
            -- output10         :out std_logic_vector(31 downto 0)
             
              );
end rcs_project;
architecture Behavioral of rcs_project is
 
component hidden_layer_with_10neuron is
  Port (clk                :in std_logic;
        enable             :in std_logic;
        input              :datain_type;
        neuron1_w          :weight_type;
        neuron2_w          :weight_type;
        neuron3_w          :weight_type;
        neuron4_w          :weight_type;
        neuron5_w          :weight_type;
        neuron6_w          :weight_type;
        neuron7_w          :weight_type;
        neuron8_w          :weight_type;
        neuron9_w          :weight_type;
        neuron10_w         :weight_type;
        output_n1          :out signed(23 downto 0);
        output_n2          :out signed(23 downto 0);
        output_n3          :out signed(23 downto 0);
        output_n4          :out signed(23 downto 0);
        output_n5          :out signed(23 downto 0);
        output_n6          :out signed(23 downto 0);
        output_n7          :out signed(23 downto 0);
        output_n8          :out signed(23 downto 0);
        output_n9          :out signed(23 downto 0);
        output_n10         :out signed(23 downto 0);
        valid_hidden_layer :out std_logic
                      );
end component;
component output_layer_with_10neuron is
  Port (clk               :in std_logic;
        enable            :in std_logic;
        input             :datain_type_out_layer;
        neuron1_w         :weight_type_out_layer;
        neuron2_w         :weight_type_out_layer;
        neuron3_w         :weight_type_out_layer;
        neuron4_w         :weight_type_out_layer;
        neuron5_w         :weight_type_out_layer;
        neuron6_w         :weight_type_out_layer;
        neuron7_w         :weight_type_out_layer;
        neuron8_w         :weight_type_out_layer;
        neuron9_w         :weight_type_out_layer;
        neuron10_w        :weight_type_out_layer;
        output_n1         :out std_logic_vector(31 downto 0);
        output_n2         :out std_logic_vector(31 downto 0);
        output_n3         :out std_logic_vector(31 downto 0);
        output_n4         :out std_logic_vector(31 downto 0);
        output_n5         :out std_logic_vector(31 downto 0);
        output_n6         :out std_logic_vector(31 downto 0);
        output_n7         :out std_logic_vector(31 downto 0);
        output_n8         :out std_logic_vector(31 downto 0);
        output_n9         :out std_logic_vector(31 downto 0);
        output_n10        :out std_logic_vector(31 downto 0);
        valid_outlayer:out std_logic
                      );
end component;

--type my_type is  array (0 to 9) of signed(7 downto 0);
signal input_outlayer:datain_type_out_layer;--:=(others=>(others=>'0'));
signal out_hidden_n1:signed(23 downto 0);
signal out_hidden_n2:signed(23 downto 0);
signal out_hidden_n3:signed(23 downto 0);
signal out_hidden_n4:signed(23 downto 0);
signal out_hidden_n5:signed(23 downto 0);
signal out_hidden_n6:signed(23 downto 0);
signal out_hidden_n7:signed(23 downto 0);
signal out_hidden_n8:signed(23 downto 0);
signal out_hidden_n9:signed(23 downto 0);
signal out_hidden_n10:signed(23 downto 0);
signal valid_hidden_layer:std_logic:='0';
--signal START_ANN:std_logic;

begin

hidden_layer_with_10neuron_instance:hidden_layer_with_10neuron port map
(
clk                =>i_clk       ,
enable             =>START_ANN,
input              =>inputs,
neuron1_w          =>hidden_neuron1_w ,
neuron2_w          =>hidden_neuron2_w ,
neuron3_w          =>hidden_neuron3_w ,
neuron4_w          =>hidden_neuron4_w ,
neuron5_w          =>hidden_neuron5_w ,
neuron6_w          =>hidden_neuron6_w ,
neuron7_w          =>hidden_neuron7_w , 
neuron8_w          =>hidden_neuron8_w ,
neuron9_w          =>hidden_neuron9_w ,
neuron10_w         =>hidden_neuron10_w,
output_n1          =>out_hidden_n1,
output_n2          =>out_hidden_n2,
output_n3          =>out_hidden_n3,
output_n4          =>out_hidden_n4,
output_n5          =>out_hidden_n5,
output_n6          =>out_hidden_n6,
output_n7          =>out_hidden_n7,
output_n8          =>out_hidden_n8,
output_n9          =>out_hidden_n9,
output_n10         =>out_hidden_n10,
valid_hidden_layer =>valid_hidden_layer

);
input_outlayer(0)<=out_hidden_n1;
input_outlayer(1)<=out_hidden_n2;
input_outlayer(2)<=out_hidden_n3;
input_outlayer(3)<=out_hidden_n4;
input_outlayer(4)<=out_hidden_n5;
input_outlayer(5)<=out_hidden_n6;
input_outlayer(6)<=out_hidden_n7;
input_outlayer(7)<=out_hidden_n8;
input_outlayer(8)<=out_hidden_n9;
input_outlayer(9)<=out_hidden_n10;

output_layer_with_10neuron_instant:output_layer_with_10neuron port map
(
clk                          =>i_clk,
enable                       =>valid_hidden_layer,
input                        =>input_outlayer,
neuron1_w                    =>outlayer_neuron1_w,
neuron2_w                    =>outlayer_neuron2_w,
neuron3_w                    =>outlayer_neuron3_w,
neuron4_w                    =>outlayer_neuron4_w,
neuron5_w                    =>outlayer_neuron5_w,
neuron6_w                    =>outlayer_neuron6_w,
neuron7_w                    =>outlayer_neuron7_w,
neuron8_w                    =>outlayer_neuron8_w,
neuron9_w                    =>outlayer_neuron9_w,
neuron10_w                   =>outlayer_neuron10_w,
output_n1                    =>output0,
output_n2                    =>output1,
output_n3                    =>output2,
output_n4                    =>output3,
output_n5                    =>output4,
output_n6                    =>output5,
output_n7                    =>output6,
output_n8                    =>output7,
output_n9                    =>output8,
output_n10                   =>output9,
valid_outlayer               =>open
);

end Behavioral;
