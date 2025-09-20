module wallace_tree_multiplier_4bit (
    input  [3:0] A, B,
    output [7:0] P
);
    wire [3:0] pp0, pp1, pp2, pp3;

   // Step 1: Generate partial products
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

   // Step 2: Shift partial products
    wire [7:0] s_pp0 = {4'b0000, pp0};             // No shift
    wire [7:0] s_pp1 = {3'b000, pp1, 1'b0};        // Shift left by 1
    wire [7:0] s_pp2 = {2'b00, pp2, 2'b00};        // Shift left by 2
    wire [7:0] s_pp3 = {1'b0, pp3, 3'b000};        // Shift left by 3

   // Step 3: Reduction using adders
    wire [7:0] sum1, carry1;
    wire [7:0] sum2, carry2;

   // First layer: add s_pp0 and s_pp1
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : layer1
            if (i == 0) begin
                half_adder HA1(s_pp0[i], s_pp1[i], sum1[i], carry1[i]);
            end else begin
                full_adder FA1(s_pp0[i], s_pp1[i], carry1[i-1], sum1[i], carry1[i]);
            end
        end
    endgenerate

   // Second layer: add sum1 and s_pp2
    generate
        for (i = 0; i < 8; i = i + 1) begin : layer2
            if (i == 0) begin
                half_adder HA2(sum1[i], s_pp2[i], sum2[i], carry2[i]);
            end else begin
                full_adder FA2(sum1[i], s_pp2[i], carry2[i-1], sum2[i], carry2[i]);
            end
        end
    endgenerate

  // Final addition: sum2 + s_pp3
    assign P = sum2 + s_pp3;

endmodule
