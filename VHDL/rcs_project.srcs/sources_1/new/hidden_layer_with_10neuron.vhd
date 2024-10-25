
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
--use IEEE.NUMERIC_STD.ALL;
use work.regs_package.all;



entity hidden_layer_with_10neuron is
  Port (clk       :in std_logic;
        enable    :in std_logic;
        input     :datain_type;
        neuron1_w :weight_type;
        neuron2_w :weight_type;
        neuron3_w :weight_type;
        neuron4_w :weight_type;
        neuron5_w :weight_type;
        neuron6_w :weight_type;
        neuron7_w :weight_type;
        neuron8_w :weight_type;
        neuron9_w :weight_type;
        neuron10_w:weight_type;
        output_n1:out signed(23 downto 0);
        output_n2:out signed(23 downto 0);
        output_n3:out signed(23 downto 0);
        output_n4:out signed(23 downto 0);
        output_n5:out signed(23 downto 0);
        output_n6:out signed(23 downto 0);
        output_n7:out signed(23 downto 0);
        output_n8:out signed(23 downto 0);
        output_n9:out signed(23 downto 0);
        output_n10:out signed(23 downto 0);
        valid_hidden_layer:out std_logic
                      );
end hidden_layer_with_10neuron;

architecture Behavioral of hidden_layer_with_10neuron is
component neuron_with_relu_activation is
   Port (    i_clk : in STD_LOGIC;
             enable :in std_logic;
             input:datain_type;
             neuron_w:weight_type;
             output1:out signed(23 downto 0);
             valid_out_neuron:out std_logic
              );
end component;

begin
neuron1:neuron_with_relu_activation port map
(
  i_clk=>clk,
  enable=>enable,
  input=>input,
  neuron_w=>neuron1_w,
  output1=>output_n1,
  valid_out_neuron=>open
  );
neuron2:neuron_with_relu_activation port map
(
    i_clk=>clk,
    enable=>enable,
    input=>input,
    neuron_w=>neuron2_w,
    output1=>output_n2,
    valid_out_neuron=>open
    );
    neuron3:neuron_with_relu_activation port map
 (
      i_clk=>clk,
      enable=>enable,
      input=>input,
      neuron_w=>neuron3_w,
      output1=>output_n3,
      valid_out_neuron=>open
      );
      neuron4:neuron_with_relu_activation port map
  (
        i_clk=>clk,
        enable=>enable,
        input=>input,
        neuron_w=>neuron4_w,
        output1=>output_n4,
        valid_out_neuron=>open
        );
        neuron5:neuron_with_relu_activation port map
   (
          i_clk=>clk,
          enable=>enable,
          input=>input,
          neuron_w=>neuron5_w,
          output1=>output_n5,
          valid_out_neuron=>open
          );
          neuron6:neuron_with_relu_activation port map
    (
            i_clk=>clk,
            enable=>enable,
            input=>input,
            neuron_w=>neuron6_w,
            output1=>output_n6,
            valid_out_neuron=>open
            );
            neuron7:neuron_with_relu_activation port map
     (
              i_clk=>clk,
              enable=>enable,
              input=>input,
              neuron_w=>neuron7_w,
              output1=>output_n7,
              valid_out_neuron=>open
              );
              neuron8:neuron_with_relu_activation port map
      (
                i_clk=>clk,
                enable=>enable,
                input=>input,
                neuron_w=>neuron8_w,
                output1=>output_n8,
                valid_out_neuron=>open
                );
                neuron9:neuron_with_relu_activation port map
       (
                  i_clk=>clk,
                  enable=>enable,
                  input=>input,
                  neuron_w=>neuron9_w,
                  output1=>output_n9,
                  valid_out_neuron=>open
                  );
                  neuron10:neuron_with_relu_activation port map
        (
                    i_clk=>clk,
                    enable=>enable,
                    input=>input,
                    neuron_w=>neuron10_w,
                    output1=>output_n10,
                    valid_out_neuron=>valid_hidden_layer
                    );
end Behavioral;
