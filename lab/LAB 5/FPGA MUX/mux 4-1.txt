module mux41_aha(out, i0, i1, i2, i3, A, B);
	
	input i0, i1, i2, i3, A, B;
	output out;
	
	assign out = A ? (B ? i3 : i2) : (B ? i1 : i0);

endmodule