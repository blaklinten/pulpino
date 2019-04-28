module apb_acc
#(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
)
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
  logic [11:0]          addr;
  logic [31:0]          data;

top_acc
top_acc_i
(
  .clk          (       clk       ),
  .start        (       start     ),
  .done         (       done      ),
  .acc_out      (       acc_out   ),
  .acc_in_A     (       acc_in_A  ),
  .acc_in_B     (       acc_in_B  )
);

assign data = 32'b11111111111111111111111111111111;
assign clk = HCLK;
// Adress by word.
assign addr = PADDR[11:2];
  always_ff @(posedge HCLK, negedge HRESETn)
  begin
    if (~HRESETn)
    begin
  //    PRDATA   <= 'h0;
  //    PREADY  <= 'h0;
//      PSLVERR  <= 'h0;
    end

    else
    begin
      if (PSEL && PENABLE && PWRITE)
      begin
        case (addr)
          0:
          begin
            start <= PWDATA[0];
            acc_in_A[0] <= PWDATA[15:8];
            acc_in_A[1] <= PWDATA[23:16];
            acc_in_A[2] <= PWDATA[31:24];
          end
          1:
          begin
            acc_in_A[3] <= PWDATA[7:0];
            acc_in_A[4] <= PWDATA[15:8];
            acc_in_A[5] <= PWDATA[23:16];
            acc_in_A[6] <= PWDATA[31:24];
          end
          2:
          begin
            acc_in_A[7] <= PWDATA[7:0];
            acc_in_A[8] <= PWDATA[15:8];
            acc_in_A[9] <= PWDATA[23:16];
            acc_in_A[10] <= PWDATA[31:24];
          end
          256:
          begin
            acc_in_A[1023] <= PWDATA[7:0];
            acc_in_B[0] <= PWDATA[15:8];
            acc_in_B[1] <= PWDATA[23:16];
            acc_in_B[2] <= PWDATA[31:24];
          end
          257:
          begin
            acc_in_B[3] <= PWDATA[7:0];
            acc_in_B[4] <= PWDATA[15:8];
            acc_in_B[5] <= PWDATA[23:16];
            acc_in_B[6] <= PWDATA[31:24];
          end
        endcase
      end
    end
  end

  //Assign outputs and inputs from local variables
  always_comb
  begin
    case (addr)
      0:
      begin
        PRDATA[0]    = done;
        PRDATA[15:8]   = acc_out[0];
        PRDATA[23:16]  = acc_out[1];
        PRDATA[31:24]  = acc_out[2];
      end
      1:
      begin
        PRDATA[7:0]    = acc_out[3];
        PRDATA[15:8]   = acc_out[4];
        PRDATA[23:16]  = acc_out[5];
        PRDATA[31:24]  = acc_out[6];
      end
      2:
      begin
        PRDATA[7:0]    = acc_out[7];
        PRDATA[15:8]   = acc_out[8];
        PRDATA[23:16]  = acc_out[9];
        PRDATA[31:24]  = acc_out[10];
      end
      default:
        PRDATA         = data;
    endcase
  end

  assign PREADY  = 1'b1;
  assign PSLVERR = 1'b0;

endmodule
