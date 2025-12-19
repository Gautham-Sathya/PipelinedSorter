module sort2 #(
    parameter width = 32
)(
    input  logic [width-1:0] a,
    input  logic [width-1:0] b,
    input  logic  sel,
	 input  logic  clk,
	 input  logic  rst,
	 

    output logic [width-1:0] maxf,
	 output logic [width-1:0] medh,
    output logic [width-1:0] medl,
    output logic [width-1:0] minf
);

logic[width-1:0] min [9:0]; //intermediate values
logic[width-1:0] max [9:0];
logic[width-1:0] start [3:0];
  
cas cas1(
.a(start[0]),
.b(start[1]),
.min(min[0]),
.max(max[0])
);
cas cas2(
.a(start[2]),
.b(start[3]),
.min(min[6]),
.max(max[6])

);
cas cas3(
.a(max[2]),
.b(max[7]),
.min(min[3]),
.max(max[3])
);
cas cas4(
.a(min[7]),
.b(min[2]),
.min(min[8]),
.max(max[8])
);
cas cas5(
.a(min[4]),
.b(max[9]),
.min(min[5]),
.max(max[5])

); 


    always_ff @(posedge clk or negedge rst)begin
	 
	 if(~rst) begin //for deterministic behaviour
	 //for(int i = 0; i<10; i++) begin
		//min[i] <=32'b0;
		//max[i] <=32'b0;
		//end
		
		start[0] <=32'b0;
		start[1] <=32'b0;
		start[2] <=32'b0;
		start[3] <=32'b0;
		maxf<=32'b0;
		medh<=32'b0;
		medl<=32'b0;
		minf<=32'b0;
	 end
	 else begin
	 
		//initial values
		if(~sel)begin
			start[0]<=a;
			start[1]<=b;
			
			end
		else begin
			start[2]<=a;
			start[3]<=b;
			end
			
		
		 //pipeline
		 //stage 0
		 min[1]<=min[0];
		 max[1]<=max[0];
		 
		 
		 //stage 1
		 min[2]<=min[1];
		 max[2]<=max[1];
		 min[7]<= min[6];
		 max[7]<= max[6];
		 
		 
		 //stage 2
		 min[4]<=min[3];
		 max[4]<=max[3];
		 min[9]<= min[8];
		 max[9]<= max[8];
		 
	
		//stage 3
		 maxf<=max[4];
		 medh<=max[5];
		 medl <=min[5];
		 minf<=min[9];
		 
	 end//else
            end//always end

endmodule
