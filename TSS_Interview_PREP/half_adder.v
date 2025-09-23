

// Here we have to create a half adder 
// it will take 2 inputs --> a, b 
// There will be a sum and a cout. 




module half_adder(

    // Write all our port names 

  
    input wire a; 
    input wire b; 
    
    output wire c_out; 
    output wire sum; 
); 


assign sum = a ^ b; 
assign c_out = a & b; 

endmodule 