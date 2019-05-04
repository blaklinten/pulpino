module top_acc #(
  parameter dat_size = 8,
  parameter mat_size = 2
) (
  input  logic            clk        ,
//  input  logic            start      ,
//  output logic            done       ,
  output logic [8:0][15:0] acc_out ,
  input  logic [8:0][7:0] acc_in_A,
  input  logic [8:0][7:0] acc_in_B
);
  matrix_multiply #(
    .dat_size   (dat_size),
    .mat_size   (mat_size)
  ) matrix_multiply_i (
//    .start      (start   ),
//    .done       (done    ),
    .mat_C      (acc_out ),
    .mat_A      (acc_in_A),
    .mat_B      (acc_in_B),
    .clk        (clk     )
  );
endmodule
