


// Impliment a 2-1 mux.
// There would be 2 inputs and each of them 4 bits wide. 
// There will be a one bit select line to be used. 
// Have to use case statements. 
// Add a default case 


module mux(

    // Now I will list the port list. 

    input wire [3:0] a,
    input wire [3:0] b,

    input wire sl, // select line 
    output reg [3:0] mux_out


);

always @(*) begin 

    case(sl)

    1'b0: mux_out = a; 
    1'b1: mux_out = b; 
    default: mux_out = 0000; 

    endcase

end 


endmodule