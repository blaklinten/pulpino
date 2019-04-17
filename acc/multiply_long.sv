module multiply_long #(
  parameter mat_size = 2,
  parameter dat_size = 8
) (
  input  logic            start        ,
  input  logic            clk          , //kanske ej behövs
  input  logic [3:0][7:0] mat_A [255:0],
  input  logic [3:0][7:0] mat_B [255:0],
  output logic [3:0][7:0] mat_C [255:0],
  output logic            done
);

  always @(posedge clk)
  begin
    if(start) begin
    mat_C[0][0] <= mat_A[0][0];
              end
endmodule
