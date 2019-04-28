module matrix_multiply #(
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
//      if(start) begin
        mat_C[0] <= mat_A[0]; //*mat_B[0];
        mat_C[1] <= mat_A[1]; //+mat_B[1];
        mat_C[2] <= mat_A[2]; //*mat_B[2];
        mat_C[3] <= mat_A[3]; //+mat_B[3];
//      end
    end
endmodule
