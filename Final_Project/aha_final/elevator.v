`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUT-CEIT
// Engineer: Ali Nazari
// Create Date:    16:23:13 01/21/2019 
// Module Name:    elevator 
// Project Name: Smart-Elevator 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module elevator(CLK, RST, BCD_management, engine, doors, interior_movement, exterior_movement);

	input RST, CLK;
	input [3:0] BCD_management;
	input [2:0] interior_movement, exterior_movement;
	
	output [1:0] engine;
	output [2:0] doors;
	
	wire logged_in;
	
	management manage(CLK, RST, BCD_management, logged_in);
	
	movement move(engine, doors, CLK, RST, interior_movement, exterior_movement, logged_in);

endmodule
