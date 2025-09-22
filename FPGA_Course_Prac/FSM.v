module FSM(
  input In1, // Input
  input RST, // Reset   Active low
  input CLK, // Clock 
  output reg Out1   // Output 
);

parameter   A = 2'b00, 
            B = 2'b01,
            C = 2'b10; 


// reg currentstate = A; // Wrong because we cannot assign at time of declaration 
reg [1:0] currentstate, nextstate; 

always @(posedge CLK or negedge RST)
begin 

    if(~RST) // Then go back to state A
        currentstate <= A; 
    else 
        currentstate <= nextstate; // why do we have to define this? 
end 

always@(*)

begin
    case (currentstate)
        A: if(In1) nextstate = B; else nextstate = A; 

        B: if(In1) nextstate = B; else nextstate = C; 

        C: if(In1) nextstate = A; else nextstate = C;   

        default: nextstate = A; 
    endcase
end

// 2. Output logic
always @(*) begin
    case (currentstate)
        A, B: Out1 = 0;
        C:    Out1 = 1;
    endcase
end

endmodule