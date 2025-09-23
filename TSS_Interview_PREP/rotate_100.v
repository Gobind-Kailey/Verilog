




module rotate_100(

    // liist my inputs 

    input wire clk,
    input wire load, 
    input wire [99:0] data,
    
    input wire [1:0] ena,
    output reg[99:0] q


);


always @(posedge clk) begin 

    if(load) q <= data; 
    
    else begin 


    case(ena) 

    2'01: begin // Shifting right 

    q <= {q[0], q[99:1]}; 


    end 

    2'10: begin 

        q <= {q[98:0], q[99]};
    end 



    default: 
        q <= q; 

    

    endcase 

    end 

end 



endmodule