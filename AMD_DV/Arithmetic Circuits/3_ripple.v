
/*
Now that you know how to build a full adder, make 3 instances of it 
to create a 3-bit binary ripple-carry adder. The adder adds two 3-bit 
numbers and a carry-in to produce a 3-bit sum and carry out. To encourage 
you to actually instantiate full adders, also output the carry-out from 
each full adder in the ripple-carry adder. cout[2] is the final carry-out 
from the last full adder, and is the carry-out you usually see.

*/
module fsm_add
(
    input wire a, b, cin,
    output reg cout, sum  
    

); 
    // using continous assignment  
   assign {cout, sum} = a + b + cin; 

endmodule 

module top_module 
(
    input wire [2:0] a, b , 
    input wire cin,
    output wire[2:0] cout, sum
); 

    // {cout[0], sum[0]} = a + b + cin;
    // {cout[1], sum[1]} = a + b + cout[0];
    // {cout[2], sum[2]} = a + b + cout[1];

    // Cannot assign when initaiating a module 
    fsm_add fa1 (.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
    fsm_add fa2 (.a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    fsm_add fa3 (.a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));




endmodule 