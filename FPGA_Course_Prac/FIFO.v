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
