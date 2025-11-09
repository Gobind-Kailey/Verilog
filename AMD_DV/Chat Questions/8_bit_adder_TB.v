

/*
You are given an 8-bit adder module with overflow flag. 
The module interfaces as module adder8(input [7:0] a, input [7:0] b, 
output [7:0] sum, output overflow);. Write a small set of test vectors 
to cover “normal add”, “overflow”, “zero result”, and “max/min values”. 
Then how would you automate this in a Verilog testbench?

*/

module adder_8tb;  

reg[7:0] a, b;
wire [7:0] sum; 
wire overflow;

adder8 uut (            // uut- Unit under test 

    .a(a), 
    .b(b),
    .sum(sum),
    .overflow(overflow)

);

task run_test(input [7:0] ta, input [7:0] tb, input [7:0] expected_sum, input expected_overflow)
begin 

    a = tb; 
    b = tb; 
    #1 // adding a delay for combintational logic to settle

    $display("a=%0d b=%0d | sum=%0d (bin=%b) | overflow=%b"
        $signed(a), $signed(b), $signed(sum), sum, overflow); 

    // optional automated check: 

    if(sum != expected_sum || overflow != expected_overflow)
        $display("❌ Test Failed for a=%0d b=%0d", $signed(a), $signed(b)); 
    else
        $display("Passed test")

    
end 

endtask 


initial beign 
    $display("\n--- Testing Adder8 ---"); 

    // Normal addition (no overflow)

    run_test(8'd10, 8'd20, 8'd30, 0);

    // overflow
       // 2️⃣ Overflow case: 127 + 1 = -128
    run_test(8'd127, 8'd1, 8'd110000000, 1);

    // Zero case 
    run_test(-8'd10, 8'd0, 8'd0, 1); 

    run_test(8'd127, 8'd127, 8'b11111110, 1); // +127 + +127 → overflow
    run_test(-8'd128, -8'd1, 8'b01111111, 1); // -128 + -1 → overflow

     // 4️⃣ Max/min boundary values
    run_test(8'd127, 8'd127, 8'b11111110, 1); // +127 + +127 → overflow
    run_test(-8'd128, -8'd1, 8'b01111111, 1); // -128 + -1 → overflow

    $display("\nAll tests completed.\n");
    $finish;

endmodule 