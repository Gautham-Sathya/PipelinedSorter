module cas #(
    parameter width = 32
)(
    input  logic [width-1:0] a,
    input  logic [width-1:0] b,
    output logic [width-1:0] min,
    output logic [width-1:0] max
);

    always_comb begin
        if ($signed(a) <= $signed(b)) begin
            min = a;
            max = b;
        end 
        else begin
            min = b;
            max = a;
        end
    end

endmodule

