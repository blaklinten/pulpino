`define baseaddr 1024

module data_to_acc (
	input  logic [31:0] addr    ,
	input  logic [31:0] data_in ,
	output logic        data_out,
	input  logic        clk
);


	reg [1023:0][7:0] mat_A;
	reg [1023:0][7:0] mat_B;
	reg [1023:0][7:0] mat_C;

	logic [1023:0][7:0]mat_A_out_from here;
	logic [1023:0][7:0] mat_B_out_from_here;
	logic [1023:0][7:0] mat_C_in_to_here   ;

	logic start;

	
	//nu kan den aldrig sättas tillbaka till noll, fixa nån gång
	if(baseaddr-1==addr)
		assign start = 'b1;

	generate
		for (int i = 0; i < 1024; i++) begin
			if(baseaddr+i==addr)
				assign mat_A[i] = data_in[7:0];
		end
	endgenerate

	generate
		for (int i = 0; i < 1024; i++) begin
			if(baseaddr+1024+i==addr)
				assign mat_B[i] = data_in[7:0];
		end
	endgenerate

	generate
		for (int i = 0; i < 1024; i++) begin
			if(baseaddr+2048+i==addr)
				assign data_out[7:0] = mat_C[i];
		end
	endgenerate

	assign mat_A_out_from_here = mat_A;
	assign mat_B_out_from_here = mat_B;
	assign mat_C = mat_C_in_to_here;

	top_acc accelerator (
		.clk  (clk                ),
		.start(start              ),
		.mat_C(mat_C_in_to_here   ),
		.mat_B(mat_B_out_from_here),
		.mat_A(mat_A_out_from_here)
	);

endmodule // data_to_acc
