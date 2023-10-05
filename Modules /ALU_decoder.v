module ALU_decoder(
input [5:0] func,
input [1:0] alu_op,
output reg [2:0] alu_control
);
always@(*)
begin
  case(alu_op)
    2'b00 : alu_control = 3'b010;
    2'b01 : alu_control = 3'b100;
    2'b10 : begin
              case(func)
                6'b10_0000 : alu_control = 3'b010;
                6'b10_0010 : alu_control = 3'b100;
                6'b10_1010 : alu_control = 3'b110;
                6'b01_1100 : alu_control = 3'b101; 
                default : alu_control = 3'b010;             
              endcase    
           end
    default : alu_control = 3'b010;         
  endcase
end
endmodule
