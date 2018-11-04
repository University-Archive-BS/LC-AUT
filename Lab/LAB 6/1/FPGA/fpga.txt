module FPGA_aha(bin_out, G_out, bin);

   input [3:0] bin;
   output [3:0] bin_out;
	output [3:0] G_out;
	wire [3:0] G;
    
   binary2gray uut1(G, bin);
   gray2binary uut2(bin_out, G);
	assign G_out = G;

endmodule