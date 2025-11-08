

/*

Write Verilog code (module + testbench) for a 4-bit synchronous up/down counter 
with enable and asynchronous reset. Then discuss how you’d verify its operation 
(corner-cases, reset behaviour, enable toggling, overflow/underflow).


*/

/*

- 4 bit synchronous up/down counter - Clocked --> always posedge 
- Enable
- asynchronous Reset 

*/


module counter
(
    input wire clk, 
    input wire areset,  
    input wire enable,  // 1 is counting up 

    output reg[3:0] q

);

always @(posedge clk or posedge areset) begin 

    if(areset) q <= 4'd0; 

    else if (enable) begin

        q <= q + 1; 

    end 

    else q <= q - 1;    

end 


endmodule