module b2g_tb_aha;

	// Inputs
	reg [3:0] bin;

	// Outputs
	wire [3:0] G;

	// Instantiate the Unit Under Test (UUT)
	binary2gray uut (
		.G(G), 
		.bin(bin)
	);

	initial begin
		// Initialize Inputs
		bin = 4'b0100;
		#100;
       
		$stop;

	end
      
endmodule