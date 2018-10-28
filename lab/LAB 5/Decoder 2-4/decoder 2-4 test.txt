module decoder_test_aha;

	// Inputs
	reg A, B, EN;

	// Outputs
	wire o0;
	wire o1;
	wire o2;
	wire o3;

	// Instantiate the Unit Under Test (UUT)
	decoder24_aha uut (
		.o0(o0), 
		.o1(o1), 
		.o2(o2), 
		.o3(o3), 
		.A(A), 
		.B(B), 
		.EN(EN)
	);

	initial begin
		// Initialize Inputs
		{A, B, EN} = 3'b000;
		#100;
		
		{A, B, EN} = 3'b010;
		#100;
		
		{A, B, EN} = 3'b100;
		#100;
		
		{A, B, EN} = 3'b110;
		#100;
		
		{A, B, EN} = 3'b001;
		#100;
		
		{A, B, EN} = 3'b011;
		#100;
		
		{A, B, EN} = 3'b101;
		#100;
		
		{A, B, EN} = 3'b111;
		#100;
		
		$stop;
        
		// Add stimulus here

	end
      
endmodule