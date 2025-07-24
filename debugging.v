1  module find errors
2      input  _a[0:3];
3      output [3:0]b;
4      input [5:0]c
5  
6      wire [0:3]aw;
7      wire [3:0]bw;
8      reg [5:0]creg
9  begin
10     assign aw = a;
11     assign b = bw;
12     assign creg = c;
13 always
14     begin
15         if (creg = 4'h F)
16             bw <= aw;
17         else
18             bw <= '0101';
19         end;
20     end process;
21 end

// Found that lines 1, 2, 3, 4, 8, 9, 15, 18, 20 , 21 contain errors
// below is corrected code 

module find_errors(                           // line 1
  input  [0:3]a,                             // line 2
  input [5:0]c, 				// Line 4
  output [3:0]b                               // line 3
  );                                           // line 5
  wire [0:3]aw;                              // line 6
  reg [3:0]bw;                              // line 7 // Chaged to reg
  reg [5:0]creg;                              // line 8
                                        // line 9
  assign aw = a;                             // line 10
  assign b = bw;                             // line 11
  // assign creg = c;                           // line 12 Cannot place a value in creg which is reg by using assign
							// Assign is only used for continous assignment to wire types 
always @(*)                                       // line 13 
  begin 
                                     // line 14
    if (c == 6'h3F)   //creg is all 1s     // line 15  
       bw = aw;                             // line 16  
    else                                     // line 17
     bw = 4'b0101;                           // line 18   
                                         // line 19
  end                               // line 20  
endmodule                                          // line 21   