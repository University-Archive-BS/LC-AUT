`timescale 1ns / 1ps
module ram_usage(my_clk, my_rst, my_cs, my_pass_rw, my_admin_rw, my_lock_rw, my_count_rw,
 my_addr, my_pass_in, my_count_in, my_admin_in, my_lock_in, my_pass_out, my_count_out, my_admin_out, my_lock_out);

input my_clk, my_rst, my_cs, my_pass_rw, my_admin_rw, my_lock_rw, my_count_rw;
input [12:1]my_addr;
input [16:1]my_pass_in;
input [4:1] my_count_in;
input my_admin_in, my_lock_in;    
output [16:1]my_pass_out;
output [4:1] my_count_out;
output my_admin_out, my_lock_out;  
       
       
SYNCSRAM DUT(
          .clk(my_clk), 
          .rst(my_rst),
          .cs(my_cs),  //chip select
// read/write control   // read=0/write=1
          .pass_rw(my_pass_rw), 
          .admin_rw(my_admin_rw),
          .lock_rw(my_lock_rw),
          .count_rw(my_count_rw),
// address
          .addr(my_addr),// address
//input data
          .pass_in(my_pass_in),
          .count_in(my_count_in),
          .admin_in(my_admin_in),
          .lock_in(my_lock_in),
// output data
          .pass_out(my_pass_out), // data
          .count_out(my_count_out), // user try count
          .admin_out(my_admin_out),
          .lock_out(my_lock_out));
    
endmodule
