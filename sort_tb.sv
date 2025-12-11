
`timescale 1ns/1ps

module sort_tb;
parameter width= 32;

  logic clk;
  logic rst;
logic signed[31:0] a;
logic signed[31:0] b;
logic sel;
logic[31:0] maxf,medh,medl,minf;
logic[width-1:0] min [9:0];
logic[width-1:0] max [9:0];

sort uut(
.a(a),
.b(b),
.sel(sel),
.clk(clk),
.rst(rst),
.maxf(maxf),
.medh(medh),
.medl(medl),
.min(min),
.max(max),
.minf(minf));

initial clk = 0;
initial rst = 0;

initial forever begin
#5
clk = ~clk;
end

initial begin //main block
#12
rst = 1; //2 ns into low edge
a = 32'd12;
b = 32'd6;
sel = 1'b0;
#10;
a = 32'sd2;
b=-8;
sel = 1'b1;
#100;

$finish;
end




endmodule