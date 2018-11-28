onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/rst_i
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/clk200_s
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/clk_s
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/clkhigh_s
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/clkidelay_s
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/clkn_i
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/clkp_i
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/datain_n
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/dataout_n
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/datain_p
add wave -noupdate -expand -group {Clocks and Serial Data} /RXandTX_tb/dut/dataout_p
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/idelay_rdy_s
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/idelay_rst_s
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led0_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led1_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led2_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led3_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led4_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led5_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led6_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/led7_o
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/locked_s
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/ok_s
add wave -noupdate -group {Top Level Extra} /RXandTX_tb/dut/read_s
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rx32
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rx8
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rx_data_s
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rx_header_s
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rx_stat_s
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rx_valid_s
add wave -noupdate -expand -group {Top Level RX} /RXandTX_tb/dut/rxdata66_s
add wave -noupdate -expand -group {Top Level TX} /RXandTX_tb/dut/tx32
add wave -noupdate -expand -group {Top Level TX} /RXandTX_tb/dut/tx8
add wave -noupdate -expand -group {Top Level TX} /RXandTX_tb/dut/tx_data_s
add wave -noupdate /RXandTX_tb/sda_o
add wave -noupdate /RXandTX_tb/scl_o
add wave -noupdate /RXandTX_tb/latch_o
add wave -noupdate /RXandTX_tb/sdi_i
add wave -noupdate /RXandTX_tb/sreg
add wave -noupdate /RXandTX_tb/dut/bitslip
add wave -noupdate /RXandTX_tb/dut/flip
add wave -noupdate /RXandTX_tb/dut/sreg
add wave -noupdate /RXandTX_tb/dut/check
add wave -noupdate /RXandTX_tb/dut/rsta_o
add wave -noupdate /RXandTX_tb/dut/rstb_o
add wave -noupdate /RXandTX_tb/count1
add wave -noupdate /RXandTX_tb/sreg1
add wave -noupdate /RXandTX_tb/dut/go
add wave -noupdate /RXandTX_tb/dut/go1
add wave -noupdate /RXandTX_tb/dut/sda_s1
add wave -noupdate /RXandTX_tb/dut/scl_s1
add wave -noupdate /RXandTX_tb/dut/latch_s1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1259646281 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 99
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {301834529 ps} {2615706077 ps}
