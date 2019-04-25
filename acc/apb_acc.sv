module apb_acc
(
  input  logic                      HCLK,
  input  logic                      HRESETn,
  input  logic [APB_ADDR_WIDTH-1:0] PADDR,
  input  logic               [31:0] PWDATA,
  input  logic                      PWRITE,
  input  logic                      PSEL,
  input  logic                      PENABLE,
  output logic               [31:0] PRDATA,
  output logic                      PREADY,
  output logic                      PSLVERR
);

  logic                 clk;
  logic                 start;
  logic                 done;
  logic [1023:0][7:0]   acc_out;
  logic [1023:0][7:0]   acc_in_A;
  logic [1023:0][7:0]   acc_in_B;


top_acc
top_acc_i
(
  .clk          (       clk     ),
  .start        (       start   ),
  .done         (       done    ),
  .acc_out      (       acc_out ),
  .acc_in_A     (       acc_in_A),
  .acc_in_B     (       acc_in_B)
);

  always_ff @(posedge HCLK, negedge HRESETn)
  begin
    if (~HRESETn)
    begin
      //reset all signals
    end
    else
    begin
      if (PSEL && PENABLE && PWRITE)
      begin
        //Start check adress?
      end
    end
  end

  always_comb
  begin
    //Assign outputs and inputs from local variables
  end

endmodule
