

/*

Where there is a tap, we XOR with the output and input of pervious
to produce the next. 

Without a tap they just shift right 

*/ 


module top_module
(
    input wire clk,
    input wire reset, // Active-high synchronous reset to 5'h1
    output [4:0] q

);

always@(posedge clk) begin 

    if(reset) q <= 5'h1; 
    
    else begin 

    q[0] <= q[1];
    q[1] <= q[2]; 
    q[2] <= q[3] ^ q[0];
    q[3] <= q[4];
    q[4] <= 5'h0 ^ q[0]; 
       
    end 

end 


endmodule 