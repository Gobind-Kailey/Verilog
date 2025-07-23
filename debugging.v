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