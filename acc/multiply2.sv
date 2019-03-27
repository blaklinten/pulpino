module multiply2 #(
  parameter mat_size = 2,
  parameter dat_size = 8
) (
  input  logic                start                             ,
  input  logic                clk                               , //kanske ej behövs
  input  logic [3:0][7:0] mat_A [255:0],
  input  logic [3:0][7:0] mat_B [255:0],
  output  logic [3:0][7:0] mat_C [255:0],
  output logic                done                            
);

int                         i, j, k;

logic [dat_size-1:0] temp_C [mat_size-1:0][mat_size-1:0] = '{'{8'h00, 8'h00},
                                                              '{8'h00, 8'h00}};


always @(posedge start)
  begin
//  for(int i=0;i<mat_size;i++) begin
//    for(int j=0;j<mat_size;j++) begin
//      for(int k=0;k<mat_size;k++) begin
//         temp_C[i][j] = (temp_C[i][j] + (mat_A[i][k] * mat_B[k][j]));
//         $display("%b",temp_C[j][k]);
//      end // for(int k=0;k<mat_size;k++)
//    end // for(int j=0;j<mat_size;j++)
//  end // for(int i=0;i<mat_size;i++
//  mat_C = temp_C;
//  done = 1;
  end
endmodule
