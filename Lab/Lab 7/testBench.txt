module aha_tb_fas;

	// Inputs
	reg [3:0] A, B;
	reg Sel;

	// Outputs
	wire C4;
	wire [3:0] S;

	// Instantiate the Unit Under Test (UUT)
	aha_4bit_fas uut (
		.A(A), 
		.B(B), 
		.Sel(Sel), 
		.C4(C4), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A = 4'b0010;
		B = 4'b0001;
		Sel = 0;
		#100;
		
		A = 4'b0100;
		B = 4'b0001;
		Sel = 0;
		#100;
		
		A = 4'b0110;
		B = 4'b0001;
		Sel = 0;
		#100;
		
		A = 4'b0111;
		B = 4'b0010;
		Sel = 1;
		#100;
		
		A = 4'b0101;
		B = 4'b0010;
		Sel = 1;
		#100;
		
		A = 4'b0010;
		B = 4'b0101;
		Sel = 1;
		#100;
		
		
        
		// Add stimulus here
		$stop;
	end
      
endmodule