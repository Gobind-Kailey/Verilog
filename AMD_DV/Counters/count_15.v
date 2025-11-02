

module top_module 
(
    input clk,
    input reset, 
    output reg[3:0] q 
);

// wire[3:0] counter; // 4 bits so 0-15 
always @(posedge clk) begin 

    if(reset) q <= 1'b0; 
    else q <= q + 4'b1; 
        
 
end 



endmodule