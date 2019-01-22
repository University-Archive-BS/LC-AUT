// you can use comparator as follow, in this sample code you can change comparator width using width parameter defined in code, 
// simply by changing this parameter your data width changes



module compare_usage(inp1, inp2, my_res);

parameter my_compare_width = 4;
input [my_compare_width:1]inp1, inp2;
output my_res;

compare #(.W(my_compare_width)) DUT(    
    .a(inp1),
    .b(inp2),
    .result(my_res));
    

endmodule