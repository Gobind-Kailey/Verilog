module top_module (
    input  wire [1:0] state, 
    input  wire       in,
    output reg  [1:0] next_state, 
    output reg        out 
);

    // Named state encodings
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

    // Next state logic
    always @(*) begin
        case (state)
            A: next_state = (in) ? B : A;
            B: next_state = (in) ? B : C;
            C: next_state = (in) ? D : A;
            D: next_state = (in) ? B : C;
            default: next_state = A;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        out = (state == D);
    end

endmodule
