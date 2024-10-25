--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_textio.all;
use STD.textio.all;
use ieee.std_logic_arith.all;

use ieee.std_logic_signed.all;
--use ieee.std_logic_unsigned.all;
--use IEEE.NUMERIC_STD.ALL;
use work.regs_package.all;

 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   component rcs_project is
       Port (    i_clk                     : in STD_LOGIC;
	             START_ANN                 : in STD_LOGIC;
                 inputs                    :datain_type;
                 outlayer_neuron1_w        :weight_type_out_layer;
                 outlayer_neuron2_w        :weight_type_out_layer;
                 outlayer_neuron3_w        :weight_type_out_layer;
                 outlayer_neuron4_w        :weight_type_out_layer;
                 outlayer_neuron5_w        :weight_type_out_layer;
                 outlayer_neuron6_w        :weight_type_out_layer;
                 outlayer_neuron7_w        :weight_type_out_layer;
                 outlayer_neuron8_w        :weight_type_out_layer;
                 outlayer_neuron9_w        :weight_type_out_layer;
                 outlayer_neuron10_w       :weight_type_out_layer;
                 hidden_neuron1_w          :weight_type;
                 hidden_neuron2_w          :weight_type;
                 hidden_neuron3_w          :weight_type;
                 hidden_neuron4_w          :weight_type;
                 hidden_neuron5_w          :weight_type;
                 hidden_neuron6_w          :weight_type;
                 hidden_neuron7_w          :weight_type;
                 hidden_neuron8_w          :weight_type;
                 hidden_neuron9_w          :weight_type;
                 hidden_neuron10_w         :weight_type;
                 output0                   :out std_logic_vector(31 downto 0);
                 output1                   :out std_logic_vector(31 downto 0);
                 output2                   :out std_logic_vector(31 downto 0);
                 output3                   :out std_logic_vector(31 downto 0);
                 output4                   :out std_logic_vector(31 downto 0);
                 output5                   :out std_logic_vector(31 downto 0);
                 output6                   :out std_logic_vector(31 downto 0);
                 output7                   :out std_logic_vector(31 downto 0);
                 output8                   :out std_logic_vector(31 downto 0);
                 output9                   :out std_logic_vector(31 downto 0)
                -- output10                  :out std_logic_vector(31 downto 0)
                 
                  );
    end component;
 

signal                    i_clk                     :  STD_LOGIC;
signal                    START_ANN                 :  STD_LOGIC:='0';
signal                    inputs                    :datain_type;
signal                    outlayer_neuron1_w        :weight_type_out_layer;
signal                    outlayer_neuron2_w        :weight_type_out_layer;
signal                    outlayer_neuron3_w        :weight_type_out_layer;
signal                    outlayer_neuron4_w        :weight_type_out_layer;
signal                    outlayer_neuron5_w        :weight_type_out_layer;
signal                    outlayer_neuron6_w        :weight_type_out_layer;
signal                    outlayer_neuron7_w        :weight_type_out_layer;
signal                    outlayer_neuron8_w        :weight_type_out_layer;
signal                    outlayer_neuron9_w        :weight_type_out_layer;
signal                    outlayer_neuron10_w       :weight_type_out_layer;
signal                    hidden_neuron1_w          :weight_type;
signal                    hidden_neuron2_w          :weight_type;
signal                    hidden_neuron3_w          :weight_type;
signal                    hidden_neuron4_w          :weight_type;
signal                    hidden_neuron5_w          :weight_type;
signal                    hidden_neuron6_w          :weight_type;
signal                    hidden_neuron7_w          :weight_type;
signal                    hidden_neuron8_w          :weight_type;
signal                    hidden_neuron9_w          :weight_type;
signal                    hidden_neuron10_w         :weight_type;
signal                    output0                   : std_logic_vector(31 downto 0);
signal                    output1                   : std_logic_vector(31 downto 0);
signal                    output2                   : std_logic_vector(31 downto 0);
signal                    output3                   : std_logic_vector(31 downto 0);
signal                    output4                   : std_logic_vector(31 downto 0);
signal                    output5                   : std_logic_vector(31 downto 0);
signal                    output6                   : std_logic_vector(31 downto 0);
signal                    output7                   : std_logic_vector(31 downto 0);
signal                    output8                   : std_logic_vector(31 downto 0);
signal                    output9                   : std_logic_vector(31 downto 0);
signal                    output10                  : std_logic_vector(31 downto 0);
               
 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   signal median : std_logic_vector(7 downto 0);
   signal inputs_file:std_logic_vector(7 downto 0);
   signal weights_file:std_logic_vector(15 downto 0);
   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rcs_project PORT MAP (
           i_clk                  =>i_clk               ,
           START_ANN              =>START_ANN               ,
           inputs                 =>inputs              ,
           outlayer_neuron1_w     =>outlayer_neuron1_w  ,
           outlayer_neuron2_w     =>outlayer_neuron2_w  ,
           outlayer_neuron3_w     =>outlayer_neuron3_w  ,
           outlayer_neuron4_w     =>outlayer_neuron4_w  ,
           outlayer_neuron5_w     =>outlayer_neuron5_w  ,
           outlayer_neuron6_w     =>outlayer_neuron6_w  ,
           outlayer_neuron7_w     =>outlayer_neuron7_w  ,
           outlayer_neuron8_w     =>outlayer_neuron8_w  ,
           outlayer_neuron9_w     =>outlayer_neuron9_w  ,
           outlayer_neuron10_w    =>outlayer_neuron10_w ,
           hidden_neuron1_w       =>hidden_neuron1_w    ,
           hidden_neuron2_w       =>hidden_neuron2_w    ,
           hidden_neuron3_w       =>hidden_neuron3_w    ,
           hidden_neuron4_w       =>hidden_neuron4_w    ,
           hidden_neuron5_w       =>hidden_neuron5_w    ,
           hidden_neuron6_w       =>hidden_neuron6_w    ,
           hidden_neuron7_w       =>hidden_neuron7_w    ,
           hidden_neuron8_w       =>hidden_neuron8_w    ,
           hidden_neuron9_w       =>hidden_neuron9_w    ,
           hidden_neuron10_w      =>hidden_neuron10_w   ,
           output0                =>output0             ,
           output1                =>output1             ,
           output2                =>output2             ,
           output3                =>output3             ,
           output4                =>output4             ,
           output5                =>output5             ,
           output6                =>output6             ,
           output7                =>output7             ,
           output8                =>output8             ,
           output9                =>output9             
          -- output10               =>output10            
         );                       
   -- Clock process definitions
   clk_process :process
   begin
		i_clk <= '0';
		wait for clk_period/2;
		i_clk <= '1';
		wait for clk_period/2;
   end process;
 
 ----------------------------------input file from data set--------------------------------------
	process
	file inputfile : text open read_mode is "9_2.dat";
	variable rline : line;
	variable rdata : std_logic_vector(7 downto 0);
	variable row, column: integer :=0;
	variable good : boolean;
	variable i :integer:=0;
	begin
	
	wait until i_clk='1';
	while not endfile(inputfile)loop
	 
		readline(inputfile, rline);

		read(rline, rdata, good);
	
		inputs(i) <= rdata;
		i  := i+1;
     end loop;
	 START_ANN<='1';
	 wait;
end process;
---------------------------------weight file 1----------------------------------------------------
 process
        file inpfile : text open read_mode is "hidden_neuron_0_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron1_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 2 ----------------------------------------------------
process
        file inpfile : text open read_mode is "hidden_neuron_1_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron2_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 3----------------------------------------------------
process
        file inpfile : text open read_mode is "hidden_neuron_2_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron3_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 4----------------------------------------------------
process
        file inpfile : text open read_mode is "hidden_neuron_3_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron4_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 5----------------------------------------------------
 process
        file inpfile : text open read_mode is "hidden_neuron_4_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron5_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 6 ----------------------------------------------------
		process
        file inpfile : text open read_mode is "hidden_neuron_5_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron6_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 7----------------------------------------------------
		process
        file inpfile : text open read_mode is "hidden_neuron_6_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron7_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 8----------------------------------------------------
		process
        file inpfile : text open read_mode is "hidden_neuron_7_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron8_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 9----------------------------------------------------
		process
        file inpfile : text open read_mode is "hidden_neuron_8_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron9_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		---------------------------------weight file 10 ----------------------------------------------------
		process
        file inpfile : text open read_mode is "hidden_neuron_9_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            hidden_neuron10_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;

-------------------------------------output_neuron_0_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_0_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron1_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
		
-------------------------------------output_neuron_1_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_1_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron2_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;

-------------------------------------output_neuron_2_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_2_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron3_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;

-------------------------------------output_neuron_3_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_3_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron4_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;

-------------------------------------output_neuron_4_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_4_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron5_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
-------------------------------------output_neuron_5_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_5_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron6_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
-------------------------------------output_neuron_6_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_6_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron7_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
-------------------------------------output_neuron_7_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_7_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron8_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
-------------------------------------output_neuron_8_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_8_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron9_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;
-------------------------------------output_neuron_9_weights_bin-----------------------------------
process
        file inpfile : text open read_mode is "output_neuron_9_weights_bin.dat";
        variable rline : line;
        variable rdata : std_logic_vector(15 downto 0);
        variable row, column: integer :=0;
        variable good : boolean;
        variable j :integer:=0;
        begin
        
     wait until i_clk='1';
	   while not endfile (inpfile)loop
           
            readline(inpfile, rline);
    --        
            read(rline, rdata, good);
           -- weights_file <= rdata;
            outlayer_neuron10_w(j) <= rdata;
			j  := j+1;
		end loop;
		--file_close(inpfile);
		wait;
        end process;


END;
