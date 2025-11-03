
/*

Build a 100-bit left/right rotator, with synchronous load and left/right enable. A rotator shifts-in the shifted-out bit from the other end of the register, unlike a shifter that discards the shifted-out bit and shifts in a zero. If enabled, a rotator rotates the bits around and does not modify/discard them.

load: Loads shift register with data[99:0] instead of rotating.
ena[1:0]: Chooses whether and which direction to rotate.
2'b01 rotates right by one bit
2'b10 rotates left by one bit
2'b00 and 2'b11 do not rotate.
q: The contents of the rotator.

2^7 
If a bit is enabled it will rotate and create a looping logic 

*/

module top_module
(

    input wire clk, 
    input wire load, 
    input reg[99:0] data, 
    input reg[1:0] ena, // rotate direction 
    output reg[99:00] q 

); 

always@(posedge clk) begin 

    if(load) q <= data; 
    else begin 
        case(ena)

            2'b01 : q <= {q[0], q[99:1]}; // shift right
        2'b10 : q <= {q[98:0], q[99]}; // shift left
        2'b00 : q <= {q[99:0]}; // Hold current value 

        endcase
    end 
end 

// always@(*) begin 

    

// end 


endmodule 

