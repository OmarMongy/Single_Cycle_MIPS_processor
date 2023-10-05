module ALU
#(parameter WIDTH = 32, SEL = 3) 
(
input [WIDTH-1:0] inp1, inp2,
input [SEL-1:0] sel,
output reg [WIDTH-1:0] result,
output zero_flag
);

always@(*)
begin
  case(sel)
    3'b000 : result = inp1 & inp2;
    3'b001 : result = inp1 | inp2;
    3'b010 : result = inp1 + inp2;
   // 3'b011 : 
    3'b100 : result = inp1 - inp2;
    3'b101 : result = inp1 * inp2;
    3'b110 : result = (inp1 < inp2)? 32'd1 : 32'd0;
   // 3'b111 :
  endcase
end

assign zero_flag = result == 32'd0;
endmodule
