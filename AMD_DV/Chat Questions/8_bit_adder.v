
/*
You are given an 8-bit adder module with overflow flag. 
The module interfaces as module adder8(input [7:0] a, input [7:0] b, 
output [7:0] sum, output overflow);. Write a small set of test vectors 
to cover “normal add”, “overflow”, “zero result”, and “max/min values”. 
Then how would you automate this in a Verilog testbench?

*/


module adder8
(

    input wire [7:0] a,
    input wire [7:0] b,  
    output reg [7:0] sum, 
    output reg overflow

);

always @(*) begin

    sum = a + b; 

    overflow = (a[7] == b[7]) & (sum[7] != a[7]); // if this is 1, then overflow
end 



endmodule 

