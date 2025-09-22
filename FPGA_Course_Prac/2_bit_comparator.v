module Comparator2(
   input[1:0] A, B,
   output reg Equals
);      		
                   	          	


	always@(*) // This means we will be checking this combinational logic whenever there is an input change 
		begin
   			if(A == B) Equals = 1'b1;
			else Equals = 1'b0;
		end // Verilog doesn't require the use of ; after begin or end blocks  



endmodule // Comparator2 