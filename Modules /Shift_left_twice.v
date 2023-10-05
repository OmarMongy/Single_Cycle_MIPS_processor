module Shift_left_twice
#(parameter WIDTH = 32)  
(
input [WIDTH-1:0] inp,
output [WIDTH-1:0] out
);

assign out = inp << 2;

endmodule
