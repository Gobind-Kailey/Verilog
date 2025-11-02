

/*

This is a Moore state machine with two states, two inputs, and one output. Implement this state machine.

This exercise is the same as fsm2s, but using asynchronous reset.

*/

module fsm2
(
    // Ports List 
    input wire clk,
    input wire areset, 
    input wire j,
    input wire k, 
    output reg out  
);

parameter off = 0, on = 1; 

reg present_state, next_state; 


always@(posedge clk or posedge areset) begin 

    if(areset) present_state <= off; 
    else present_state <= next_state; 

end

always@(*) begin 

    case(present_state)
        
        off: next_state = (j)? on : off; 
        on: next_state = (k)? off : on; 
        default: present_state <= off; 

    endcase 
end 
always@(*) begin 
    
    out = (present_state); 

end 




endmodule 