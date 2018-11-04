module g2b_tb_aha;

	// Inputs
	reg [3:0] G;

	// Outputs
	wire [3:0] bin;

	// Instantiate the Unit Under Test (UUT)
	gray2binary uut (
		.bin(bin), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		G = 4'b1111;
		#100;

		$stop;

	end
      
endmodule