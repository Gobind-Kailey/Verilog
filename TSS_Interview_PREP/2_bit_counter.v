
// need to impliment a 2 bit adder
// make sure a rst is included 
// This will count from 0 - 3


module two_bit_counter (

    // Create a list of our inputs and outputs
    input wire clk, 
    input wire rst, 

    output reg [1:0] counter

);

always @(posedge clk or posedge rst) begin

    if(rst) counter <= 2'b00; 
    else 
        counter <= counter + 1; 

   


end


endmodule 