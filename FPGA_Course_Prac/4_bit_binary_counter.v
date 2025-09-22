module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input

    // Counting can only take place if both are enabled. 
    input ENP,            // Count Enable Parallel

    // Trickle implies carry forward the count behaviour to another chip 
    input ENT,            // Count Enable Trickle
    // I added the reg here to let the compiler know, The reason why this is important 
    // is because this allows Q to be an output to the outside world but also 
    // Q is stored in a register. 
    output reg [3:0]Q,        // Parallel Output 	

    // Parallel counter which is more of a carry out flag 
    output RCO            // Ripple Carry Output (Terminal Count) 
); 


always @(posedge CLK or negedge CLR_n) // What is in the sensitivity list, is what runs the block when active 
	begin 
        // Asynchronous resets typically go first before clocked logic
		if(~CLR_n) 
            Q <= 4'b0000; 

        else if(~Load_n) 
            Q <= D; // whatever user inputs // would I have to create a seperate variable? 

        else if(ENP & ENT)  
            Q <= Q + 1; 

	end 
        // RCO logic which is combinational 
        assign RCO = ((Q == 4'b1111) && ENT && ENP); 
endmodule