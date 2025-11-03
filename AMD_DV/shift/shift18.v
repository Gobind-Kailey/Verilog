module top_module 
(
    input wire clk,
    input wire load,
    input wire[63:0] data,
    input wire ena, 
    input wire signed [1:0] amount, 

    output reg signed [63:0] q
);


  parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11; 


    always @(posedge clk) begin
        if (load) begin
            q <= data;                 // synchronous load has highest priority
        end
        else if (ena) begin
            case (amount)
                A:  q <= q << 1;  // arithmetic left (same as logical left)
                B:  q <= q << 8;
                C: q <= q >>> 1;  // arithmetic right: sign-bit (q[63]) is replicated
                D: q <= q >>> 8;
                default: q <= q;
            endcase
        end
        // else hold q
    end

endmodule
