





// // Use a clocked always block
// //   copy d to q at every positive edge of clk
// //   Clocked always blocks should use non-blocking assignments

// module top_module 
// (
//     input wire clk,
//     input wire[7:0] d,
//     output reg[7:0] q
// );

// always@(posedge clk) begin

//     q[0] <= d[0];
//     q[1] <= d[1]; 
//     q[2] <= d[2]; 
//     q[3] <= d[3]; 
//     q[4] <= d[4]; 
//     q[5] <= d[5]; 
//     q[6] <= d[6]; 
//     q[7] <= d[7]; 


// end 

// endmodule 







// Use a clocked always block
//   copy d to q at every positive edge of clk
//   Clocked always blocks should use non-blocking assignments

// For loop approch 

module top_module 
(
    input wire clk,
    input wire[7:0] d,
    output reg[7:0] q
);

always@(posedge clk) begin

    


end 

endmodule 