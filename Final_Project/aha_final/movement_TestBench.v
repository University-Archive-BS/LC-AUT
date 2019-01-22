`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: AUT-CEIT
// Engineer: Ali Nazari
// Create Date:   23:33:11 12/22/2018
// Design Name:   movement
// Module Name:   F:/Courses/Aha_Final_Project/aha_final/movement_testbench.v
// Project Name:  aha_final
// Verilog Test Fixture created by ISE for module: movement
// Revision 0.01 - File Created
// Additional Comments:
////////////////////////////////////////////////////////////////////////////////

module movement_testbench;
	
	// Inputs
	reg FRQ, RST;	
	reg [2:0] interior_panel, exterior_panel;
				
	// Outputs
	wire [1:0] engine;
	wire [2:0] doors;

	// Instantiate the Unit Under Test (UUT)
	movement uut (
		.engine(engine), 
		.doors(doors), 
		.FRQ(FRQ), 
		.RST(RST), 
		.interior_panel(interior_panel), 
		.exterior_panel(exterior_panel)
	);

	initial
	begin
		RST = 0;
		CLK = 0;
	#15 RST = 1;
		repeat (100)
		#25 CLK = ~CLK;
	end
	
	initial
	begin
		exterior_panel = 0;
		interior_panel = 0;
		#25 interior_panel = 3'b001;
		#10 interior_panel = 0;
		#25 interior_panel = 3'b010;
		#10 interior_panel = 0;
		#25 interior_panel = 3'b001;
		#10 interior_panel = 0;
		#25 interior_panel = 3'b100;
		#10 interior_panel = 0;
		#25 interior_panel = 3'b001;
		#10 interior_panel = 0;
		#25 interior_panel = 3'b010;
		#10 interior_panel = 0;
		#25 interior_panel = 3'b100;
		#10 interior_panel = 0;
	end

endmodule

