


/*




*/


module top_module
(
    input wire[3:0] state,
    input wire in,
    output reg out, 
    output reg[3:0] next_state
);

// parameter A = 4'b0001, B = 4'b0010, C = 4'b0100, D = 4'b1000; 



    assign next_state[0] = (~in) & (state[0] | state[2]);   
    assign next_state[1] = (in) & (state[0] | state[1] | state[3]);
    assign next_state[2] = (~in) & (state[1] | state[3]); 
    assign next_state[3] = (in) & (state[2]);


    assign out = state[3]; 


endmodule 