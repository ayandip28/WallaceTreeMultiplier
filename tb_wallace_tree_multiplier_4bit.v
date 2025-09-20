`timescale 1ns / 1ps

module tb_wallace_tree_multiplier_4bit;

  // Inputs
    reg [3:0] A, B;

  // Output
    wire [7:0] P;

  // Instantiate the Unit Under Test (UUT)
    wallace_tree_multiplier_4bit uut (
        .A(A),
        .B(B),
        .P(P)
    );

  initial begin
        $display("=== Wallace Tree Multiplier Testbench ===");
        $display(" A  ×  B  =>  P (Hex)   |  P (Decimal)");
        $monitor("0x%h × 0x%h => 0x%h     |     %d", A, B, P, P);

  // Test cases
        A = 4'h0; B = 4'h0; #10;
        A = 4'hE; B = 4'hA; #10;
        A = 4'h2; B = 4'h3; #10;
        A = 4'h5; B = 4'h3; #10;
        A = 4'hF; B = 4'hF; #10;
        A = 4'hA; B = 4'h5; #10;
        A = 4'h9; B = 4'h6; #10;
        A = 4'h7; B = 4'h2; #10;

   $display("=== Testbench Completed ===");
        $finish;
    end
endmodule
