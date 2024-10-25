
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- use ieee.std_logic_signed.all;
-- use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

use ieee.std_logic_signed.all;
package regs_package is
type   RegisterDataType is array (natural range<>) of  std_logic_vector(31 downto 0);
 type    datain_type is array (0 to 783)of std_logic_vector(7 downto 0);
 type    datain_type_out_layer is array (0 to 9)of signed(23 downto 0);
 type    weight_type is array (0 to 783) of std_logic_vector(15 downto 0);
 type    weight_type_out_layer is array (0 to 9) of std_logic_vector(15 downto 0);
  
 end regs_package;
 --signal neuron_1_w    :  my_type;

package body regs_package is

 
end regs_package;
