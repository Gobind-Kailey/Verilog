module Majority (A, B, C, Y);                 	
   input  A, B, C;			
   output Y; 

   reg Y;           		
                   	          	
// student code here
   always @(*)
	begin 
		if((A & B == 1'b1) || (A & C == 1'b1) || (C & B == 1'b1)) assign Y = 1'b1;
		else assign Y = 1'b1; 
	end
endmodule // Majority  