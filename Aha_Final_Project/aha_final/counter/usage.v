`timescale 1ns / 1ps
module usage(my_clk, my_rst, my_direction, my_count);

input my_clk, my_rst, my_direction;
output [3:0] my_count;

// you can use counter module as follow, this module should be reset at beginning, after that it counts by rising edge of clk
// this counter could count upward and downward depending on direction signal, 0 -> upward and 1 -> downward

counter DUT(
    .clk(my_clk),
    .rst(my_rst),
    .direction(my_direction),
    .my_count(my_count));


endmodule
