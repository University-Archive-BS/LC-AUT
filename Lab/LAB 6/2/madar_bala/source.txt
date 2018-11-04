module aha_bala(f, a, b, c);
	
	input a, b, c;
	output f;
	wire wnot, w1, w2;
	
	assign #(15) wnot = (~b);
	assign #(10) w1 = a & b;
	assign #(10) w2 = a & c & wnot;
	assign #(10) f = w1 | w2;
	
endmodule