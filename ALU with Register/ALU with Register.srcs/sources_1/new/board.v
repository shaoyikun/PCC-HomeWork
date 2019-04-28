`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/28 10:50:58
// Design Name: 
// Module Name: board
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


module board(
    input[4:0] R_Addr_A,R_Addr_B,W_Addr,
    input[2:0] ALU_OP,
    input Write_Reg,clk,
    output ZF,OF
    );
    
    wire F;
    
    Register myRegister(.R_Addr_A(R_Addr_A),.R_Addr_B(R_Addr_B),
        .W_Addr(W_Addr),.Clk(clk),.W_Data(F),.Write_Reg(Write_Reg),
        .R_Data_A(R_Data_A),.R_Data_B(R_Data_B));
        
    ALU myALU(.X(R_Data_A),.Y(R_Data_B),.ZF(ZF),.OF(OF),.F(F));
endmodule
