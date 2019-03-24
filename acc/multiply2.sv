module multiply2 #(
  parameter mat_size = 2,
  parameter dat_size = 8
) (
  input  logic                start                             ,
  input  logic                clk                               , //kanske ej behövs
  input  logic [dat_size-1:0] mat_A [mat_size-1:0][mat_size-1:0],
  input  logic [dat_size-1:0] mat_B [mat_size-1:0][mat_size-1:0],
  output logic [dat_size-1:0] mat_C [mat_size-1:0][mat_size-1:0],
  output logic                done                              ,
  int                         i, j, k
);

logic [dat_size-1:0] temp; 
//multiplicera elementen
always @(posedge start)
  begin
    for(int i=0;i<mat_size;i++) begin
      for(int j=0;j<mat_size;j++) begin
        for(int k=0;k<mat_size;k++) begin
          //mat_C[i][j] <= (mat_C[i][j] +(mat_A[i][k] * mat_B[k][j]));
          temp = 8'h06;
           $display("%b",temp);
          //mat_C[i][j] = mat_B[i][j] + mat_C[i][j];
        end // for(int k=0;k<mat_size;k++)
      end // for(int j=0;j<mat_size;j++)
    end // for(int i=0;i<mat_size;i++)
    done = 1;
  end
endmodule

