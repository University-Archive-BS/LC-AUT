module aha_paeen(f, a, b, c);

	input a, b, c;
	output f;
	wire wnot, w1, w2, w3;
	
	assign #(15) wnot = (~b);
	assign #(10) w1 = a & b;
	assign #(10) w2 = a & c & wnot;
	assign #(10) w3 = a & c;
	assign #(10) f = w1 | w2 | w3;

endmodule