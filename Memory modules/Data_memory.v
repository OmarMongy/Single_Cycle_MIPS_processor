module Data_memory
#(parameter WIDTH = 32, DEPTH = 8)
(
input clk, reset_n, WE,
input [DEPTH-1:0] addr,
input [WIDTH-1:0] WD,
output reg [WIDTH-1:0] RD,
output reg [WIDTH/2-1:0] test_value 
);
reg [WIDTH-1:0] ram [0:2**DEPTH-1];
integer i;
always@(posedge clk, negedge reset_n)
begin
	if(!reset_n)
		begin
		     for(i = 0; i < 2**DEPTH-1 ; i = i + 1)
		     begin
			ram[i] <= 32'd0;
		     end
		end
 	else if(WE)
  		ram[addr] <= WD;
end 
always@(*)
begin
RD = ram[addr];
test_value = ram[32'd0];
end
endmodule
