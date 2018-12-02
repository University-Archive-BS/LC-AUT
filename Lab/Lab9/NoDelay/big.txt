module aha_big_noDelay(Y, Z, A, B, C, D, CLK, W1, W2, W3);

	input A, B, C, D, CLK;
	output Y, Z, W1, W2, W3;
	wire AND_1, AND_2, AND_3, AND_4, AND_5, OR_1, OR_2, OR_3, NAND_1, NOT_1, QN_1, Q_2, QN_2;
	
	and  	g1(AND_1, A, C);
	and	g2(AND_2, B, D);
	and	g3(AND_3, D, Y);		
	and	g4(AND_4, A, C);
	and	g5(AND_5, OR_2, OR_3);
	
	or		g6(OR_1, AND_1, AND_2);
	or		g7(OR_2, C, Q_2);
	or		g8(OR_3, B, QN_1);
		
	nand	g9(NAND_1, AND_3, AND_4);
	
	not	g10(Z, AND_5);
	
	assign W1 = OR_1;
	assign W2 = NAND_1;
	assign W3 = Q_2;
	
	aha_dff_noDelay ff1(Y, QN_1, OR_1, ~CLK);
	aha_dff_noDelay ff2(Q_2, QN_2, NAND_1, ~CLK);

endmodule