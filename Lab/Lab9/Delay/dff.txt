module aha_dff(Q, QN, D, CLK);
	output Q, QN;
	input D, CLK;
	reg Q, QN;
		initial 
			begin
				Q = 1'b0; 
				QN = 1'b1;
		  end
		always @ (posedge CLK) 
			begin
			  Q = D;
			  QN = ~D;
			end
	
endmodule