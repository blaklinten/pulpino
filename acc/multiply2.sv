module multiply2 #(
  parameter mat_size = 2,
  parameter dat_size = 8
) (
  input  logic            start        ,
  input  logic            clk          , //kanske ej behövs
  input  logic [3:0][7:0] mat_A [255:0],
  input  logic [3:0][7:0] mat_B [255:0],
  output logic [3:0][7:0] mat_C [255:0],
  output logic            done
);

  int i, j, k,l,m,n;
  int w = 0;

  logic [dat_size-1:0] temp_C[mat_size-1:0][mat_size-1:0] = '{'{8'h00, 8'h00},'{8'h00, 8'h00}};
  logic [dat_size-1:0] temp_A[mat_size-1:0][mat_size-1:0]                                     ;
  logic [dat_size-1:0] temp_B[mat_size-1:0][mat_size-1:0]                                     ;


  always @(posedge start)
    begin

      for(int l=0;l<mat_size;l++) begin             //vilken rad vi är på
        for(int m=0;m<mat_size;m=m+4) begin         //vi vill gå mellan var fjärde kolonn
          for(int n=0;n<mat_size;n++) begin         //stega igenom de 4 bits som fins lagrade i varje ord
            temp_A[l][m+n] = mat_A[w][n];
            temp_B[l][m+n] = mat_B[w][n];
          end
          w++;                                    //när vi gått igenom 4 bits, gå till nästa ord
        end
      end


    for(int i=0;i<mat_size;i++) begin
      for(int j=0;j<mat_size;j++) begin
        for(int k=0;k<mat_size;k++) begin
        temp_C[i][j] = (temp_C[i][j] + (temp_A[i][k] * temp_B[k][j]));
        end
      end 
    end 
    w=0;
    for(int row = 0; row < mat_size; row++) begin
      for(int kol =0; kol < mat_size;kol++)
        if(kol%4==0){
          w++
          sec=0
        }
        mat_C[row][kol] = temp_C[w][sec];
        sec++
      end
    end

        w++
  done  = 1;
  end
endmodule
