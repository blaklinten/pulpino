module top_acc #(
  parameter dat_size = 8,
  parameter mat_size = 2
) (
  input  logic            clk     ,
  input  logic            start   ,
  output logic            done    ,
  output logic [1023:0][7:0] acc_out ,
  input  logic [1023:0][7:0] acc_in_A,
  input  logic [1023:0][7:0] acc_in_B
);
  multiply_long #(
    .dat_size(dat_size),
    .mat_size(mat_size)
  ) multiply2_i (
    .start('b1     ),
    .done (done    ),
    .mat_C(acc_out ),
    .mat_A(acc_in_A),
    .mat_B(acc_in_B),
    .clk  (clk     )
  );
endmodule
