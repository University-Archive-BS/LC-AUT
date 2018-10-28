module mux41_test_aha;

	// Inputs
	reg i0, i1, i2, i3, A, B;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	mux41_aha uut (
		.out(out), 
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs\
		{i0, i1, i2, i3, A, B} = 6'b111100;
		#100;
		
		{i0, i1, i2, i3, A, B} = 6'b111101;
		#100;
		
		{i0, i1, i2, i3, A, B} = 6'b111110;
		#100;
		
		{i0, i1, i2, i3, A, B} = 6'b111111;
		#100;
		
        
		// Add stimulus here
		$stop;

	end
      
endmodule
