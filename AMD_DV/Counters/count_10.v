/*

Build a decade counter that counts from 0 through 9, inclusive, with a period of 10.
The reset input is synchronous, and should reset the counter to 0.
*/

module top_module
(

    input wire clk, 
    input wire reset, // synchronous
    output reg[3:0] q 

);

always @(posedge clk) begin 

    if(reset) q <= 4'b0; 
    else if (q <= 4'd8)
        q <= q + 4'b1; 
    else q <= 4'b0;

end


endmodule 