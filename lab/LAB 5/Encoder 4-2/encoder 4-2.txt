module encoder42_aha(a0, a1, V, d0, d1, d2, d3);

	input d0, d1, d2, d3;
	output a0, a1, V;
	
	assign a0 = d3 | (d1 & (~d2));
	assign a1 = d2 | d3;
	assign V = d0 | d1 | d2 | d3;

endmodule