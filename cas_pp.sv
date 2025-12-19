module cas_pp #(
    parameter width = 32
)(
    input  logic [width-1:0] a,
    input  logic [width-1:0] b,
    input  logic clk,
    input  logic rst,
    output logic [width-1:0] min,
    output logic [width-1:0] max
);


logic temp;

always_ff @(posedge clk or negedge rst)
 if(~rst) begin
	temp <=0;
	min <=0;
	max<=0;	
 end
 else begin
  temp<= ($signed(a) <= $signed(b));
  min <= temp ? a:b;
  max <= temp? b:a;
 end
endmodule

