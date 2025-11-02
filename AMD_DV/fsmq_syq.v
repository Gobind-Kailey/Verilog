

/*

This is a Moore state machine with two states, one input, and one output. Implement this state machine. Notice that the reset state is B.

This exercise is the same as fsm1, but using synchronous reset.

*/

module simple_fsm_sync
(
    input wire clk,
    input wire reset, 
    input wire in,
    output reg out 
   
);

parameter A = 0, B = 1; 

reg present_state , next_state; 

always@(posedge clk) begin 

    if(reset) present_state <= B;

    else present_state <= next_state; 

end 

always@(*) begin 

    case(present_state) 
        A: next_state = (in)? A: B; 
        B: next_state = (in)? B: A; 
        default: next_state = B; 
    endcase 

end 

// Output Block 

always@(*) begin 
    out = (present_state == B); 
end 

endmodule 