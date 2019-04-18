// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "config.sv"

module sp_ram_wrap #(
  parameter RAM_SIZE   = 32768           , // in bytes
  parameter ADDR_WIDTH = $clog2(RAM_SIZE),
  parameter DATA_WIDTH = 32
) (
  // Clock and Reset
  input  logic                         clk               ,
  input  logic                         rstn_i            ,
  input  logic                         en_i              ,
  input  logic [  ADDR_WIDTH-1:0]      addr_i            ,
  input  logic [  DATA_WIDTH-1:0]      wdata_i           ,
  output logic [  DATA_WIDTH-1:0]      rdata_o           ,
  input  logic                         we_i              ,
  input  logic [DATA_WIDTH/8-1:0]      be_i              ,
  input  logic                         bypass_en_i       
);

  logic mem_read    [DATA_WIDTH-1:0];
  logic mem_write   [DATA_WIDTH-1:0];
  logic acc_data_out[DATA_WIDTH-1:0];
  logic acc_data_in [DATA_WIDTH-1:0];

  xilinx_mem_8192x32 sp_ram_i (
    .clka (clk                   ),
    .rsta (1'b0                  ), // reset is active high
    
    .ena  (en_i                  ),
    .addra(addr_i[ADDR_WIDTH-1:2]),
    .dina (mem_write             ),
    .douta(mem_read              ),
    .wea  (be_i & {4{we_i}}      )
  );

  data_to_acc data_to_acc_i (
    .addr     (addr_i       ),
    .data_in  (acc_data_in  ),
    .data_out (acc_data_out),
    .clk (clk)
  );


  always @(posedge clk) begin
    if(addr_i>= 32'h000003FF & addr_i<=32'h00000C00) begin
      rdata_o <= acc_data_out;
      acc_data_in <= wdata_i;
    end
    else begin
      rdata_o <= mem_read;
      mem_write <= wdata_i;
    end








  endmodule
