module sevensegment_calculator(A, B, S, C, out);
	
	input [1:0] A, B, S;
	output [3:0] out;
	input C;
	
	assign out[2:0] = S[1] ? (S[0] ? A * B : (C ? A - B : A + B)) : (S[0] ? ~(A & B) : A);
	
	assign out[3] = 0;

	
endmodule