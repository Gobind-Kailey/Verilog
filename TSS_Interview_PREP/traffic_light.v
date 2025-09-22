


module traffic_light(
    // Creating ports, which are also visable outside of this module. 
    input wire clk, 
    input wire rst, // we will use async rst here 
    output reg [1:0] light
);


// States - We will need 2 bits for this 

    parameter RED = 2'b00,
              GREEN = 2'b01,
              YELLOW = 2'b10,

    // This would be local to this module 
    reg [1:0] state, next_state; 

    // state registor (Sequential logic)

    always @(posedge clk & posedge rst) begin 
        if(rst)
            state <= RED; // Default state 
        else 
            state <= next_state; // Updating the state 

    end 

    // Next-State Logic (Combinational)

    always @(*) begin 
        
        case(state)

            RED: next_state = GREEN; 
            GREEN: next_state = YELLOW; 
            YELLOW: next_state = RED; 
            default: next_state = RED; // Safe default 

        endcase
    end 


// Output logic(Combinational)

    always @(*) begin

        case(state) 
            RED: light = 3'b100; 
            GREEN: light = 3'b010; 
            YELLOW: light = 3'b001; 
            default: light = 3'b100; 
        endcase

    end 




endmodule 