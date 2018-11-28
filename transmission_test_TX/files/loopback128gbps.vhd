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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim ;
use unisim.vcomponents.all ;

entity loopback128gbps is
generic (
        g_NUM_LANES : integer range 1 to 4 := 4
    );
  Port (
    -- Sys connect
    rst_i            : in  std_logic;
    clkp_i           : in  std_logic;
    clkn_i           : in  std_logic;
    -- Inputs
    --datain_p         : in  std_logic_vector(g_NUM_LANES - 1 downto 0);
    --datain_n         : in  std_logic_vector(g_NUM_LANES - 1 downto 0);
    -- Outputs
    dataout_p        : out std_logic_vector(g_NUM_LANES - 1 downto 0);
    dataout_n        : out std_logic_vector(g_NUM_LANES - 1 downto 0);
--    rsta_o : out std_logic;
--    rstb_o : out std_logic;
    led0_o           : out std_logic;
    led1_o           : out std_logic;
    led2_o           : out std_logic;
    led3_o           : out std_logic;
    led4_o           : out std_logic;
    led5_o           : out std_logic;
    led6_o           : out std_logic;
    led7_o           : out std_logic;
--    sda_o            : out  std_logic;
--    scl_o            : out  std_logic;
--    latch_o            : out  std_logic;
--    sdi_i            : in  std_logic;
    button : in std_logic
--    clkp_o : out std_logic;
--    clkn_o : out std_logic
  );
end loopback128gbps;

architecture Behavioral of loopback128gbps is
  ----------------------------
  -- Components
  ----------------------------
  component clk_gen
    port (
      -- Clock in ports
      clk200_i         : in  std_logic;
      -- Clock out ports
  
      clk_out1            : out std_logic;
      clk_out2        : out std_logic;
      clk_o            : out std_logic;
      clk_out4            : out std_logic;
      clk_out5        : out std_logic;
      clkhigh_o        : out std_logic;
      clkidelay_o      : out std_logic;
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
    
    
     component clk_wiz_3
     port (
       -- Clock in ports
       clk_in1         : in  std_logic;
       -- Clock out ports
       clk_out1            : out std_logic;

       -- Status and control signals
       reset            : in  std_logic;
       locked           : out std_logic
     );
     end component clk_wiz_3;
     
  
  component ila_0
  port (
    -- Clock in ports
    clk        : in  std_logic;
    -- Clock out ports
    probe0            : in std_logic_vector(65 downto 0);
    probe1      : in std_logic_vector(65 downto 0);
    probe2            : in std_logic_vector(31 downto 0);
    probe3      : in std_logic_vector(31 downto 0);
    probe4            : in std_logic_vector(7 downto 0);
    probe5      : in std_logic_vector(7 downto 0);
    probe6 : in std_logic;
    probe7 :in std_logic--;
    --probe8 :in std_logic;
    --probe9 :in std_logic
   );
  end component ila_0;
  
  component ila_3
    port (
      -- Clock in ports
      clk        : in  std_logic;
      -- Clock out ports
      probe0            : in std_logic_vector(23 downto 0);
      probe1      : in std_logic_vector(23 downto 0);
      probe2            : in std_logic;
      probe3      : in std_logic;
      probe4            : in std_logic;
      probe5      : in std_logic;
      probe6      : in std_logic
     );
    end component ila_3;
  
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
        tx8 : out std_logic_vector(7 downto 0);
        OFB_o : out std_logic
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
    rx8 : out std_logic_vector(7 downto 0);
    OFB_i : in std_logic
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
  signal clk1_s           : std_logic;                        -- 160 MHz clock (System clock)
  signal clkhigh1_s       : std_logic;                        -- 640 MHz clock (Serdes clock)
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
  signal ok_s            : std_logic_vector(3 downto 0);                        -- Comparator valid sequence flag
  signal idelay_rst_s    : std_logic;                        -- TX Reset (depends on IDELAYCTRL)
  
  ----------------------------
  -- IODELAY 
  ----------------------------
  --attribute IODELAY_GROUP: STRING;
  --attribute IODELAY_GROUP of IDELAYCTRL_inst : label is "aurora";
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
  signal simple : std_logic_vector(65 downto 0);
  signal full_reset :std_logic;
  signal reset_delayed :std_logic;
  signal not_reset_delayed :std_logic;
  signal count : std_logic_vector (1 downto 0);
  
  constant countLess : unsigned(1 downto 0) := to_unsigned(3, 2);
  signal OFB: std_logic_vector (3 downto 0);
  signal sreg : std_logic_vector(23 downto 0);
  signal check : std_logic_vector(23 downto 0);
  signal go :std_logic;
  signal go1 :std_logic;
  signal counting :std_logic_vector (7 downto 0);
  signal count2 :std_logic_vector (7 downto 0);
  signal output : std_logic_vector(7 downto 0);
  
  signal sda_s            :   std_logic;
  signal scl_s            :   std_logic;
  signal latch_s            :   std_logic;
  signal sda_s1            :   std_logic;
  signal scl_s1            :   std_logic;
  signal latch_s1            :   std_logic;
  signal sdi_s            :   std_logic;
  signal rst_n : std_logic;
  signal bitslip : std_logic;
  signal flip : std_logic;
  signal xilinxIsRetarded : std_logic;
  signal clk250_s :std_logic;
  signal first_locked : std_logic;
  signal clk_out1s :std_logic;
    signal clk_out2s :std_logic;
    signal clk_out4s :std_logic;
    signal clk_out5s :std_logic;
    signal count_clk1: std_logic_vector (3 downto 0);
     signal count_clk2: std_logic_vector (3 downto 0);
      signal count_clk4: std_logic_vector (3 downto 0);
       signal count_clk5: std_logic_vector (3 downto 0);
  
begin

  -- XAPP1017 / RX Lane reset, depends directly on the the IDELAY
  idelay_rst_s <= not(rst_i) and locked_s;-- and first_locked;-- and idelay_rdy_s;
  simple(63 downto 0) <= x"E000_0000_0000_0000";
  simple(65 downto 64) <= "01";
  full_reset <= rst_i or (not locked_s) or (not locked_s_1);
  not_reset_delayed <= not reset_delayed;
  
--  OBUFrsta : OBUF
--           port map (
--             I => idelay_rst_s,
--             O => rsta_o
--           );
           
--   OBUFrstb : OBUF
--              port map (
--                I => idelay_rst_s,
--                O => rstb_o
--              );
  
  counter_prcs : process (clk_s, rst_i)
    begin
      if rst_i = '1' then
        count <= (others => '0');
        reset_delayed <= '1';
      elsif rising_edge(clk_s) then
        if full_reset = '1' then
          count <= (others => '0');
          reset_delayed <= '1';
        elsif (unsigned(count) < countLess and full_reset = '0') then
          count <= std_logic_vector(unsigned(count) + 1);
          reset_delayed <= '1';
      else
         count <= count;
         reset_delayed <= '0';
        end if;
      end if;
    end process;
   
  -- IDELAYCTRL required for XAPP1017
-- IDELAYCTRL_inst : IDELAYCTRL
--  port map (
--    RDY => idelay_rdy_s,      -- 1-bit output: Ready output
--   REFCLK => clkidelay_s,    -- 1-bit input: Reference clock input
--    RST => rst_i              -- 1-bit input: Active high reset input
--  );
  


  -- IBUFDS for the LVDS input clock
  Map0IBUFDSclk : IBUFGDS
  port map (
    O => clk200_s,
    I => clkp_i,
    IB => clkn_i
  );   
  
--  firstclk: clk_wiz_3
--       port map(
--         -- Clock in ports
--         clk_in1  =>  clk200_s,  
--         -- Clock out ports
--         clk_out1      => clk250_s,
  
--         -- Status and control signals
--         reset   => rst_i, 
--         locked => first_locked
--       );
  
--  Map0OBUFDSclk : OBUFDS
--    port map (
--      I => clk250_s,
--      O => clkp_o,
--      OB => clkn_o
--    ); 
   
--   counter_prcs1 : process (clk_s, idelay_rst_s)
--       begin
--         if idelay_rst_s = '0' then
--           sreg <= x"080000";
--           --sda_s <= sreg(23);
--           counting <= (others => '0');
--           go <= '0';
--           check <= x"F80000";
--           flip <= '0';
--         elsif rising_edge(clk_s) then
--           sda_s <= sreg(23);
--             -- sda_s <= '0';
           
--           if (unsigned(counting) <= to_unsigned(48, 8) and counting(0) = '1') then
--             latch_s <= '0';
--             counting <= std_logic_vector(unsigned(counting) + 1);
--             sreg <= sreg(22 downto 0) & sreg(23);
--             flip <= flip;
--             scl_s <= '1';
--           elsif (unsigned(counting) <= to_unsigned(48, 8) and counting(0) = '0') then
--              latch_s <= '0';
--              counting <= std_logic_vector(unsigned(counting) + 1);
--              sreg <= sreg;
--              flip <= flip;
--              scl_s <= '0';
--           else
--             counting <= (others => '0');
--             latch_s <= '1';
--             scl_s <= '0';
--             flip <= not flip;
--           end if;
           
--          -- if (bitslip = '1' and flip = '1') then
--            -- check <= check;
--           --else
--            -- check <= check (22 downto 0) & sdi_i;
--          -- end if;
           
--         end if;
--       end process;
    
    bitslip <= '1' when (unsigned(counting) = to_unsigned(0, 8)) and (check /= sreg) else '0';
   
   --scl_s <= clk_s and go; --and not (bitslip and flip);
   --latch_s <= clk_s and go1;-- and not (bitslip and flip);
   --sda_s <= button;
   
--   counter_prcs2 : process (clkhigh_s, idelay_rst_s)
--          begin
--            if idelay_rst_s = '0' then
--              scl_s1 <= '0';
--              latch_s1 <= '0';
--              sda_s1 <= '0';
--            elsif rising_edge(clkhigh_s) then
--              scl_s1 <= scl_s;
--              latch_s1 <= latch_s;
--              sda_s1 <= sda_s;
              
--            end if;
--          end process;
   
   
--   OBUF0 : OBUF
--         port map (
--           I => scl_s,
--           O => scl_o
--         );
         
--     OBUF1 : OBUF
--              port map (
--                I => latch_s,
--                O => latch_o
--              );
              
--      OBUF2 : OBUF
--               port map (
--                 I => sda_s,
--                 O => sda_o
--               );


  -- Clock  generation (IDELAYCTRL, system, serialization)
  Map0clk: clk_gen port map (
      clk200_i => clk200_s,
      clk_o => clk_s,
      clkidelay_o => clkidelay_s,
      clkhigh_o => clkhigh_s,
      --clk1_o => clk1_s,
      --clkhigh1_o => clkhigh1_s,
      clk_out1 => clk_out1s,
      clk_out2 => clk_out2s,
      clk_out4 => clk_out4s,
      clk_out5 => clk_out5s,
      reset => rst_i,
      locked => locked_s
    );
  
--  Map1clk: clk_gen_1 port map (
--      clk200_i => clk200_s,
--      --clk_o => clk_s,
--      --clkidelay_o => clkidelay_s,
--      clkhigh_o => clkidelay_s,
--      reset => rst_i,
--      locked => locked_s_1
--    );
    
--    MapILA: ila_3 port map (
--                clk => clk_s,
--                probe0 => sreg,
--                probe1 => check,
--                probe2 => scl_s,
--                probe3 => sda_s,
--                probe4 => button,
--                probe5 => latch_s,
--                probe6 => sdi_i
--              );
  
  lane_loop: for I in 0 to g_NUM_LANES - 1 generate
      Map1: generator port map (
        rst_i => rst_i,
        clk_i => clk_s,
        read_i => read_s(I),
        data_o => tx_data_s(I)
      );
      MapILA: ila_0 port map (
            clk => clk_s,
            probe0 => tx_data_s(I),
            probe1 => (others => '0'),--rxdata66_s(I),
            probe2 => tx32(I),
            probe3 => (others => '0'),--rx32(I),
            probe4 => tx8(I),
            probe5 => (others => '0'),--rx8(I),
            probe6 => reset_delayed,
            probe7 => '0'--rx_valid_s(I)--,
            --probe8 => data_in(I),
            --probe9 => data_out(I)
          );
              -- Aurora 1.28GBps TX Lane
        Map2: aurora_tx_lane128 port map (
          rst_i => rst_i,
          clk_i => clk_s,
          clkhigh_i => clkhigh_s,
          data66tx_i => tx_data_s(I),
          read_o => read_s(I),
          dataout_p => dataout_p(I),
          dataout_n => dataout_n(I),
          tx32 => tx32(I),
          tx8 => tx8(I),
          OFB_o => OFB(I)
        );
          
        -- Aurora RX Lane
--        Map3: aurora_rx_lane port map (
--          rst_n_i => idelay_rst_s, --not_reset_delayed
--          clk_rx_i => clk_s, 
--          clk_serdes_i => clkhigh_s, 
--          rx_data_i_p => datain_p(I), 
--          rx_data_i_n => datain_n(I), 
--          rx_data_o => rx_data_s(I), 
--          rx_header_o => rx_header_s(I), 
--          rx_valid_o => rx_valid_s(I), 
--          rx_stat_o => rx_stat_s(I),
--          rx32 => rx32(I),
--          rx8 => rx8(I),
--          OFB_i => OFB(I)
--        );
        
--        -- Header and block concatenation
--        rxdata66_s(I) <= rx_header_s(I) & rx_data_s(I);
        
--        Map4: comparator port map (
--          rst_i => rst_i,
--          clk_i => clk_s,
--          data66_i => rxdata66_s(I),
--          data66_valid_i => rx_valid_s(I),
--          ok_o => ok_s(I)
--        );
  end generate lane_loop;
  
  
  
  -- Comparator (validate the counter sequence)

  
  -- LED STATUS:
  -- rx_stat_s 2 to 7 --> unused
  -- rx_stat_s(0) --> XAPP1017 lock
  -- rx_stat_s(1) --> RX gearbox synchronized (after 32 valid blocks)
  led0_o <= '0';--rx_stat_s(0)(0) and rx_stat_s(1)(0) and rx_stat_s(2)(0) and rx_stat_s(3)(0);
  led1_o <= '0';--rx_stat_s(0)(1) and rx_stat_s(1)(1) and rx_stat_s(2)(1) and rx_stat_s(3)(1);
  led2_o <= '0';--rx_stat_s(2);
  led3_o <= '0';--rx_stat_s(3);
  led4_o <= '0';--rx_stat_s(4);
  led5_o <= '0';--rx_stat_s(5);
  led6_o <= '0';--rx_stat_s(6);
  led7_o <= '0';--(rx_stat_s(0)(7) and rx_stat_s(1)(7) and rx_stat_s(2)(7) and rx_stat_s(3)(7)) or (ok_s(0) and ok_s(1) and ok_s(2) and ok_s(3));
  
end Behavioral;
