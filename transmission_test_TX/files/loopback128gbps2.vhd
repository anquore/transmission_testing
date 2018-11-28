-------------------------------------------------------------------------------------
-- Company:        LBNL / HEIA-FR
-- Engineer:       Queiroz Maic
-- E-Mail:         mqueiroz at lbl.gov
--                 maic.queiroz at edu.hefr.ch
-- Create Date:    19:49:23 07/10/2018
-- Design Name:
-- Module Name:    128gbpsloopback - Behavioral
-- Project Name:   Pixel data-stream aggregator
-- Target Devices: Xilinx Kintex-7 KC705
-- Tool versions:  Xilinx Vivado v2017.4
-- Description:    Real simulation mapping, to test alignement between tx and rx lanes
--
-- Additional Comments:  -
--
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library unisim;
use unisim.vcomponents.all;

entity loopback128gbps2 is
generic (
        g_NUM_LANES : integer range 1 to 4 := 1
    );
  Port (
    -- Sys connect
    rst_i            : in  std_logic;
    clkp_i           : in  std_logic;
    clkn_i           : in  std_logic;
    -- Inputs
    datain_p         : in  std_logic_vector(g_NUM_LANES - 1 downto 0);
    datain_n         : in  std_logic_vector(g_NUM_LANES - 1 downto 0);
    -- Outputs
    dataout_p        : out std_logic_vector(g_NUM_LANES - 1 downto 0);
    dataout_n        : out std_logic_vector(g_NUM_LANES - 1 downto 0);
    led0_o           : out std_logic;
    led1_o           : out std_logic;
    led2_o           : out std_logic;
    led3_o           : out std_logic;
    led4_o           : out std_logic;
    led5_o           : out std_logic;
    led6_o           : out std_logic;
    led7_o           : out std_logic
  );
end loopback128gbps2;

architecture Behavioral of loopback128gbps2 is
  ----------------------------
  -- Components
  ----------------------------
  component clk_gen
  port (
    -- Clock in ports
    clk200_i         : in  std_logic;
    -- Clock out ports
    clk_o            : out std_logic;
    clkidelay_o      : out std_logic;
    --clkhigh_o        : out std_logic;
    -- Status and control signals
    reset            : in  std_logic;
    locked           : out std_logic
  );
  end component clk_gen;
  
  component clk_gen_1
    port (
      -- Clock in ports
      clk200_i         : in  std_logic;
      -- Clock out ports
      --clk_o            : out std_logic;
      --clkidelay_o      : out std_logic;
      clkhigh_o        : out std_logic;
      -- Status and control signals
      reset            : in  std_logic;
      locked           : out std_logic
    );
    end component clk_gen_1;
  
  component ila_2
  port (
    -- Clock in ports
    clk        : in  std_logic;
    -- Clock out ports
    probe0            : in std_logic;
    probe1      : in std_logic
   );
  end component ila_2;
  
  component generator
  port (
    -- Sys connect
    rst_i            : in  std_logic;
    clk_i            : in  std_logic;
    -- Inputs
    read_i           : in  std_logic;
    -- Outputs
    data_o           : out std_logic_vector(65 downto 0)
  );
  end component generator;
  
  component aurora_tx_lane128
  port (
    -- Sys connect
    rst_i            : in  std_logic;
    clk_i            : in  std_logic;
    clkhigh_i        : in  std_logic;
    -- Inputs
    data66tx_i       : in  std_logic_vector(65 downto 0);
    -- Outputs
    read_o           : out std_logic;
    dataout_p        : out std_logic;
    dataout_n        : out std_logic;
    tx32 : out std_logic_vector(31 downto 0);
        tx8 : out std_logic_vector(7 downto 0)--;
--data_out : out std_logic
  );
  end component;
  
  component aurora_rx_lane
  port (
    -- Sys connect
    rst_n_i          : in std_logic;
    clk_rx_i         : in std_logic;
    clk_serdes_i     : in std_logic;
    -- Input
    rx_data_i_p      : in std_logic;
    rx_data_i_n      : in std_logic;
    -- Output
    rx_data_o        : out std_logic_vector(63 downto 0);
    rx_header_o      : out std_logic_vector(1 downto 0);
    rx_valid_o       : out std_logic;
    rx_stat_o        : out std_logic_vector(7 downto 0);
    rx32 : out std_logic_vector(31 downto 0);
    rx8 : out std_logic_vector(7 downto 0)
  );
  end component;
   
  component comparator
  port (
    -- Sys connect
    rst_i            : in  std_logic;
    clk_i            : in  std_logic;
    -- Inputs
    data66_i         : in  std_logic_vector(65 downto 0);
    data66_valid_i   : in  std_logic;
    -- Outputs
    ok_o             : out std_logic
  );
  end component;
  
  
   
  ----------------------------
  -- Signals
  ----------------------------
  signal clk200_s        : std_logic;                        -- 200 MHz clock (FPGA oscillator)
  signal clk_s           : std_logic;                        -- 160 MHz clock (System clock)
  signal clkhigh_s       : std_logic;                        -- 640 MHz clock (Serdes clock)
  signal clkidelay_s     : std_logic;                        -- 300 MHz clock (IDELAYCTRL)
  signal locked_s        : std_logic;                        -- MMCM Locked
  signal locked_s_1        : std_logic;                        -- MMCM Locked
  signal read_s          : std_logic_vector(g_NUM_LANES - 1 downto 0);                        -- TX lane Read block
  type tx_data_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(65 downto 0);
  signal tx_data_s : tx_data_array;
  --signal tx_data_s       : std_logic_vector(65 downto 0);    -- TX Header + Block
  type rx_data_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(63 downto 0);
  signal rx_data_s : rx_data_array;
  --signal rx_data_s       : std_logic_vector(63 downto 0);    -- RX Block
  type rx_header_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(1 downto 0);
  signal rx_header_s : rx_header_array;
  --signal rx_header_s     : std_logic_vector(1 downto 0);     -- RX Header
  signal rx_valid_s      : std_logic_vector(g_NUM_LANES - 1 downto 0);                        -- RX valid block flag
  type rx_status_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(7 downto 0);
  signal rx_stat_s : rx_status_array;
  --signal rx_stat_s       : std_logic_vector(7 downto 0);     -- RX status
  type rx_data66_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(65 downto 0);
  signal rxdata66_s : rx_data66_array;
  --signal rxdata66_s      : std_logic_vector(65 downto 0);    -- RX Header + Block
  signal ok_s            : std_logic;                        -- Comparator valid sequence flag
  signal idelay_rst_s    : std_logic;                        -- TX Reset (depends on IDELAYCTRL)
  
  ----------------------------
  -- IODELAY 
  ----------------------------
  attribute IODELAY_GROUP: STRING;
 -- attribute IODELAY_GROUP of IDELAYCTRL_inst : label is "aurora";
  signal idelay_rdy_s    : std_logic;
  
  type tx32_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(31 downto 0);
  signal tx32 : tx32_array;
  --signal tx32 :  std_logic_vector(31 downto 0);
  type tx8_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(7 downto 0);
  signal tx8 : tx8_array;
  --signal    tx8 :  std_logic_vector(7 downto 0);
  type rx32_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(31 downto 0);
  signal rx32 : rx32_array;
  --signal rx32 :  std_logic_vector(31 downto 0);
  type rx8_array is array (g_NUM_LANES - 1 downto 0) of std_logic_vector(7 downto 0);
  signal rx8 : rx8_array;
  --signal    rx8 :  std_logic_vector(7 downto 0);
  signal simple : std_logic_vector(65 downto 0);                       -- TX Reset (depends on IDELAYCTRL)
  signal current_data_s : std_logic_vector(2 downto 0);
  signal single_out : std_logic;
  signal single_out_r : std_logic;
  signal single_in : std_logic_vector (g_NUM_LANES - 1 downto 0);
  
  ----------------------------
  -- IODELAY 
  ----------------------------
  --attribute IODELAY_GROUP: STRING;
  --attribute IODELAY_GROUP of IDELAYCTRL_inst : label is "aurora";
  --signal idelay_rdy_s    : std_logic;
  
begin



  -- IBUFDS for the LVDS input clock
  Map0IBUFDSclk : IBUFDS
  port map (
    O => clk200_s,
    I => clkp_i,
    IB => clkn_i
  );
   -- Clock  generation (IDELAYCTRL, system, serialization)
   Map0clk: clk_gen port map (
     clk200_i => clk200_s,
     clk_o => clk_s,
     clkidelay_o => clkidelay_s,
     --clkhigh_o => clkhigh_s,
     reset => rst_i,
     locked => locked_s
   );
   Map1clk: clk_gen_1 port map (
         clk200_i => clk200_s,
         --clk_o => clk_s,
         --clkidelay_o => clkidelay_s,
         clkhigh_o => clkhigh_s,
         reset => rst_i,
         locked => locked_s_1
       );
  
  lane_loop: for I in 0 to g_NUM_LANES - 1 generate
  Map0IBUFDSdata : IBUFDS
  port map (
    O => single_in(I),
    I => datain_p(I),
    IB => datain_n(I)
  );
  
  Map0OBUFDSclk : OBUFDS
  port map (
    I => single_out,
    O => dataout_p(I),
    OB => dataout_n(I)
  );


 MapILA: ila_2 port map (
            clk => clk_s,
            probe0 => single_in(I),
            probe1 => single_out
          );
  
  counter_prcs : process (clk_s, rst_i)
  begin
    if rst_i = '1' then
      current_data_s <= (others => '0');
      single_out <= '0';
      single_out_r <= single_out;
    elsif rising_edge(clk_s) then
      if current_data_s = "001" or current_data_s = "101" then
        current_data_s <= std_logic_vector(unsigned(current_data_s) + 1);
        single_out <= '1';
        single_out_r <= single_out;
      else
        current_data_s <= std_logic_vector(unsigned(current_data_s) + 1);
        single_out <= '0';
        single_out_r <= single_out;
      end if;
    end if;
  end process;
  end generate lane_loop;
  
  -- LED STATUS:
  -- rx_stat_s 2 to 7 --> unused
  -- rx_stat_s(0) --> XAPP1017 lock
  -- rx_stat_s(1) --> RX gearbox synchronized (after 32 valid blocks)
  led0_o <= '0';--rx_stat_s(0);
    led1_o <= '0';--rx_stat_s(1);
    led2_o <= '0';--rx_stat_s(2);
    led3_o <= '0';--rx_stat_s(3);
    led4_o <= '0';--rx_stat_s(4);
    led5_o <= '0';--rx_stat_s(5);
    led6_o <= '0';--rx_stat_s(6);
    led7_o <= single_out_r xnor single_in(0);--rx_stat_s(7) or ok_s;
  
end Behavioral;
