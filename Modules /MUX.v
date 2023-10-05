module MUX
#(parameter WIDTH = 32)
(
input [WIDTH-1:0] inp1, inp2,
input sel,
output [WIDTH-1:0] out
);

assign out = sel? inp2 : inp1;
  
endmodule
