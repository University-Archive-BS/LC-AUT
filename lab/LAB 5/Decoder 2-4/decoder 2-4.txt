module decoder24_aha(o0, o1, o2, o3, A, B, EN);
	input A, B, EN;
	output o0, o1, o2, o3;
	
	assign o0 = (~A) & (~B) & EN;
	assign o1 = (~A) & (B) & EN;
	assign o2 = (A) & (~B) & EN;
	assign o3 = (A) & (B) & EN;
	
endmodule