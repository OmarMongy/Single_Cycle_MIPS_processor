module Instruction_Memory
#(parameter WIDTH = 32, DEPTH = 8)
(
input [WIDTH-1:0] addr,
output reg [WIDTH-1:0] data
);
reg[WIDTH-1:0] rom [0:2**DEPTH-1];

initial
  //$readmemh(" Number_Factorial.mem", rom);
begin
  /********************************FIND GCD FOR 120 and 180********************************/
  
		rom [0]  = 32'h00008020;    //add $s0, $0, $0
		rom [1]  = 32'h20100007;    //addi $s0, $0, 7
		rom [2]  = 32'h00008820;    //add $s1, $0, $0
		rom [3]  = 32'h20110001;    //addi $s1, $0, 1
		rom [4]  = 32'h12000003;    //beq $s1, $0, 3
		rom [5]  = 32'h0230881C;    //mul $s1, $s1, $s0
		rom [6]  = 32'h2210FFFF;    //addi $s0, $s0, -1
		rom [7]  = 32'h08000004;    //J  4
		rom [8]  = 32'hAC110000;    //sw $s1, 0($0)
		
  /********************************FIND FACTORIAL OF NUMBER 7********************************/
  
		   /* rom [0] = 32'h00008020;      // add $s0, $zero, $zero  
        rom [1] = 32'h20100078;      // addi $s0, $zero, 120 
        rom [2] = 32'h00008820;      // add $s1, $zero, $zero 
        rom [3] = 32'h201100B4;      // addi $s1, $zero, 180 
        rom [4] = 32'h00009020;      // add $s2, $zero, $zero 
        rom [5] = 32'h12110006;      // add $s2, $s1, $s1 
        rom [6] = 32'h0211482A;      // sub $s0, $s2, $s1 
        rom [7] = 32'h11200002;      // sw $s0, 2($zero) 
        rom [8] = 32'h02308822;      // sub $s2, $s1, $s0 
        rom [9] = 32'h08000005;      // beq $zero, $s0, 5 
        rom [10] = 32'h02118022;     // sub $s0, $s1, $s0 
        rom [11] = 32'h08000005;     // beq $zero, $s0, 5 
        rom [12] = 32'h00109020;     // sw $s2, 16($s0) 
        rom [13] = 32'hAC120000;     // lw $s2, 0($s0)*/ 
end
always@(*)
data = rom[addr>>2];

endmodule
