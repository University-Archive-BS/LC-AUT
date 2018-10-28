module encoder42_test_aha;

	// Inputs
	reg d0, d1, d2, d3;

	// Outputs
	wire a0;
	wire a1;
	wire V;

	// Instantiate the Unit Under Test (UUT)
	encoder42_aha uut (
		.a0(a0), 
		.a1(a1), 
		.V(V), 
		.d0(d0), 
		.d1(d1), 
		.d2(d2), 
		.d3(d3)
	);

	initial begin
		// Initialize Inputs
		{d0, d1, d2, d3} = 4'b0000;
		#100;
		
		{d0, d1, d2, d3} = 4'b1000;
		#100;
		
		{d0, d1, d2, d3} = 4'bx100;
		#100;
		
		{d0, d1, d2, d3} = 4'bxx10;
		#100;
		
		{d0, d1, d2, d3} = 4'bxxx1;
		#100;
        
		// Add stimulus here
		$stop;

	end
      
endmodule
