module paeen_tb;

	// Inputs
	reg a, b, c;

	// Outputs
	wire f;

	// Instantiate the Unit Under Test (UUT)
	aha_paeen uut (
		.f(f), 
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 1;
		c = 1;
		#100;
		a = 1;
		b = 0;
		c = 1;
		#100;

		$stop;

	end
      
endmodule
