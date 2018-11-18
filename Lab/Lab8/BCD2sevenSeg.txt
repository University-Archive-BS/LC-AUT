module BCD2sevenSeg(A, B, S, C, SEG_SEL, SEG_DATA);

	input [1:0] A, B, S;
	input C;
	wire [3:0] out;
	output [4:0] SEG_SEL;
	output [7:0] SEG_DATA;
	reg [7:0] SEG_DATA;
	
	sevensegment_calculator res (A, B, S, C, out);
		
	always @(out)
	begin
		case(out)
		0:SEG_DATA = 8'b00111111;
		1:SEG_DATA = 8'b00000110;
		2:SEG_DATA = 8'b01011011;
		3:SEG_DATA = 8'b01001111;
		4:SEG_DATA = 8'b01100110;
		5:SEG_DATA = 8'b01101101;
		6:SEG_DATA = 8'b01111101;
		7:SEG_DATA = 8'b00000111;
		8:SEG_DATA = 8'b01111111;
		9:SEG_DATA = 8'b01101111;
		default: SEG_DATA = 8'b01111001;
		endcase
	end
	assign SEG_SEL=5'b00001;

endmodule