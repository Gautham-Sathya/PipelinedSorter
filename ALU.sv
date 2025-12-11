module ALU #(
    parameter WIDTH = 32
)(
    input  logic signed [WIDTH-1:0] a,
    input  logic signed [WIDTH-1:0] b,
    input  logic [2:0]              alu_op,  // operation select
    output logic signed [WIDTH-1:0] result
);

    always_comb begin
        case (alu_op)
            3'b000: result = a + b;        // ADD
            3'b001: result = a - b;        // SUB
            3'b010: result = a & b;        // AND
            3'b011: result = a | b;        // OR
            3'b100: result = a ^ b;        // XOR
            3'b101: result = a << b[4:0];  // SHIFT LEFT
            3'b110: result = a >>> b[4:0]; // SHIFT RIGHT ARITHMETIC
            3'b111: result = (a < b) ? 1 : 0; // SLT (signed)
            default: result = 0;
        endcase
    end

endmodule
