module matrix_multiply #(
) (
  input  logic            clk   , 
  input  logic [3:0][7:0] mat_A ,
  input  logic [3:0][7:0] mat_B ,
  output logic [3:0][7:0] mat_C
);

  always @(posedge clk)
  begin
  
    mat_C[0] <= 
              mat_A[0] * mat_B[0] +
              mat_A[1] * mat_B[2];
    mat_C[1] <= 
              mat_A[0] * mat_B[1] +
              mat_A[1] * mat_B[3];
    mat_C[2] <= 
              mat_A[2] * mat_B[0] +
              mat_A[3] * mat_B[2];
    mat_C[3] <= 
              mat_A[2] * mat_B[1] +
              mat_A[3] * mat_B[3];
    end         
endmodule
