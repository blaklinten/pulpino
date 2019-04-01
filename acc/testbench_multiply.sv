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

		clk = 0;
		#100;
		// mat_A[0][0] = 8'd2; mat_A[0][1] = 8'd2; mat_A[0][2] = 8'd2; mat_A[0][3] = 8'd2;
		// mat_B[0][0] = 8'd4; mat_B[0][1] = 8'd4; mat_B[0][2] = 8'd4; mat_B[0][3] = 8'd4;
		mat_A <= '{default:2};
		mat_B <= '{default:3};
		#100;
		clk='b1;
		#200;
		clk='b0;
		$display("%p",mat_C[0][0]);
		$display("%p",mat_C[0][1]);
		$display("%p",mat_C[0][2]);
		$display("%p",mat_C[0][3]);
		#100;
		clk='b1;
		#100;
	end
endmodule // testbench_multiply