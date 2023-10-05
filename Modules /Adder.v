module Adder
#(parameter WIDTH = 32) 
(
input [WIDTH-1:0] inp1, inp2,
output [WIDTH-1:0] out
);

assign out = inp1 + inp2;

endmodule
