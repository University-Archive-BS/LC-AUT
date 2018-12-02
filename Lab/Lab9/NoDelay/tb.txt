module tb_aha_big_noDelay;

	// Inputs
	reg A, B, C, D, CLK;

	// Outputs
	wire Y;
	wire Z;
	wire W1;
	wire W2;
	wire W3;

	// Instantiate the Unit Under Test (UUT)
	aha_big_noDelay uut (
		.Y(Y), 
		.Z(Z), 
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.CLK(CLK), 
		.W1(W1), 
		.W2(W2), 
		.W3(W3)
	);

	initial begin
		// Initialize Inputs
		{A, B, C, D, CLK} = 5'b01100;
		#30;
		{A, B, C, D, CLK} = 5'b01001;
		#30;
		{A, B, C, D, CLK} = 5'b01000;
		#30;
		{A, B, C, D, CLK} = 5'b11101;
		#30;
		{A, B, C, D, CLK} = 5'b11100;
		#30;
		{A, B, C, D, CLK} = 5'b10011;
		#30;
		{A, B, C, D, CLK} = 5'b10010;
		#30;
		{A, B, C, D, CLK} = 5'b01101;
		#30;
		{A, B, C, D, CLK} = 5'b01100;
		#30;
		{A, B, C, D, CLK} = 5'b01101;
		#30;
		{A, B, C, D, CLK} = 5'b01100;
		#30;
		{A, B, C, D, CLK} = 5'b01001;
		#30;
		{A, B, C, D, CLK} = 5'b01000;
		#30;
		{A, B, C, D, CLK} = 5'b01001;
		#30;
		{A, B, C, D, CLK} = 5'b01000;
		#30;
		{A, B, C, D, CLK} = 5'b01001;
		#30;
		{A, B, C, D, CLK} = 5'b01000;
		#30;
		$stop;

	end
      
endmodule
