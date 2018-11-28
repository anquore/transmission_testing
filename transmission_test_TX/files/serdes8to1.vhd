-------------------------------------------------------------------------------------
-- Company:        LBNL / HEIA-FR
-- Engineer:       Queiroz Maic
-- E-Mail:         mqueiroz at lbl.gov
--                 maic.queiroz at edu.hefr.ch
-- Create Date:    22:09:13 07/03/2018
-- Design Name:
-- Module Name:    serdes1to8 - Behavioral
-- Project Name:   Pixel data-stream aggregator
-- Target Devices: Xilinx Kintex-7 KC705
-- Tool versions:  Xilinx Vivado v2017.4
-- Description:    The purpose of this VHDL component is to implement a 8 bit DDR
--                 serializer and to output data in differential.
--                 Note: Words are transmitted LSB first
-- Additional Comments:  -
--
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity serdes8to1 is
  port (
    -- Sys connect
    rst_i            : in  std_logic;
    clk_i            : in  std_logic;
    clkhigh_i        : in  std_logic;
    -- Inputs
    data8_i          : in  std_logic_vector(7 downto 0);
    -- Outputs
    TQ_o             : out std_logic;
    dataout_p        : out std_logic;
    dataout_n        : out std_logic;
    OFB_o : out std_logic
    --data_out : out std_logic
  );
end serdes8to1;

architecture Behavioral of serdes8to1 is
component ila_3
  port (
    -- Clock in ports
    clk        : in  std_logic;
    -- Clock out ports
    probe0            : in std_logic_vector(7 downto 0);
    probe1      : in std_logic_vector(7 downto 0)
   );
  end component ila_3;
  ----------------------------
  -- Signals
  ----------------------------  
  signal tx_data_out : std_logic;  -- OSERDESE2 ouptut
  signal not_clkhigh_i :std_logic;
  signal bitslip : std_logic;
  signal serdes :std_logic_vector (7 downto 0);
  signal OFB : std_logic;
  signal count : std_logic_vector (2 downto 0);
  constant countLess : unsigned(2 downto 0) := to_unsigned(5, 3);
  signal ready : std_logic;
  signal data8_to_send : std_logic_vector (7 downto 0);
begin
   not_clkhigh_i <= not clkhigh_i;
   data8_to_send(0) <=  not data8_i(0);
   data8_to_send(1) <=  not data8_i(1);
   data8_to_send(2) <=  not data8_i(2);
   data8_to_send(3) <=  not data8_i(3);
   data8_to_send(4) <=  not data8_i(4);
   data8_to_send(5) <=  not data8_i(5);
   data8_to_send(6) <=  not data8_i(6);
   data8_to_send(7) <=  not data8_i(7);
   
   --bitslip <= '0';

  -- OSERDESE2 mapping
  oserdes_m : OSERDESE2
  generic map(
    DATA_WIDTH => 8,               -- SERDES word width
    TRISTATE_WIDTH => 1,
    DATA_RATE_OQ => "DDR",         -- <SDR>, DDR
    DATA_RATE_TQ => "SDR",         -- <SDR>, DDR
    SERDES_MODE => "MASTER"        -- <DEFAULT>, MASTER, SLAVE
  )
  port map (
    OQ => tx_data_out,
    OCE => '1',
    CLK => clkhigh_i,
    RST => rst_i,
    CLKDIV => clk_i,
    D8 =>  data8_to_send(0),
    D7 =>  data8_to_send(1),
    D6 =>  data8_to_send(2),
    D5 =>  data8_to_send(3),
    D4 =>  data8_to_send(4),
    D3 =>  data8_to_send(5),
    D2 =>  data8_to_send(6),
    D1 =>  data8_to_send(7),
    TQ => TQ_o,
    T1 => '0',
    T2 => '0',
    T3 => '0',
    T4 => '0',
    TCE => '0',
    TBYTEIN => '0',
    TBYTEOUT => open,
    OFB => open,
    TFB => open,
    SHIFTOUT1 => open,
    SHIFTOUT2 => open,
    SHIFTIN1 => '0',
    SHIFTIN2 => '0'
  );
  
  --iserdes_m : ISERDESE2 generic map(
    --  DATA_WIDTH             => 8,             
    --  DATA_RATE              => "DDR",         
    --  SERDES_MODE            => "MASTER",
    --  OFB_USED => "TRUE",
    --  INTERFACE_TYPE         => "NETWORKING")     
  --port map (                      
    --  D               => '0',
    --  DDLY             => '0',
    --  CE1             => '1',
--      CE2             => '1',
--      CLK               => clkhigh_i,
--      CLKB            => not_clkhigh_i,
--      RST             => rst_i,
--      CLKDIV          => clk_i,
--      CLKDIVP          => '0',
--      OCLK            => '0',
--      OCLKB            => '0',
--      DYNCLKSEL            => '0',
--      DYNCLKDIVSEL          => '0',
--      SHIFTIN1         => '0',
--      SHIFTIN2         => '0',
--      BITSLIP         => bitslip,
--      O             => open,
--      Q8              => serdes(7),
--      Q7              => serdes(6),
--      Q6              => serdes(5),
--      Q5              => serdes(4),
--      Q4              => serdes(3),
--      Q3              => serdes(2),
--      Q2              => serdes(1),
--      Q1              => serdes(0),
--      OFB             => OFB,
--      SHIFTOUT1        => open,
--      SHIFTOUT2         => open);

--MapILA: ila_3 port map (
--            clk => clk_i,
--            probe0 => data8_i,
--            probe1 => serdes
--          );

 --  OBUFDS mapping
  io_data_out : OBUFDS
--  generic map (
--                 IOSTANDARD => "LVDS_25",
--                 SLEW => "FAST")
  port map (
    O => dataout_p,
    OB => dataout_n,
    I => tx_data_out
  );
  
--  counter_prcs : process (clk_i, rst_i)
--  begin
--    if rst_i = '1' then
--      count <= (others => '0');
--      bitslip <= '0';
--      ready <= '0';
--    elsif rising_edge(clk_i) then
--      if (unsigned(count) < countLess) then
--        count <= std_logic_vector(unsigned(count) + 1);
--        bitslip <= '0';
--        ready <= '0';
--     elsif ready = '0' and serdes /= x"7E" then
--       count <= (others => '0');
--       bitslip <= '1';
--       ready <= '0';
--     else
--       count <= count;
--       bitslip <= '0';
--       ready <= '1';
--      end if;
--    end if;
--  end process;
      
--  ready_prcs : process (clk_i, rst_i)
--  begin
--    if rst_i = '1' then
--      data8_to_send <= x"7E";
--    elsif rising_edge(clk_i) then
--      if (ready = '0') then
--        data8_to_send <= x"7E";   
--     else
--       data8_to_send <= data8_i; 
--      end if;
--    end if;
--  end process;
  
  --data_out <= tx_data_out;

end Behavioral;
