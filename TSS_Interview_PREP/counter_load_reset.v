

// Create a counter that increments every clock cycle 
// Reset to 0 when reset is active   (Async)
// Load a specific value when load is asserted 
// Otherwise keep counting. 



module counter_load_rst #(
    parameter WIDTH = 8   // Creating an 8-bit counter and dont add ; 
)

(
    // When you are listing things use , and when you are doing some operation use ; 
    input wire clock, 
    input wire rst,
    input wire load,    
    
    input wire [WIDTH-1 : 0] load_val, // Loading value 
    output reg  [WIDTH-1 : 0]counter,  

);

always @(posedge clock or posedge rst) begin 

    // This will reset all the bit widths back to 0. because we dont know the size of counter
    // we will use this trick below, instead of explicly saying 8'b0, when we dont even know if its 8 bits.
    if(rst) counter <= {Width{1'b0}}; 
    else 

        if(load)
            counter <= load_val; 
        else 
            counter <= counter + 1; 

end


endmodule