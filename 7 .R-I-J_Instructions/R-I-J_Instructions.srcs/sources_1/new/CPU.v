`timescale 1ns / 1ps
module CPU(
    input clk,myclk,rst,
    output ZF,
    output OF,
    output[31:0] PC,M_R_Data,ALU_F
    );
    
    wire[31:0] Inst_code,W_Data,R_Data_A,R_Data_B,imm_data,ALU_B,M_W_Data,PC_new;
    wire[25:0] address;
    wire[15:0] imm;
    wire[5:0] OP,func;
    wire[4:0] rs,rt,rd,W_Addr;
    wire[1:0] w_r_s,wr_data_s,PC_s;
    wire Write_Reg,imm_s,rt_imm_s,Mem_Write;
    wire[3:0] ALU_OP;
    
    assign OP = Inst_code[31:26];
    assign func = Inst_code[5:0];
    assign rs = Inst_code[25:21];
    assign rt = Inst_code[20:16];
    assign rd = Inst_code[15:11];
    assign imm = Inst_code[15:0];
    assign address = Inst_code[25:0];
    assign M_W_Data = R_Data_B;
    
    assign W_Addr = (w_r_s[1])?5'b11111:((w_r_s[0])?rt:rd);
    assign imm_data=(imm_s) ?{{16{imm[15]}},imm} :{{16{1'b0}},imm};
    assign ALU_B = (rt_imm_s) ? imm_data:R_Data_B;
    assign W_Data = (wr_data_s[1]) ? PC_new:((wr_data_s[0]) ? M_R_Data:ALU_F);
    
    Instructions myInstructions(.clk(myclk),.reset(rst),.Inst_code(Inst_code),.PC(PC),.PC_new(PC_new),
        .PC_s(PC_s),.imm_data(imm_data),.R_Data_A(R_Data_A),.address(address));
    Instruction_Decoder myInstruction_Decoder(.ZF(ZF),.OP(OP),.func(func),.Write_Reg(Write_Reg),
        .ALU_OP(ALU_OP),.w_r_s(w_r_s),.imm_s(imm_s),.rt_imm_s(rt_imm_s),.wr_data_s(wr_data_s),
        .Mem_Write(Mem_Write),.PC_s(PC_s));
    Register myRegister(.R_Addr_A(rs),.R_Addr_B(rt),.W_Addr(W_Addr),.W_Data(W_Data),
        .Write_Reg(Write_Reg),.R_Data_A(R_Data_A),.R_Data_B(R_Data_B),.Reset(rst),.clk(myclk));
    ALU myALU(.A(R_Data_A),.B(ALU_B),.ALU_OP(ALU_OP),.ZF(ZF),.OF(OF),.F(ALU_F));
    Data_ROM myData_ROM (
    .clka(clk),    // input wire clka
    .wea(Mem_Write),      // input wire [0 : 0] wea
    .addra(ALU_F[5:0]),  // input wire [5 : 0] addra
    .dina(M_W_Data),    // input wire [31 : 0] dina
    .douta(M_R_Data)  // output wire [31 : 0] douta
    );
endmodule
