

// Code Sync 


module sync(

    input wire clk,
    // Create ports
    input wire signal, 
    output reg sync_out, 

);

reg first_ff; 

always @(posedge clk) begin 

    first_ff <= signal; 
    sync_out <= first_ff;

    // Use b as the registor to push to whatever the next stage is.  

end 


endmodule