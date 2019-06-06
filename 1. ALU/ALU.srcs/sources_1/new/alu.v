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
module ALU(
    input [31:0] X,
    input[31:0] Y,
    input [3:0] ALU_OP,
    output reg[31:0]F,
    output ZF,
    output OF
    );
    
    reg C32;
    
    always @*
        begin
            case(ALU_OP)
                4'b0000: F <= X & Y;
                4'b0001: F <= X | Y;
                4'b0010: F <= X ^ Y;
                4'b0011: F <= ~(X | Y);
                4'b0100: {C32,F} <= X + Y;
                4'b0101: {C32,F} <= X - Y;
                4'b0110: F <= X < Y ? 1 : 0;
                4'b0111: F <= Y << X; 
            endcase
        end
    assign ZF = ~(|F);   
    assign OF = X[31] ^ Y[31] ^ F[31] ^ C32;
        
endmodule
