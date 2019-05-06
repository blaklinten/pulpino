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
//  logic                 start;
//  logic                 done;
  logic [1023:0][15:0]   acc_out;
  logic [1023:0][7:0]   acc_in_A;
  logic [1023:0][7:0]   acc_in_B;
  logic [11:0]          addr;
  logic [31:0]          data;


top_acc
top_acc_i
(
  .clk          (       clk       ),
//  .start        (       start     ),
//  .done         (       done      ),
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
            acc_in_A[4] <= PWDATA[7:0];
            acc_in_A[5] <= PWDATA[15:8];
            acc_in_A[6] <= PWDATA[23:16];
            acc_in_A[7] <= PWDATA[31:24];
          end
          3:
          begin
            acc_in_A[8] <= PWDATA[7:0];
            acc_in_A[9] <= PWDATA[15:8];
            acc_in_A[10] <= PWDATA[23:16];
            acc_in_A[11] <= PWDATA[31:24];
          end
          4:
          begin
            acc_in_A[12] <= PWDATA[7:0];
            acc_in_A[13] <= PWDATA[15:8];
            acc_in_A[14] <= PWDATA[23:16];
            acc_in_A[15] <= PWDATA[31:24];
          end
          1025:
          begin
            acc_in_B[0] <= PWDATA[7:0];
            acc_in_B[1] <= PWDATA[15:8];
            acc_in_B[2] <= PWDATA[23:16];
            acc_in_B[3] <= PWDATA[31:24];
          end
          1026:
          begin
            acc_in_B[4] <= PWDATA[7:0];
            acc_in_B[5] <= PWDATA[15:8];
            acc_in_B[6] <= PWDATA[23:16];
            acc_in_B[7] <= PWDATA[31:24];
          end
          1027:
          begin
            acc_in_B[8] <= PWDATA[7:0];
            acc_in_B[9] <= PWDATA[15:8];
            acc_in_B[10] <= PWDATA[23:16];
            acc_in_B[11] <= PWDATA[31:24];
          end
          1028:
          begin
            acc_in_B[12] <= PWDATA[7:0];
            acc_in_B[13] <= PWDATA[15:8];
            acc_in_B[14] <= PWDATA[23:16];
            acc_in_B[15] <= PWDATA[31:24];
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
        PRDATA[15:0] = acc_out[0];
        PRDATA[31:16] = acc_out[1];
      end
      2:
      begin
        PRDATA[15:0] = acc_out[2];
        PRDATA[31:16] = acc_out[3];
      end
      3:
      begin
        PRDATA[15:0] = acc_out[4];
        PRDATA[31:16] = acc_out[5];
      end
      4:
      begin
        PRDATA[15:0] = acc_out[6];
        PRDATA[31:16] = acc_out[7];
      end
      5:
      begin
        PRDATA[15:0] = acc_out[8];
        PRDATA[31:16] = acc_out[9];
      end
      6:
      begin
        PRDATA[15:0] = acc_out[10];
        PRDATA[31:16] = acc_out[11];
      end
      7:
      begin
        PRDATA[15:0] = acc_out[12];
        PRDATA[31:16] = acc_out[13];
      end
      8:
      begin
        PRDATA[15:0] = acc_out[14];
        PRDATA[31:16] = acc_out[15];
      end
      default:
        PRDATA = 32'b11111111111111111111111111111111;
    endcase
  end

  assign PREADY  = 1'b1;
  assign PSLVERR = 1'b0;

endmodule
