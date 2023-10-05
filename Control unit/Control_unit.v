module Control_unit
#(parameter SIZE = 6)
(
input [SIZE-1:0] Opcode,
input [SIZE-1:0] Func,
input Zero,
output Jump, PCSrc, MemtoReg, ALUSrc, RegDst, RegWrite, MemWrite,
output [2:0] ALUControl
);

wire Branch;
wire [1:0] ALUOp;
assign PCSrc = Zero & Branch;

Main_Decoder U1(
.op_code(Opcode),
.memtoreg(MemtoReg),
.memwrite(MemWrite),
.branch(Branch),
.alusrc(ALUSrc),
.regdest(RegDst),
.regwrite(RegWrite),
.jump(Jump),
.aluop(ALUOp)
);

ALU_decoder U2(
.func(Func),
.alu_op(ALUOp),
.alu_control(ALUControl)
);

endmodule
