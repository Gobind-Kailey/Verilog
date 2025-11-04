



module top_module
(

    input wire[3:0] x,
    input wire[3:0] y,

    output reg[4:0] sum

);

wire [3:0] cout;  

always@(*)
	begin 

        {cout[0], sum[0]} = x[0] + y[0]; 
        {cout[1], sum[1]} = x[1] + y[1] + cout[0]; 
        {cout[2], sum[2]} = x[2] + y[2] + cout[1];
        {sum[4], sum[3]} = x[3] + y[3] + cout[2]; 

    end 


endmodule