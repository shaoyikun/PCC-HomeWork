`timescale 1ns / 1ps
module CPU(
    input clk,rst,
    output ZF,
    output OF,
    output[31:0] PC,
    output[31:0] ALU_F
    );
    
    wire[31:0] Inst_code,W_Data,R_Data_A,R_Data_B;
    wire[5:0] OP,func;
    wire[4:0] rs,rt,rd;
    wire[3:0] ALU_OP;
    wire Write_Reg;
    
    assign OP = Inst_code[31:26];
    assign func = Inst_code[5:0];
    assign rs = Inst_code[25:21];
    assign rt = Inst_code[20:16];
    assign rd = Inst_code[15:11];
    assign ALU_F = W_Data;
    
    Instructions myInstructions(.clk(clk),.reset(rst),.Inst_code(Inst_code),.PC(PC));
    Instruction_Decoder myInstruction_Decoder(.OP(OP),.func(func),.Write_Reg(Write_Reg),.ALU_OP(ALU_OP));
    Register myRegister(.R_Addr_A(rs),.R_Addr_B(rt),.W_Addr(rd),.W_Data(W_Data),
        .Write_Reg(Write_Reg),.R_Data_A(R_Data_A),.R_Data_B(R_Data_B),.Reset(rst),.clk(clk));
    ALU myALU(.A(R_Data_A),.B(R_Data_B),.ALU_OP(ALU_OP),.ZF(ZF),.OF(OF),.F(W_Data));
    
endmodule
