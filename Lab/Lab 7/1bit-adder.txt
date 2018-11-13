module aha_full_adder_subtractor(A, B, Sel, Cin, Cout, S);

	input A, B, Cin, Sel;
	output Cout, S;
	wire Bs, t1, t2, t3;
	
	assign Bs = B ^ Sel;
	assign t1 = Bs ^ A;
	assign S = t1 ^ Cin;
	
	assign t2 = A & Bs;
	assign t3 = t1 & Cin;
	assign Cout = t2 | t3;

endmodule