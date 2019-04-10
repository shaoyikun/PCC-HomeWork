`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 14:13:24
// Design Name: 
// Module Name: register
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


module register(
    input[5:0] R_Addr_A,R_Addr_B,W_Addr,
    input Write_Reg,Reset,Clk,
    input[31:0] W_Data,
    output[31:0] R_Data_A,R_Data_B
    );
    
    reg [5:0] i;
    reg[31:0] REG_Files[0:31];
    
    assign R_Data_A = REG_Files[R_Data_A];
    assign R_Data_B = REG_Files[R_Data_B];
    
    always @(posedge Clk or posedge Reset)
    begin 
        if(Reset)
            for(i = 0; i <= 31; i=i+1)
                REG_Files[i] <= 0;
        else
            begin
                if(Write_Reg)
                    REG_Files[W_Addr] <= W_Data;
            end         
    end
    
endmodule
