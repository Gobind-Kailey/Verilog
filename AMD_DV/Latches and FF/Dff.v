


// Use a clocked always block
//   copy d to q at every positive edge of clk
//   Clocked always blocks should use non-blocking assignments

module top_module 
(
    input wire clk,
    input wire d,
    output reg q
);

always@(posedge clk) begin

    q <= d; 

end 

endmodule 