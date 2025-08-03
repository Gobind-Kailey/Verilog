// module FIFO8x9(
//   input clk, rst,
//   input RdPtrClr, WrPtrClr, 
//   input RdInc, WrInc,
//   input [8:0] DataIn,
//   input rden, wren,
//   output reg [8:0] DataOut
// );
// //signal declarations

// 	reg [8:0] fifo_array[7:0];
// 	reg [2:0] wrptr, rdptr;
// 	wire [7:0] wr_cnt, rd_cnt;


// // reg [0:9] mem [0: 8]; 

// always@(posedge clk  or negedge rst)
//     begin

//         if(rst == 0) 
//         begin
//             rdptr <= 0; 
//             wrptr <= 0; 
//         end 
//         if(RdPtrClr)  rdptr <= 0; // fifo_array[0]; 
//         if(WrPtrClr)  wrptr <= 0;// fifo_array[0]; 

//         if(RdInc == 1) rdptr <= rdptr + 1;  // incremnet i in the array fifo_array
//         if(WrInc == 1) wrptr <= wrptr + 1;// Increment i but the write of it. 

//         // if(rden)? DataOut = fifo_array[rdptr] : DataOut = 1'bZ; 
//         if(rden) DataOut <= fifo_array[rdptr];
//         else DataOut <= 1'bz; 

//         if(wden) fifo_array[wrptr] <= DataIn; 

        

//     end 


// endmodule 

module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  input rden, wren,
  output reg [8:0] DataOut
);

// signal declarations
reg [8:0] fifo_array[7:0];
reg [2:0] wrptr, rdptr;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        rdptr <= 3'b000;
        wrptr <= 3'b000;
    end else begin
        // Clear read/write pointers if needed
        if (RdPtrClr) rdptr <= 3'b000;
        if (WrPtrClr) wrptr <= 3'b000;

        // Increment read/write pointers
        if (RdInc) rdptr <= rdptr + 1;
        if (WrInc) wrptr <= wrptr + 1;

        // Write logic
        if (wren) fifo_array[wrptr] <= DataIn;

        // Read logic
        if (rden)
            DataOut <= fifo_array[rdptr];
        else
            DataOut <= 9'bz;
    end
end

endmodule
