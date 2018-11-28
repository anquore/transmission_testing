proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7k325tffg900-2
  set_property board_part xilinx.com:kc705:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/dsmith/Desktop/transmission_test/project_1/project_1.cache/wt [current_project]
  set_property parent.project_path /home/dsmith/Desktop/transmission_test/project_1/project_1.xpr [current_project]
  set_property ip_repo_paths /home/dsmith/Desktop/transmission_test/project_1/project_1.cache/ip [current_project]
  set_property ip_output_repo /home/dsmith/Desktop/transmission_test/project_1/project_1.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.runs/synth_1/loopback128gbps.dcp
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.dcp]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_0.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_0.dcp]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1.dcp]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_1/ila_1.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_1/ila_1.dcp]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_2/ila_2.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_2/ila_2.dcp]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_3/ila_3.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_3/ila_3.dcp]
  add_files -quiet /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3.dcp
  set_property netlist_only true [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3.dcp]
  read_xdc -mode out_of_context -ref clk_gen -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_gen -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_board.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_board.xdc]
  read_xdc -ref clk_gen -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen.xdc]
  read_xdc -mode out_of_context -ref ila_0 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]
  read_xdc -ref ila_0 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref clk_gen_1 -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_gen_1 -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_board.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_board.xdc]
  read_xdc -ref clk_gen_1 -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1.xdc]
  read_xdc -mode out_of_context -ref ila_1 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_1/ila_1_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_1/ila_1_ooc.xdc]
  read_xdc -ref ila_1 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_1/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_1/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref ila_2 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_2/ila_2_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_2/ila_2_ooc.xdc]
  read_xdc -ref ila_2 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_2/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_2/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref ila_3 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_3/ila_3_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_3/ila_3_ooc.xdc]
  read_xdc -ref ila_3 -cells U0 /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_3/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_3/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref clk_wiz_3 -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3_ooc.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_3 -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3_board.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3_board.xdc]
  read_xdc -ref clk_wiz_3 -cells inst /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3.xdc
  set_property processing_order EARLY [get_files /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3.xdc]
  read_xdc /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/constrs_1/new/testing.xdc
  link_design -top loopback128gbps -part xc7k325tffg900-2
  write_hwdef -file loopback128gbps.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force loopback128gbps_opt.dcp
  report_drc -file loopback128gbps_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force loopback128gbps_placed.dcp
  report_io -file loopback128gbps_io_placed.rpt
  report_utilization -file loopback128gbps_utilization_placed.rpt -pb loopback128gbps_utilization_placed.pb
  report_control_sets -verbose -file loopback128gbps_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force loopback128gbps_routed.dcp
  report_drc -file loopback128gbps_drc_routed.rpt -pb loopback128gbps_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file loopback128gbps_timing_summary_routed.rpt -rpx loopback128gbps_timing_summary_routed.rpx
  report_power -file loopback128gbps_power_routed.rpt -pb loopback128gbps_power_summary_routed.pb -rpx loopback128gbps_power_routed.rpx
  report_route_status -file loopback128gbps_route_status.rpt -pb loopback128gbps_route_status.pb
  report_clock_utilization -file loopback128gbps_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force loopback128gbps.mmi }
  write_bitstream -force loopback128gbps.bit 
  catch { write_sysdef -hwdef loopback128gbps.hwdef -bitfile loopback128gbps.bit -meminfo loopback128gbps.mmi -file loopback128gbps.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

