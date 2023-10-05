module PC
#(parameter WIDTH = 32) 
(
input clk, reset_n,
input [WIDTH-1:0] data_in,
output reg [WIDTH-1:0] data_out //PIPO register
);
always@(posedge clk, negedge reset_n)
begin
  if(!reset_n)
    data_out = 32'd0;
  else 
    data_out =data_in;     
end
endmodule
