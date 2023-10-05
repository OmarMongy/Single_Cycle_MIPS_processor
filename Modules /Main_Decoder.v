module Main_Decoder(
input [5:0] op_code,
output reg memtoreg, memwrite, branch, alusrc, regdest, regwrite, jump,
output reg [1:0] aluop
);
always@(*)
begin
  case(op_code)
    //lw
    6'b10_0011 : begin       
                  jump = 1'b0;
                  aluop = 2'b00;
                  memwrite = 1'b0;
                  regwrite = 1'b1;
                  regdest = 1'b0;
                  alusrc = 1'b1;
                  memtoreg = 1'b1;
                  branch = 1'b0; 
                end
    //sw               
    6'b10_1011 : begin
                  jump = 1'b0;
                  aluop = 2'b00;
                  memwrite = 1'b1;
                  regwrite = 1'b0;
                  regdest = 1'b0;
                  alusrc = 1'b1;
                  memtoreg = 1'b1;
                  branch = 1'b0; 
                end 
    //R-type                    
    6'b00_0000 : begin
                  jump = 1'b0;
                  aluop = 2'b10;
                  memwrite = 1'b0;
                  regwrite = 1'b1;
                  regdest = 1'b1;
                  alusrc = 1'b0;
                  memtoreg = 1'b0;
                  branch = 1'b0; 
                end
    //addi               
    6'b00_1000 : begin
                  jump = 1'b0;
                  aluop = 2'b00;
                  memwrite = 1'b0;
                  regwrite = 1'b1;
                  regdest = 1'b0;
                  alusrc = 1'b1;
                  memtoreg = 1'b0;
                  branch = 1'b0; 
                end
    //beq              
    6'b00_0100 : begin
                  jump = 1'b0;
                  aluop = 2'b01;
                  memwrite = 1'b0;
                  regwrite = 1'b0;
                  regdest = 1'b0;
                  alusrc = 1'b0;
                  memtoreg = 1'b0;
                  branch = 1'b1; 
                end
    //jump             
    6'b00_0010 : begin
                  jump = 1'b1;
                  aluop = 2'b00;
                  memwrite = 1'b0;
                  regwrite = 1'b0;
                  regdest = 1'b0;
                  alusrc = 1'b0;
                  memtoreg = 1'b0;
                  branch = 1'b0; 
                end
    default : begin
                  jump = 1'b0;
                  aluop = 2'b00;
                  memwrite = 1'b0;
                  regwrite = 1'b0;
                  regdest = 1'b0;
                  alusrc = 1'b0;
                  memtoreg = 1'b0;
                  branch = 1'b0; 
                end                                                                           
  endcase
end

endmodule
