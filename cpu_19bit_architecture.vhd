----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2024 22:43:08
-- Design Name: 
-- Module Name: cpu_19bit_architecture - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu_19bit_architecture is
 Port (
   A        : in  std_logic_vector(18 downto 0);  -- Operand 1
   B        : in  std_logic_vector(18 downto 0);  -- Operand 2
   
   ctrl_alu : in  std_logic_vector(3 downto 0);   -- ALU control signal
   Result   : out std_logic_vector(18 downto 0);  -- ALU result
   Zero     : out std_logic                      -- Zero flag
 );
end entity;
architecture Behavioral of cpu_19bit_architecture is
begin
  process(A, B, ctrl_alu)
  begin
    case ctrl_alu is
      when "0000" => Result <= std_logic_vector(signed(A) + signed(B)); -- ADD
      when "0001" => Result <= std_logic_vector(signed(A) - signed(B)); -- SUB
      when "0010" => Result <= std_logic_vector(signed(A) * signed(B)); -- MUL
      when "0011" => Result <= std_logic_vector(signed(A) / signed(B)); -- DIV
      when "0100" => Result <= std_logic_vector(signed(A) + 1);         -- INC
      when "0101" => Result <= std_logic_vector(signed(A) - 1);         -- DEC
      when "0110" => Result <= A and B;                                -- AND
      when "0111" => Result <= A or B;                                 -- OR
      when "1000" => Result <= A xor B;                                -- XOR
      when "1001" => Result <= not A;                                  -- NOT
      when others => Result <= (others => '0');
    end case;

  end process;
end Behavioral;