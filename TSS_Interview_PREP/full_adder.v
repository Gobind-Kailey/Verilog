

a b c_in    |   C_out sum
0 0 0       |    0     0
0 0 1       |    0     1
0 1 0       |    0     1
0 1 1       |    1     0
1 0 0       |    0     1
1 0 1       |    1     0
1 1 0       |    1     0 
1 1 1       |    1     1
            

module full_adder(

    // Write all our port names 

  
    input wire a,
    input wire b,
    input wire c_in,
    
    output wire c_out, 
    output wire sum 
); 


assign sum = a ^ b; 
assign c_out = a & b; 

endmodule 