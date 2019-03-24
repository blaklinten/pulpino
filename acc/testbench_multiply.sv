`include "multiply2.sv"
module testbench_multiply ();

	logic [7:0] mat_A   [1:0][1:0]    ;
	logic [7:0] mat_B   [1:0][1:0]    ;
	logic [7:0] mat_C   [1:0][1:0]    ;
	logic start;
	logic done;
	logic clk;

	multiply2 mult(
                .clk (clk),
		.start(start),
		.mat_A(mat_A),
		.mat_B(mat_B),
		.mat_C(mat_C),
		.done(done)
	);
	initial begin
		#100
		mat_A <= '{default:0};
		mat_B <= '{default:0};
		mat_C <= '{default:0};
		start = '0;
		done  = '0;
		#100;
		mat_A[0][0] = 8'd2; mat_A[0][1] = 8'd2; mat_A[1][0] = 8'd2; mat_A[1][1] = 8'd2;
		mat_B[0][0] = 8'd4; mat_B[0][1] = 8'd4; mat_B[1][0] = 8'd4; mat_B[1][1] = 8'd4;
		#100;
		start=1;
		#200;
	end
	endmodule // testbench_multiply