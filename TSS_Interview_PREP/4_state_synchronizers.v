


// I have to create a 4 state synchronizer




module four_state_sync(

    // create a list of my ports 

    input wire clk, rst, 
    input wire async_signal,
    output reg sync_out // Will hold a value of 0 or 1, depending on if we reached the end or not. 

);


reg first_ff; 
reg sec_ff; 
reg third_ff; 

always @(posedge clk or posedge rst) begin 

    if(rst) sync_out <= 1'b0; 


    else 

        first_ff <= async_signal; 
        sec_ff <= first_ff; 
        third_ff <= sec_ff; 
        sync_out <= third_ff; 

end 

endmodule