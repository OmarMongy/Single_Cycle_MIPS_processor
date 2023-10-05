module Data_path
#(parameter WIDTH = 32)
(
input clk, reset_n,
input [WIDTH-1:0] ReadData,
input [WIDTH-1:0] Instr,
input [2:0] ALUControl,
input Jump, PCSrc, MemtoReg, ALUSrc, RegDst, RegWrite, //MemWrite,
output [WIDTH-1:0] PC,
output [WIDTH-1:0] ALUOut,
output [WIDTH-1:0] WriteData,
output Zero
);
wire [WIDTH-1:0] SrcA, SrcB;
//wire [WIDTH-1:0] ALUOut; 
wire [4:0] WriteReg;
wire [WIDTH-1:0] SignImm;
wire [WIDTH-1:0] Result;
wire [WIDTH-1:0] PCin;
wire [WIDTH-1:0] PCPlus4;
wire [WIDTH-1:0] ShiftResult;
wire [WIDTH-1:0] PCBranch;
wire [WIDTH-1:0] MUX4Out;

Register_File U0(
.clk(clk),
.reset_n(reset_n),
.WE3(RegWrite),
.A1(Instr[25:21]),
.A2(Instr[20:16]),
.A3(WriteReg),
.WD3(Result),
.RD1(SrcA),
.RD2(WriteData)
);

ALU U1(
.inp1(SrcA),
.inp2(SrcB),
.sel(ALUControl),
.result(ALUOut),
.zero_flag(Zero)
);

MUX 
#(.WIDTH(5))
MUX1(
.inp1(Instr[20:16]),
.inp2(Instr[15:11]),
.sel(RegDst),
.out(WriteReg)
); 
 
Sign_Extend Sign_Extend(
.inp(Instr[15:0]),
.out(SignImm)
);
 
MUX 
#(.WIDTH(WIDTH))
MUX2(
.inp1(WriteData),
.inp2(SignImm),
.sel(ALUSrc),
.out(SrcB)
); 

MUX 
#(.WIDTH(WIDTH))
MUX3(
.inp1(ALUOut),
.inp2(ReadData),
.sel(MemtoReg),
.out(Result)
);

PC 
#(.WIDTH(WIDTH))
U2(
.clk(clk),
.reset_n(reset_n),
.data_in(PCin),
.data_out(PC)
);

Adder 
#(.WIDTH(WIDTH))
U3(
.inp1(PC),
.inp2(32'd4),
.out(PCPlus4)
);

Shift_left_twice 
#(.WIDTH(WIDTH))
U4(
.inp(SignImm),
.out(ShiftResult)
);

Adder 
#(.WIDTH(WIDTH))
U5(
.inp1(ShiftResult),
.inp2(PCPlus4),
.out(PCBranch)
);

MUX 
#(.WIDTH(WIDTH))
MUX4(
.inp1(PCPlus4),
.inp2(PCBranch),
.sel(PCSrc),
.out(MUX4Out)
);

MUX 
#(.WIDTH(WIDTH))
MUX5(
.inp1(MUX4Out),
.inp2({PCPlus4[31:28], Instr[25:0], 2'b00}),
.sel(Jump),
.out(PCin)
);
endmodule
