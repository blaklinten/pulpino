
module top_acc #(parameter dat_size = 8) (
  input  logic            start            ,
  input  logic [3:0][7:0] acc_in    [255:0],
  output logic [3:0][7:0] acc_out_A [255:0],
  output logic [3:0][7:0] acc_out_B [255:0]
);
  multiply2 mult
    #()
      (
        .start(start),
        .mat_C(acc_in),
        .mat_A(acc_out_A),
        .mat_B(acc_out_B),
        .done (done)

      )

      
