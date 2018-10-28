module decoder416_test_aha;

	// Inputs
	reg i0, i1, i2, i3, e;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	decoder416_aha uut (
		.out(out), 
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.e(e)
	);

	initial begin
		// Initialize Inputs
		{i0, i1, i2, i3} =  4'b0000;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0001;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0010;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0011;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0100;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0101;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0110;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b0111;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1000;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1001;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1010;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1011;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1100;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1101;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1110;
		e = 1'b1;
		#100;
		
		{i0, i1, i2, i3} =  4'b1111;
		e = 1'b1;
		#100;
        
		// Add stimulus here
		$stop;

	end
      
endmodule
