module fulladd4 (
    input  [3:0] a,       // 4-bit input A
    input  [3:0] b,       // 4-bit input B
    input        cin,     // Carry-in
    output [3:0] sum,     // 4-bit sum
    output       c_out    // Carry-out
);

    wire [3:0] carry;     // Internal carry wires

    // First full adder (bit 0)
    assign sum[0] = a[0] ^ b[0] ^ cin;
    assign carry[0] = (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin);

    // Second full adder (bit 1)
    assign sum[1] = a[1] ^ b[1] ^ carry[0];
    assign carry[1] = (a[1] & b[1]) | (a[1] & carry[0]) | (b[1] & carry[0]);

    // Third full adder (bit 2)
    assign sum[2] = a[2] ^ b[2] ^ carry[1];
    assign carry[2] = (a[2] & b[2]) | (a[2] & carry[1]) | (b[2] & carry[1]);

    // Fourth full adder (bit 3)
    assign sum[3] = a[3] ^ b[3] ^ carry[2];
    assign c_out   = (a[3] & b[3]) | (a[3] & carry[2]) | (b[3] & carry[2]);

endmodule