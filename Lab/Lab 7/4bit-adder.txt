module aha_4bit_fas(A, B, Sel, C4, S);

	input [3:0] A, B;
	input Sel;
	output [3:0] S;
	output C4;
	wire [2:0] C;
	
	aha_full_adder_subtractor as0(A[0], B[0], Sel, Sel, C[0], S[0]);
	aha_full_adder_subtractor as1(A[1], B[1], Sel, C[0], C[1], S[1]);
	aha_full_adder_subtractor as2(A[2], B[2], Sel, C[1], C[2], S[2]);
	aha_full_adder_subtractor as3(A[3], B[3], Sel, C[2], C4, S[3]);

endmodule