module top_acc (
  input  logic            clk        ,
  output logic [3:0][7:0] acc_out ,
  input  logic [3:0][7:0] acc_in_A,
  input  logic [3:0][7:0] acc_in_B
);
  matrix_multiply matrix_multiply_i (
    .mat_C      (acc_out ),
    .mat_A      (acc_in_A),
    .mat_B      (acc_in_B),
    .clk        (clk     )
  );
endmodule
