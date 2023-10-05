module MIPS
#(parameter WIDTH = 32)
(
input clk, reset_n,
output [WIDTH/2-1:0] test_value
);
wire [WIDTH-1:0] ReadData;
wire [WIDTH-1:0] Instr;
wire [WIDTH-1:0] PC;
wire [WIDTH-1:0] ALUResult;
wire [WIDTH-1:0] WriteData;
wire Zero;
wire Jump, PCSrc, MemtoReg, ALUSrc, RegDst, RegWrite, MemWrite;
wire [2:0] ALUControl;


Data_path DP(
.clk(clk),
.reset_n(reset_n),
.ReadData(ReadData),
.Instr(Instr),
.ALUControl(ALUControl),
.Jump(Jump),
.PCSrc(PCSrc),
.MemtoReg(MemtoReg),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
//.MemWrite(MemWrite),
.PC(PC),
.ALUOut(ALUResult),
.WriteData(WriteData),
.Zero(Zero)
);

Control_unit CU(
.Opcode(Instr[31:26]),
.Func(Instr[5:0]),
.Zero(Zero),
.ALUControl(ALUControl),
.Jump(Jump),
.PCSrc(PCSrc),
.MemtoReg(MemtoReg),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.MemWrite(MemWrite)
);

Data_memory DM(
.clk(clk),
.reset_n(reset_n),
.WE(MemWrite),
.addr(ALUResult),
.WD(WriteData),
.RD(ReadData),
.test_value(test_value)
);

Instruction_Memory IM(
.addr(PC),
.data(Instr)
);

endmodule
