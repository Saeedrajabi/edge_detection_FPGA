----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:13:47 07/15/2020 
-- Design Name: 
-- Module Name:    MNode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
use work.GenericArrays_pkg.all;

entity MNode is
port (
    clk     : in std_logic;
    m_in    : in hQArray;
    bias    : in sfixed(littleM downto littleN);
    m_out   : out mQArray
);
end MNode;

architecture behavioral of MNode is

signal inputSum : sfixed(littleM downto littleN);
signal reluVal : sfixed(littleM downto littleN);

begin

sum:process(m_in, bias)
variable temp : sfixed(littleM downto littleN);
begin
    temp := bias;
    for val in m_in'reverse_range loop
        temp := resize(temp + m_in(val), temp);
    end loop;
    inputSum <= temp;
end process sum;

relu:process(clk)
begin
    if clk'event and clk = '1' then
        if inputSum < to_sfixed(0, inputSum) then
            reluVal <= to_sfixed(0, reluVal);
        else
            reluVal <= to_sfixed(1, reluVal);
        end if;
    end if;
end process relu;

output:process(reluVal)
begin
    for x in 0 to M - 1 loop
        m_out(x) <= resize(reluVal, littleM, littleN);
    end loop;
end process output;

end behavioral;
