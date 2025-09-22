

// We have 2 states: IDLE and Active 
// We an input which is called "start" 
    // When = 1, it will go to active state, otherwise IDLE


module fsm_2_state(
    // State inputs and outputs 

    input wire clk, 
    input wire rst, 
    output reg busy

)

// We will use 1 Bit here
parameter IDLE= 1'b0,
          ACTIVE= 1'b1


// Note that the line above tells the system that we want 2 bits for current and next state. 
// reg [1:0] current_state, next_state;
// Correct implimentation        
reg current_state, next_state;        


// State Registor (Sequential Logic)

always @(posedge clk) begin 

    if(rst) current_state <= IDLE; 
    else current_state <= next_state; 
    // otherwise it just keeps it current state 

end


// Next-State logic (Combinational)

always @(*) begin

    case(current_state)
    
        IDLE: next_state = ACTIVE;
        ACTIVE: next_state = IDLE; 
        default: next_state = IDLE;

    endcase

end
// Output Logic 

always@(*) begin 

    case(current_state)
        
        IDLE: busy = 1'b0; 
        ACTIVE: busy = 2'b1;
        default: bus = 1'b0; 
    endcase 



end






endmodule