`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: AUT-CEIT
// Engineer: Ali Nazari
// Create Date:   17:15:04 01/21/2019
// Design Name:   elevator
// Module Name:   F:/Courses/Aha_Final_Project/aha_final/elevator_testbench.v
// Project Name:  aha_final
////////////////////////////////////////////////////////////////////////////////

module elevator_testbench;

	// Inputs
	reg CLK, RST;
	reg [3:0] BCD_management;
	reg [2:0] interior_movement, exterior_movement;

	// Outputs
	wire [1:0] engine;
	wire [2:0] doors;

	// Instantiate the Unit Under Test (UUT)
	elevator uut (
		.CLK(CLK), 
		.RST(RST), 
		.BCD_management(BCD_management), 
		.engine(engine), 
		.doors(doors), 
		.interior_movement(interior_movement), 
		.exterior_movement(exterior_movement)
	);

	initial 
	begin
		CLK = 0;
		repeat (100)
	#10 CLK = ~CLK;
	end
	
	initial
	begin
	
	/*  
		### login and request ###
	
		interior_movement = 3'b000;
		exterior_movement = 3'b000;
		BCD_management = 4'b0000;
		RST = 0;
	#5 
		RST = 1;
	#20	 
		RST = 0;
	#20
		BCD_management = 4'b1011;
	#20	 
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0001;
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0001;
	#20
		BCD_management = 4'b1101;
	#40  
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20
		BCD_management = 4'b1101;
	#40	
		interior_movement = 3'b010;
	#20
		interior_movement = 3'b000;
		
	*/
		
	//	### login as an admin and add a new user ###
	
		interior_movement = 3'b000;
		exterior_movement = 3'b000;
		BCD_management = 4'b0000;
		
		RST = 0;
	#5 
		RST = 1;
	#20	 
		RST = 0;
		
	#20
		BCD_management = 4'b1011;
		
	#20	 
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0001;
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0001;
		
	#20
		BCD_management = 4'b1011;
		
	#40  
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
		
	#20
		BCD_management = 4'b1101;	
		
	#40
		BCD_management = 4'b1011;
		
	#20	 
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0001;
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0010;
		
	#20
		BCD_management = 4'b1100;
		
	#40  
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
		
		
	#20
		BCD_management = 4'b1011;
	#20  
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0000;
	#40  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
		
		
	#20
		BCD_management = 4'b1011;
	#40  
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
	#20  
		BCD_management = 4'b0000;
		BCD_management = 4'b0001;
		
	#20
		BCD_management = 4'b1101;
		
	#20
		BCD_management = 4'b1011;
		
	#20  
		BCD_management = 4'b0000;
	#20  
		BCD_management = 4'b0000;
	#40  
		BCD_management = 4'b0010;
		
	#20
		BCD_management = 4'b1110;
			
	end
      
endmodule

