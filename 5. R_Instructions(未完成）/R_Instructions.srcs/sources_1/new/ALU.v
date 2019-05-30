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
    input [31:0] A,
    input[31:0] B,
    input [3:0] ALU_OP,
    output reg[31:0]F,
    output ZF,
    output OF
    );
    
    reg C32;
    
    always @*
        begin
            case(ALU_OP)
                4'b0000: F <= A & B;
                4'b0001: F <= A | B;
                4'b0010: F <= A ^ B;
                4'b0011: F <= ~(A | B);
                4'b0100: {C32,F} <= A + B;
                4'b0101: {C32,F} <= A - B;
                4'b0110: F <= A < B ? 1 : 0;
                4'b0111: F <= A << B; 
            endcase
        end
    assign ZF = ~(|F);   
    assign OF = A[31] ^ B[31] ^ F[31] ^ C32;
        
endmodule
