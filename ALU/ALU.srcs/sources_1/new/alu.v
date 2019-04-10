`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 09:38:19
// Design Name: 
// Module Name: ALU
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
module alu(
    input [31:0] X,
    input[31:0] Y,
    input [3:0] ALU_OP,
    output [31:0]F,
    output ZF,
    output OF
    );
    
    selecter myselecter(X,Y,ALU_OP,F,ZF,OF);
        
endmodule
