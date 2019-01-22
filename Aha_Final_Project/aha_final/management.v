`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AUT-CEIT
// Engineer: Ali Nazari
// Create Date:    17:12:13 12/22/2018 
// Module Name:    management 
//////////////////////////////////////////////////////////////////////////////////
module management(CLK, RST, BCD_input, logged_in);

	input CLK, RST;	// CLK and RST are rising edge

	input [3:0] BCD_input;
	// 0  to 9 BCDs are for numeric inputs digit by digit
	// *  --> 1011 --> 11
	// #  --> 1100 --> 12
	// *# --> 1101 --> 13
	// ## --> 1110 --> 14
	  
	reg [5:0]  present_state = 0, 
				  next_state = 0;
				  
	reg is_simple_user = 0, alarm = 0;
	reg [11:0] username_temp = 0, username_temp_2 = 0, username_temp_3 = 0;
	reg [15:0] password_temp = 0, password_temp_2 = 0, password_temp_3 = 0;
	
	//Admin password default is 1111
	
	//ram properties
	reg password_rw = 0,
		 admin_rw = 0, 
		 lock_rw = 0,
		 count_rw = 0, 
		 do_sth = 0,
		 set_admin = 0,
		 set_lock = 0;
		 
	reg [11:0] username_rw = 0;
	reg [15:0] set_password = 0;	  
	reg [3:0]  set_wrong_try = 0;
	
	wire [15:0] get_password;
	wire [3:0]  wrong_try = 0;
	wire is_admin,
		  is_lock; 
		  
	output reg logged_in = 0;
	
	parameter [5:0] S0  = 6'b000000, // ready to work and if get * will go to S1
						 S1  = 6'b000001, // got * and now is ready to get the first digit of the username
						 S2  = 6'b000010, // ready to get the second digit of the username
						 S3  = 6'b000011, // ready to get the third digit of the username
						 S4  = 6'b000100, // got the username completely and now check whether we have it or no
						 S5  = 6'b000101, // got the username completely and now detected as a valid username and waiting to see whether a user or an admin want to enter the password
						 S6  = 6'b000110, // ready to get the 1st digit of the password 
						 S7  = 6'b000111, // ready to get the 2nd digit of the password 
						 S8  = 6'b001000, // ready to get the 3rd digit of the password 
						 S9  = 6'b001001,	// ready to get the 4th digit of the password 
						 S10 = 6'b001010, // get the *# to finish entering password
						 S11 = 6'b001011, // check the validity of the password
						 S12 = 6'b001100, // simple user panel to enter movement inputs
						 S13 = 6'b001101, // increment the counter
						 S14 = 6'b001110, // check the counter whether lock the user or not
						 S15 = 6'b001111, // admin panel
						 S16 = 6'b010000, // get the 1st digit of the username in the admin panel
						 S17 = 6'b010001, // get the 2nd digit of the username in the admin panel
						 S18 = 6'b010010, // get the 3rd digit of the username in the admin panel
						 S19 = 6'b010011, // check the entered username in the admin panel
						 S20 = 6'b010100, // a non admin username entered and now waiting to see whether the client want to add or remove it
						 S21 = 6'b010101, // client wants to remove(lock) it
						 S22 = 6'b010110, // do remove process
						 S23 = 6'b010111, // client wants to add(unlock) it and we wait for the 1st digit of the password
						 S24 = 6'b011000, // ready to get the 2nd digit of the password
						 S25 = 6'b011001, // ready to get the 3rd digit of the password 
						 S26 = 6'b011010, // ready to get the 4th digit of the password
						 S27 = 6'b011011, // do add(unlock) process
						 S28 = 6'b011100, 
						 S29 = 6'b011101,
						 S30 = 6'b011110,
						 S31 = 6'b011111,
						 S32 = 6'b100000,
						 S33 = 6'b100001,
						 S34 = 6'b100010,
						 S35 = 6'b100011,
						 S36 = 6'b100100,
						 S37 = 6'b100101,
						 S38 = 6'b100110,
						 S39 = 6'b100111,
						 S40 = 6'b101000,
						 S41 = 6'b101001,
						 S42 = 6'b101010,
						 S43 = 6'b101011;
			
	SYNCSRAM DUT(
          .clk(CLK), 
          .rst(RST),
          .cs(do_sth),
			 
			 // read/write control   // read=0 / write=1
          .pass_rw(password_rw), 
          .admin_rw(admin_rw),
          .lock_rw(lock_rw),
          .count_rw(count_rw),

          .addr(username_rw), // username address
			 
			 //input data
          .pass_in(set_password),
          .count_in(set_wrong_try),
          .admin_in(set_admin),
          .lock_in(set_lock),
			 
			 // output data
          .pass_out(get_password),
          .count_out(wrong_try), // user wrong try count
          .admin_out(is_admin),
          .lock_out(is_lock));


	always @ (posedge CLK or posedge RST)
      if (RST)
			present_state <= S0;
      else 
			present_state <= next_state;

	always @ (BCD_input or present_state)
		case (present_state)
			S0:
			begin
				do_sth = 0;
				lock_rw = 0;
				set_lock = 0;
				username_rw = 0;
				if (BCD_input == 4'b1011)
					next_state <= S1;
			end
			S1:
				if (BCD_input < 4'b1010) // get the first digit of the username
				begin
					next_state <= S2;
					username_temp[11:8] = BCD_input;
				end
			S2: 
				if (BCD_input < 4'b1010) // get the second digit of the username
				begin
					next_state <= S3;
					username_temp[7:4] = BCD_input;
				end
			S3: 
				if (BCD_input < 4'b1010) // get the third digit of the username
				begin				
					username_temp[3:0] = BCD_input;
					username_rw <= username_temp;
					do_sth = 1;
					next_state <= S4;
				end
			S4:
			begin
				if (is_lock == 0) // here we check whether the user is valid or not			0 is valid
					next_state <= S5;
				else
					next_state <= S0;
			end
			S5:
			begin
				do_sth = 0;
				// get * or *#
				if (BCD_input == 4'b1011) // *
				begin
					if (is_admin)
					begin
						is_simple_user = 0;
						next_state <= S6; // login as admin
					end
					else
						next_state <= S0;
				end
				else if (BCD_input == 4'b1101) // *#
				begin
					next_state <= S6; // login as simple user
					is_simple_user = 1;
				end
				else
					next_state <= S0;
			end
			S6:
				if (BCD_input < 4'b1010)
				begin
					password_temp[15:12] = BCD_input;
					next_state <= S7; // 1st digit password
				end
			S7:
				if (BCD_input < 4'b1010)
				begin
					password_temp[11:8] = BCD_input;
					next_state <= S8; // 2nd digit password
				end
			S8:
				if (BCD_input < 4'b1010)
				begin
					password_temp[7:4] = BCD_input;
					next_state <= S9; // 3rd digit password
				end
			S9:
				if (BCD_input < 4'b1010)
				begin
					password_temp[3:0] = BCD_input;
					do_sth = 1;
					next_state <= S10; // 4th digit password
				end
			S10:
				if (BCD_input == 4'b1101)
					next_state <= S11;
			S11:
			begin
				if (get_password == password_temp) // check whether the password is true or not
					if (is_simple_user == 1)
						next_state <= S12; // go to user panel
					else
						next_state <= S15; // go to admin panel
				else 
				begin
					next_state <= S13; // go to counter to check whether we should lock the user or not
				end
				do_sth = 0;
			end
			S12:
			begin
				logged_in = 1;
				next_state <= S0;
			end
			S13:
			begin
				set_wrong_try = wrong_try + 1;
				count_rw = 1;
				do_sth = 1;
				next_state <= S14;
			end
			S14:
			begin
				count_rw = 0;
				do_sth = 0;
				if (wrong_try == 3)
				begin
					lock_rw = 1;
					set_lock = 1;
					do_sth = 1;
				end
				next_state <= S0;
			end
			S15:
			begin
				do_sth = 0;
				lock_rw = 0;
				set_lock = 0;
				username_rw = 0;
				admin_rw = 0;
				set_admin = 0;
				alarm = 0;
				password_rw = 0;
				username_temp_2 = 0;
				if (BCD_input == 4'b1011)
					next_state <= S16;
			end
			S16:
				if (BCD_input < 4'b1010) // get the 1st digit of the username in the admin panel
				begin
					next_state <= S17;
					username_temp_2[11:8] = BCD_input;
				end
			S17:
				if (BCD_input < 4'b1010) // get the 2nd digit of the username in the admin panel
				begin
					next_state <= S18;
					username_temp_2[7:4] = BCD_input;
				end
			S18:
				if (BCD_input < 4'b1010) // get the 3rd digit of the username in the admin panel
				begin
					next_state <= S19;
					username_temp_2[3:0] = BCD_input;
				end
			S19:
				if (username_temp == username_temp_2) // check the entered username in the admin panel
					next_state <= S28;  // go to add a new admin section
				else
					next_state <= S20; // go to add or remove a user
			S20:
				if (BCD_input == 4'b1101) // *#		remove
				begin
					username_rw <= username_temp_2;
					do_sth = 1;
					next_state <= S21;
				end
				else if (BCD_input == 4'b1100) // #		add
				begin
					username_rw <= username_temp_2;
					next_state <= S23;
				end
				else 
					next_state <= S0;
			S21:
			begin
				do_sth = 0;
				if (is_lock == 0)					
					next_state <= S22;
				else
				begin
					alarm = 1;
					next_state <= S15;
				end
			end
			S22:
			begin
				lock_rw = 1;
				set_lock = 1;
				do_sth = 1;
				next_state <= S15;
			end
			S23:
				if (BCD_input < 4'b1010)
				begin
					password_temp_2[15:12] = BCD_input;
					next_state <= S24; // 1st digit password
				end
			S24:
				if (BCD_input < 4'b1010)
				begin
					password_temp_2[11:8] = BCD_input;
					next_state <= S25; // 2nd digit password
				end
			S25:
				if (BCD_input < 4'b1010)
				begin
					password_temp_2[7:4] = BCD_input;
					next_state <= S26; // 3rd digit password
				end
			S26:
				if (BCD_input < 4'b1010)
				begin
					password_temp_2[3:0] = BCD_input;
					set_password = password_temp_2;
					next_state <= S27; // 4th digit password
				end
			S27:
			begin
				password_rw = 1;
				lock_rw = 1;
				set_lock = 0;
				do_sth = 1;
				next_state <= S15;
			end	
			S28:
				if (BCD_input == 4'b1011)
					next_state <= S29; // *
			S29:
				if (BCD_input < 4'b1010)
				begin
					password_temp_3[15:12] = BCD_input;
					next_state <= S30; // 1st digit password
				end
			S30:
				if (BCD_input < 4'b1010)
				begin
					password_temp_3[11:8] = BCD_input;
					next_state <= S31; // 2nd digit password
				end
			S31:
				if (BCD_input < 4'b1010)
				begin
					password_temp_3[7:4] = BCD_input;
					next_state <= S32; // 3rd digit password
				end
			S32:
				if (BCD_input < 4'b1010)
				begin
					password_temp_3[3:0] = BCD_input;
					next_state <= S33; // 4th digit password
				end
			S33:
				if (BCD_input == 4'b1101)
				begin
					next_state <= S34; // *#
				end
			S34:
				if (password_temp == password_temp_3) // check whether the password is true or not
					next_state <= S35;
				else 
				begin
					alarm = 1;
					next_state <= S15; // go to admin panel
				end
			S35:
				if (BCD_input == 4'b1011)
					next_state <= S36; // *
			S36:
				if (BCD_input < 4'b1010) // get the 1st digit of the username in the admin panel
				begin
					username_temp_3[11:8] = BCD_input;
					next_state <= S37;
				end
			S37:
				if (BCD_input < 4'b1010) // get the 2nd digit of the username in the admin panel
				begin
					username_temp_3[7:4] = BCD_input;
					next_state <= S38;
				end
			S38:
				if (BCD_input < 4'b1010) // get the 3rd digit of the username in the admin panel
				begin
					username_temp_3[3:0] = BCD_input;
					next_state <= S39;
				end
			S39:
				if (BCD_input == 4'b1110)
				begin
					username_rw <= username_temp_3;
					do_sth = 1;
					next_state <= S40; // ##
				end
			S40:
			begin
				do_sth = 0;
				if (is_lock == 0) // check whether this username is valid or not
					next_state <= S41;
				else 
				begin
					alarm = 1;
					next_state <= S15; // go to admin panel
				end
			end
			S41:
			begin
				admin_rw = 1;
				set_admin = 1;
				do_sth = 1;
				next_state <= S0;
			end
		endcase
endmodule
