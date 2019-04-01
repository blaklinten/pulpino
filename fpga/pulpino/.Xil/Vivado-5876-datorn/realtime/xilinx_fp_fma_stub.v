// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "floating_point_v7_0,Vivado 2015.1" *)
module xilinx_fp_fma(aclk, aresetn, s_axis_a_tvalid, s_axis_a_tdata, s_axis_b_tvalid, s_axis_b_tdata, s_axis_c_tvalid, s_axis_c_tdata, s_axis_operation_tvalid, s_axis_operation_tdata, m_axis_result_tvalid, m_axis_result_tdata, m_axis_result_tuser);
  input aclk;
  input aresetn;
  input s_axis_a_tvalid;
  input [31:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [31:0]s_axis_b_tdata;
  input s_axis_c_tvalid;
  input [31:0]s_axis_c_tdata;
  input s_axis_operation_tvalid;
  input [7:0]s_axis_operation_tdata;
  output m_axis_result_tvalid;
  output [31:0]m_axis_result_tdata;
  output [2:0]m_axis_result_tuser;
endmodule
