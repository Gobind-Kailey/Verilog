


// clk 
// adding 
/// subtract 
// or | 
// unsigned shifting right 


module alu(

// declaring port list:

    input wire clk, 
    input wire [7:0] A, 
    input wire [7:0] B, 
    input wire rst, // aysnc

    input wire [2:0] op,

    output reg[7:0] output_alu, 


); 


always @(posedge clk or posedge rst) begin 

    if(rst) output_alu <=  8{1'b0}; 

    else begin

    case(op) 

    3'b000: {cout, output_alu} <= A + B; 
    3'b001: output_alu <= A - B; 
    3'b010: output_alu <= A & B; 
    3'b100: output_alu <= A | B; 
    3'b101: output_alu <= A << 1; 
    3'b110: output_alu <= A >> 1; 
    default: output_alu <=  8{1'b0};

    endcase 
    end 


end 



endmodule


