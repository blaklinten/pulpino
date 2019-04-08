// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2015.1" *)
module xilinx_mem_8192x32(clka, rsta, ena, wea, addra, dina, douta);
  input clka;
  input rsta;
  input ena;
  input [3:0]wea;
  input [12:0]addra;
  input [31:0]dina;
  output [31:0]douta;
endmodule