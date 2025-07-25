module Majority (A, B, C, Y);
   input  A, B, C;
   output Y;
   reg Y;

   always @(*) begin
      if ((A & B) | (A & C) | (B & C))
         Y = 1'b1;
      else
         Y = 1'b0;
   end
endmodule