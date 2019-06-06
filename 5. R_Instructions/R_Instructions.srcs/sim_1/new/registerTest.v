`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/31 12:53:50
// Design Name: 
// Module Name: registerTest
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


module registerTest(
output[31:0] R_Data_A,R_Data_B
    );
    reg clk = 0;
    reg rst = 0;
    reg Write_Reg = 0;
    reg[4:0] rs,rt,rd;
    reg[31:0] W_Data = 0;
    
    Register myRegister(.R_Addr_A(rs),.R_Addr_B(rt),.W_Addr(rd),.W_Data(W_Data),
        .Write_Reg(Write_Reg),.R_Data_A(R_Data_A),.R_Data_B(R_Data_B),.Reset(rst),.clk(clk));
    
    initial 
        begin
            #50;
            rs = 0;
            rt = 0;
            
        end
endmodule
