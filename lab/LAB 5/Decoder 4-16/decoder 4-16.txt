module decoder416_aha(out,
							i0, i1, i2, i3, 
							e);
	input i0, i1, i2, i3, e;
	wire d0, d1, d2, d3, d4, d5, d6, d7, d8, 
			d9, d10, d11, d12, d13, d14, d15;
	wire qo0[3:0];
	
	decoder24_aha q0(qo0[3], qo0[2], qo0[1], qo0[0], i3, i2, e);
	decoder24_aha q1(d15, d14, d13, d12, i1, i0, qo0[3]);
	decoder24_aha q2(d11, d10, d9, d8, i1, i0, qo0[2]);
	decoder24_aha q3(d7, d6, d5, d4, i1, i0, qo0[1]);
	decoder24_aha q4(d3, d2, d1, d0, i1, i0, qo0[0]);
	
	output out;
	assign out = d1 | d2 | d4 | d7 | d8 | d11 | d13 | d14;
	
endmodule