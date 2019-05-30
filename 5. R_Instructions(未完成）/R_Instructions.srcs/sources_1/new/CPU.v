`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/30 18:40:47
// Design Name: 
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU(
    input clk,rst,
    output ZF,OF,
    output[31:0] ALU_F
    );
    
    wire[31:0] Inst_code,W_Data,R_Data_A,R_Data_B;
    wire[5:0] OP,func;
    wire[4:0] rs,rt,rd;
    wire[2:0] ALU_OP;
    wire Write_Reg;
    
    assign OP = Inst_code[31:27];
    assign func = Inst_code[5:0];
    assign rs = Inst_code[26:22];
    assign rt = Inst_code[21:17];
    assign rd = Inst_code[16:12];
    assign ALU_F = W_Data;
    
    Instructions myInstructions(.clk(clk),.reset(rst),.Inst_code(Inst_code));
    Instruction_Decoder myInstruction_Decoder(.OP(OP),.func(func),.Write_Reg(Write_Reg),.ALU_OP(ALU_OP));
    Register myRegister(.R_Addr_A(rs),.R_Addr_B(rt),.W_Addr(rd),.W_Data(W_Data),
        .Write_Reg(Write_Reg),.R_Data_A(R_Data_A),.R_Data_B(R_Data_B));
    ALU myALU(.A(R_Data_A),.B(R_Data_B),.ALU_OP(ALU_OP),.ZF(ZF),.OF(OF),.F(W_Data));
    
endmodule
