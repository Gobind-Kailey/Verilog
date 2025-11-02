
/*
Build a 4-bit shift register (right shift), with asynchronous reset, synchronous load, and enable.

areset: Resets shift register to zero.
load: Loads shift register with data[3:0] instead of shifting.
ena: Shift right (q[3] becomes zero, q[0] is shifted out and disappears).
q: The contents of the shift register.
*/



module top_module
(
    input wire clk, 
    input wire areset, // reset shift reg back to 0
    input wire load, 
    input reg[3:0] data, 
    input wire ena, // shifting
    output reg[3:0] q// hold value 

); 


always @(posedge clk or negedge areset) begin 

    if(!areset) q <= 4'b0; 

    else if(load) begin

        q <= data;

    end 

    else if (ena) q <= q >> 1; 


end 


endmodule 
