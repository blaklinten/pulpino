module matrix_multiply #(
  parameter mat_size = 2,
  parameter dat_size = 8
) (
  // input  logic            start        ,
  // output logic            done         ,
  input  logic            clk          , 
  input  logic [1023:0][7:0] mat_A ,
  input  logic [1023:0][7:0] mat_B ,
  output logic [1023:0][15:0] mat_C
);

  always @(posedge clk)
  begin
  
    mat_C[0] <= 
              mat_A[0] * mat_B[0] +
              mat_A[1] * mat_B[3] +
              mat_A[2] * mat_B[6];
    mat_C[1] <= 
              mat_A[0] * mat_B[1] +
              mat_A[1] * mat_B[4] +
              mat_A[2] * mat_B[7];
    mat_C[2] <= 
              mat_A[0] * mat_B[2] +
              mat_A[1] * mat_B[5] +
              mat_A[2] * mat_B[8];
    mat_C[3] <= 
              mat_A[3] * mat_B[0] +
              mat_A[4] * mat_B[3] +
              mat_A[5] * mat_B[6];
    mat_C[4] <= 
              mat_A[3] * mat_B[1] +
              mat_A[4] * mat_B[4] +
              mat_A[5] * mat_B[7]; 
    mat_C[5] <= 
              mat_A[3] * mat_B[2] +
              mat_A[4] * mat_B[5] +
              mat_A[5] * mat_B[8]; 
    mat_C[6] <= 
              mat_A[6] * mat_B[0] +
              mat_A[7] * mat_B[3] +
              mat_A[8] * mat_B[6];
    mat_C[7] <= 
              mat_A[6] * mat_B[1] +
              mat_A[7] * mat_B[4] +
              mat_A[8] * mat_B[7]; 
    mat_C[8] <= 
              mat_A[6] * mat_B[2] +
              mat_A[7] * mat_B[5] +
              mat_A[8] * mat_B[8];         
endmodule
