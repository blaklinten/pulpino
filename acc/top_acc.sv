module top_acc 
  #(
    parameter dat_size = 8,
    parameter mat_size = 2
  )
  (
    //input  logic            start            ,
    //output logic            done             ,
    input  logic [3:0][7:0] acc_out    [255:0],
    output logic [3:0][7:0] acc_in_A [255:0],
    output logic [3:0][7:0] acc_in_B [255:0]
  );
  multiply2 
  #(
      .dat_size  (  dat_size  ),
      .mat_size  (  mat_size  )
  )
  multiply2_i
  (
     //   .start  (  start      ),
     //   .done   (  done       ),
        .mat_C  (  acc_out     ),
        .mat_A  (  acc_in_A  ),
        .mat_B  (  acc_in_B  )
  );

      
