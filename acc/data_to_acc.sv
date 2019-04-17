module data_to_acc (
	input  logic addr [31:0]           ,
	input  logic data_in [31:0]        ,
	output logic data_out              ,
	output logic mat_A_out[1023:0][7:0],
	output logic mat_B_out[1023:0][7:0],
	output logic mat_C_in [1023:0][7:0]
);

	reg mat_A[1023:0][7:0];
	reg mat_B[1023:0][7:0];
	reg mat_C[1023:0][7:0];

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
				assign data_out = mat_C;
		end
	endgenerate

	assign mat_A_out = mat_A;
	assign mat_B_out = mat_B;
	assign mat_C     = mat_C_in;

endmodule // data_to_acc
