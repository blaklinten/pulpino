module multiply_long #(
  parameter mat_size = 2,
  parameter dat_size = 8
) (
  input  logic            start        ,
  input  logic            clk          , //kanske ej behövs
  input  logic [1023:0][7:0] mat_A ,
  input  logic [1023:0][7:0] mat_B ,
  output logic [1023:0][7:0] mat_C ,
  output logic            done
);

  always @(posedge clk)
    begin
      if(start) begin
        mat_C[5] <= mat_A[5]+mat_B[5];
        mat_C[6] <= mat_A[6]+mat_B[6];
        mat_C[7] <= mat_A[7]+mat_B[7];
        mat_C[8] <= mat_A[8]+mat_B[8];
      end
    end
endmodule
