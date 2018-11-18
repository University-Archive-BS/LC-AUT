module aha_alu_1(out, A, B, S, C);

	input [1:0] A, B, S;
	output [3:0] out;
	input C;
	
	assign out = S[1] ? (S[0] ? A * B : (C ? A - B : A + B)) : (S[0] ? ~(A & B) : A);

endmodule