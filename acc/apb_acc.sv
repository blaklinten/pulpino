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
  logic [3:0][15:0]   acc_out;
  logic [3:0][7:0]   acc_in_A;
  logic [3:0][7:0]   acc_in_B;
  logic [11:0]          addr;
  logic [31:0]          data;


top_acc
top_acc_i
(
  .clk          (       clk       ),
  .acc_out      (       acc_out   ),
  .acc_in_A     (       acc_in_A  ),
  .acc_in_B     (       acc_in_B  )
);

assign clk = HCLK;
// Adress by word.
assign addr = PADDR[11:2];

  always_ff @(posedge HCLK)
  begin
      if (PSEL && PENABLE && PWRITE)
      begin
        case (addr)
          1:
          begin
            acc_in_A[0] <= PWDATA[7:0];
            acc_in_A[1] <= PWDATA[15:8];
            acc_in_A[2] <= PWDATA[23:16];
            acc_in_A[3] <= PWDATA[31:24];
          end
          2:
          begin
            acc_in_B[0] <= PWDATA[7:0];
            acc_in_B[1] <= PWDATA[15:8];
            acc_in_B[2] <= PWDATA[23:16];
            acc_in_B[3] <= PWDATA[31:24];
          end
        endcase
      end
  end

  //Assign outputs and inputs from local variables
  always_comb
  begin
    PRDATA = '0;
    case (addr)
      1:
      begin
        PRDATA[7:0] = acc_out[0];
        PRDATA[15:8] = acc_out[1];
        PRDATA[23:16] = acc_out[2];
        PRDATA[31:24] = acc_out[3];
      end
      default:
        PRDATA = 32'b11111111111111111111111111111111;
    endcase
  end

  assign PREADY  = 1'b1;
  assign PSLVERR = 1'b0;

endmodule
