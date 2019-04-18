module data_to_acc (
	input  logic [31:0] addr    ,
	input  logic [31:0] data_in ,
	output logic [31:0] data_out,
	input  logic        clk
);


	reg [1023:0][7:0] mat_A;
	reg [1023:0][7:0] mat_B;
	reg [1023:0][7:0] mat_C;

	logic [1023:0][7:0] mat_A_out_from_here;
	logic [1023:0][7:0] mat_B_out_from_here;
	logic [1023:0][7:0] mat_C_in_to_here   ;

	logic start;

	
	//nu kan den aldrig sättas tillbaka till noll, fixa nån gång
        always @(posedge clk) 
        begin
          if(addr == 1023)
            start <= 'b1;
          if(1023 < addr < 2048) 
            mat_A[addr-1024] <= data_in[7:0];
          if(2047 < addr < 3072) 
            mat_B[addr-2048] <= data_in[7:0];
          if(3071 < addr < 4096)
            data_out[7:0] <= mat_C[addr-3072];
        end

	assign mat_A_out_from_here = mat_A;
	assign mat_B_out_from_here = mat_B;
	assign mat_C = mat_C_in_to_here;

	top_acc accelerator (
		.clk  (clk                ),
		.start(start              ),
		.acc_out(mat_C_in_to_here   ),
		.acc_in_B(mat_B_out_from_here),
		.acc_in_A(mat_A_out_from_here)
	);

endmodule // data_to_acc
