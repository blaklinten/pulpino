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

assign clk = HCLK;
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
          4'b0000000000:
            start <= PWDATA[0];
          4'b0000000001:
          begin
            acc_in_A[0] <= PWDATA[7:0];
            acc_in_A[1] <= PWDATA[15:8];
            acc_in_A[2] <= PWDATA[23:16];
            acc_in_A[3] <= PWDATA[31:24];
          end
          10'b0000000010:
          begin
            acc_in_A[4] <= PWDATA[7:0];
            acc_in_A[5] <= PWDATA[15:8];
            acc_in_A[6] <= PWDATA[23:16];
            acc_in_A[7] <= PWDATA[31:24];
          end
          10'b0100000001:
          begin
            acc_in_B[0] <= PWDATA[7:0];
            acc_in_B[1] <= PWDATA[15:8];
            acc_in_B[2] <= PWDATA[23:16];
            acc_in_B[3] <= PWDATA[31:24];
          end
          10'b0100000010:
          begin
            acc_in_B[4] <= PWDATA[7:0];
            acc_in_B[5] <= PWDATA[15:8];
            acc_in_B[6] <= PWDATA[23:16];
            acc_in_B[7] <= PWDATA[31:24];
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
        PRDATA[1]      = done;
      10'b1000000001:
      begin
        // 2049 = 1024 bytes * 2 ( tredje matrisen) + 1
        PRDATA[7:0]    = acc_out[0];
        PRDATA[15:8]   = acc_out[1];
        PRDATA[23:16]  = acc_out[2];
        PRDATA[31:24]  = acc_out[3];
      end
      10'b1000000010:                
      begin
        PRDATA[7:0]    = acc_out[4];
        PRDATA[15:8]   = acc_out[5];
        PRDATA[23:16]  = acc_out[6];
        PRDATA[31:24]  = acc_out[7];
      end
      default:
        PRDATA[11:0]    = PADDR;
    endcase
  end

  assign PREADY  = 1'b1;
  assign PSLVERR = 1'b0;

endmodule
