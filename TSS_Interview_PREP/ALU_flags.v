


// Designing a 32 bit ALU 
// Addition
// Subtraction 
// Or 
// Xor 

/*
0 0 -> 0
0 1 -> 1
1 0 -> 1 
1 1 -> 0
*/


// Set less than   --> if a < b then result = 1 else result = 0; 
// Logical shift left 
// Logical shift right
// Arithematic shift right
// Flags: Zero , carry-out, overflow, negative 

// zero flags - see if an output is = 0, and if it is set this flag to 1. 


module ALU #(
    parameter WIDTH = 32 
)
(
    // Listing input and output ports 

    input wire [WIDTH -1, 0] a; 
    input wire [WIDTH -1, 0] b;
    input wire [2:0] alu_sl;  // This will be used to select which operation we will preform 
    
    output wire zero;
    output wire carry_out; 
    output wire overflow; 
    output wire negative; 

    output reg [WIDTH -1, 0] result;

       
) 


always @(*) begin 

    case(alu_sl)

    // Addition
    3'b000: {carry_out, result} = a + b; 
    3'b001: {carry_out, result} = a - b; 
    3'b010: result = a | b;  
    3'b011: a ^ b; // XOR operation 

    // Normally vectors are treated as being unsigned. 
    // This tells the compilar to interpret a as a 2's compliment 
    // $ means its a system task / function 
    // Here either all are 0's or we have 31 bits of 0 followed by 1. 
    3'b100: result = $signed(a) < $signed(b) ? {WIDTH{1'b0}, 1'b1} : {WIDTH{1'b0}};

    // Logical shift left and it could be any number from 0-31 which is why we choose 5 bits. 
    3'b101: result = a << b[4:0]; 
    3'b110: result = a >> b[4:0]; 
    3'b111: result = $signed(a) >>> b[4:0]; 
    default: result = {WIDTH{1'b0}}; 

    endcase 

end 





endmodule 