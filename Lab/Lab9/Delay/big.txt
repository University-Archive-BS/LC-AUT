module aha_big(Y, Z, A, B, C, D, CLK, W1, W2, W3);
	
	input A, B, C, D, CLK;
	output Y, Z, W1, W2, W3;
	wire AND_1, AND_2, AND_3, AND_4, AND_5, OR_1, OR_2, OR_3, NAND_1, NOT_1, QN_1, Q_2, QN_2, Y_temp, QN_1_temp, Q_2_temp, QN_2_temp;
	
	and   #(20) g1(AND_1, A, C);
	and	#(20) g2(AND_2, B, D);
	and	#(20) g3(AND_3, D, Y);		
	and	#(20) g4(AND_4, A, C);
	and	#(20) g5(AND_5, OR_2, OR_3);
	
	or		#(20) g6(OR_1, AND_1, AND_2);
	or		#(20) g7(OR_2, C, Q_2);
	or		#(20) g8(OR_3, B, QN_1);
		
	nand	#(20) g9(NAND_1, AND_3, AND_4);
	
	not	#(20) g10(Z, AND_5);
	
	assign W1 = OR_1;
	assign W2 = NAND_1;
	assign W3 = Q_2;
	
	aha_dff ff1(Y_temp, QN_1_temp, OR_1, ~CLK);
	assign #(15) Y = Y_temp;
	assign QN_1 = QN_1_temp;
	aha_dff ff2(Q_2_temp, QN_2_temp, NAND_1, ~CLK);
	assign #(15) Q_2 = Q_2_temp;
	assign QN_2 = QN_2_temp;

endmodule
