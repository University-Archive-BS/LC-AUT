module gray2binary(bin, G);

	input [3:0] G;
	output [3:0] bin;

	assign bin[3] = G[3];
	assign bin[2] = bin[3] ^ G[2];
	assign bin[1] = bin[2] ^ G[1];
	assign bin[0] = bin[1] ^ G[0];

endmodule