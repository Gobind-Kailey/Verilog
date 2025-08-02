module RAM128x32 
#(
  parameter Data_width = 32,  //# of bits in word
            Addr_width = 7  // # of address bits // meaning we have 2^7 words 
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address, 
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );

    // Memory (Creating the 2D array)
    reg[Data_width-1:0] mem [0: 2**Addr_width-1]; 

    reg [Data_width-1: 0] q_reg; 
    assign q = q_reg; 

    always @(posedge clk)
    begin 
        
        if(we) mem[address] <= d; 
        q_reg <= mem[address]; 

    end
endmodule