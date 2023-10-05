module Register_File
#(parameter WIDTH = 32, DEPTH = 5)
(
input clk, reset_n,  WE3,
input [DEPTH-1:0] A1, A2, A3,
input [WIDTH-1:0] WD3,
output reg [WIDTH-1:0] RD1, RD2
);
reg[WIDTH-1:0] RF [0:2**DEPTH-1];
integer i;
always@(posedge clk, negedge reset_n)
begin
if(!reset_n)
	   begin
		for(i = 0; i < 2**DEPTH-1 ; i = i + 1)
		     begin
			RF[i] <= 32'd0;
		     end
           end
 else if(WE3)
    RF[A3] <= WD3;
  else
    RF[A3] = RF[A3];
end
always@(*)
begin
 RD1 =  RF[A1];  
 RD2 =  RF[A2]; 
end
endmodule
