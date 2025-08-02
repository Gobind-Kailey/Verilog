
module FullAdd4( A,B,Cin,Sum,Cout);                	
    input [3:0] A, B;, 
    input Cin; 			
    output [3:0] Sum;
    output Cout;

                   	          	
// student code here
    // genvar i; // Declare a variable for generating instances 
    //     // Note that genvar can be used to create an index for a loop
    // generate
    //     for(i = 0; i<4; i= i+1) begin : full_adder_loop
    
    
    
    // endgenerate
    
    wire [0:3] carry; // Declare a wire to hold the carry bit 

    assign Sum[0] = A[0] ^ B[0] ^ Cin; // Calculate the sum for the least significant bit
    assign carry[0] = (A[0] & B[0]) | (A[0] & Cin) | (B[0] & Cin); // Calculate the carry for the least significant bit

    assign Sum[1] = A[1] ^ B[1] ^ carry[0]; // Calculate the sum for the second bit
    assign carry[1] = (A[1] & B[1]) | (A[1] & carry[0]) | (B[1] & carry[0]); // Calculate the carry for the second bit      

    assign Sum[2] = A[2] ^ B[2] ^ carry[1]; // Calculate the sum for the third bit
    assign carry[2] = (A[2] & B[2]) | (A[2] & carry[1]) | (B[2] & carry[1]); // Calculate the carry for the third bit

    assign Sum[3] = A[3] ^ B[3] ^ carry[2]; // Calculate the sum for the most significant bit
    assign Cout = (A[3] & B[3]) | (A[3] & carry[2]) | (B[3] & carry[2]); // Calculate the final carry out

endmodule