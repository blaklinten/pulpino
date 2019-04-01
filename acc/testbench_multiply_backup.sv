module testbench_multiply ();


	logic [3:0][7:0]          mat_A[255:0];
	logic [3:0][7:0]          mat_B[255:0];
	logic [3:0][7:0]          mat_C[255:0];
	logic                     start       ;
	logic                     done        ;
	logic                     clk         ;

	multiply_long mult (
		.clk  (clk  ),
		.start(start),
		.mat_A(mat_A),
		.mat_B(mat_B),
		.mat_C(mat_C),
		.done (done )
	);
	initial begin
		#100
		mat_A <= '{default:0};
		mat_B <= '{default:0};
		mat_C <= '{default:0};

		//mat_C[0][0] = 8'd0; mat_C[0][1] = 8'd0; mat_C[1][0] = 8'd0; mat_C[1][1] = 8'd0;
		//$display("%b",mat_C[0][0]);

		start = '0;
		done  = '0;
		#100;
		mat_A[0][0] = 8'd2; mat_A[0][1] = 8'd2; mat_A[0][2] = 8'd2; mat_A[0][3] = 8'd2;
		mat_B[0][0] = 8'd4; mat_B[0][1] = 8'd4; mat_B[0][2] = 8'd4; mat_B[0][3] = 8'd4;
		#100;
		start=1;
		#200;
		$display("%p",mat_C[0][0]);
		$display("%p",mat_C[0][1]);
		$display("%p",mat_C[0][2]);
		$display("%p",mat_C[0][3]);
	end
endmodule // testbench_multiply