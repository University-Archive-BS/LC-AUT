`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUT-CEIT
// Engineer: Ali Nazari
// Create Date:    17:13:33 12/22/2018 
// Module Name:    movement 
// Project Name: Elevator
//////////////////////////////////////////////////////////////////////////////////

module movement(engine, doors, CLK, RST, interior_panel, exterior_panel, logged_in);
	
	input CLK, RST;	// CLK and RST are rising edge
	
//	freq_divider fd(.in_freq(FRQ), .out_freq(CLK), .reset(RST));

	input logged_in;
	
	input [2:0] interior_panel; // MSB is for 3rd floor and LSB is for 1st floor
	input [2:0] exterior_panel; // MSB is for 3rd floor and LSB is for 1st floor
	
	reg [2:0] requests = 0; // MSB is for 3rd floor and LSB is for 1st floor
	
	reg [5:0] present_state = 0, next_state = 0;
	
	reg direction = 1; // 1 for up and 0 for down
		
	output reg [1:0] engine = 2'b00; // 00 when engine is OFF
									 // 10 when elevator is going up
									 // 11 when elevator is going down
									 
	output reg [2:0] doors; // MSB is for 3rd floor and LSB is for 1st floor
									// 0 is for close and 1 is for open
		
	parameter [5:0] S0 = 6'b000000, // when we are in the 1st floor and the door is open
						 S1 = 6'b000001, // when we are moving up beside the 2nd floor and the door is close
						 S2 = 6'b000010, // when we are in the 2nd floor and the door is open
						 S3 = 6'b000011, // when we are moving down beside the 2nd floor and the door is close
						 S4 = 6'b000100; // when we are in the 3rd floor and the door is open
						  
		
	always @ (posedge CLK or posedge RST)
		if (RST)
			present_state <= S0;
		else
		begin
			if (logged_in)
				present_state <= next_state;
		end
			
	always @ (present_state or RST or interior_panel or exterior_panel or direction or engine or doors or next_state or requests)
	begin
				
		//input floor panels
		if (interior_panel[0] || exterior_panel[0])
			requests[0] = 1;
		else if (interior_panel[1] || exterior_panel[1])
			requests[1] = 1;
		else if (interior_panel[2] || exterior_panel[2])
			requests[2] = 1;
						
		else
		begin
			case (present_state)
			
				S0:
				begin 
					doors = 3'b001;
					requests[0] = 0;	
					if (requests[1] == 1 || requests[2] == 1)
						next_state <= S1;
					else
						engine = 2'b00;
				end
				
				S1: 
				begin
					doors = 3'b000;
					direction = 1;
					engine = 2'b10;
					if (requests[1] == 1)
						next_state <= S2;			
					else if (requests[2] == 1)
						next_state <= S4;
				end
				
				S2:
				begin 
					doors = 3'b010;
					requests[1] = 0;
					if (direction == 1)
						if (requests[2] == 1)
							next_state <= S4;
						else if (requests[0] == 1)
							next_state <= S3;
						else
							engine = 2'b00;	
							
					else
						if (requests[0] == 1)
							next_state <= S0;
						else if (requests[2] == 1)
							next_state <= S1;
						else
							engine = 2'b00;	
				end
					
				S3:
				begin
					doors = 3'b000;
					direction = 0;
					engine = 2'b11;
					if (requests[1] == 1)
						next_state <= S2;			
					else
						next_state <= S0;
				end
				
				S4:
				begin
					doors = 3'b100;
					requests[2] = 0;
					if (requests[1] == 1 || requests[0] == 1)
						next_state <= S3;
					else
						engine = 2'b00;
				end	
			endcase
		end
	end

endmodule
