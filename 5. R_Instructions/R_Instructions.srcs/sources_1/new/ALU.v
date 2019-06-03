`timescale 1ns / 1ps
module ALU(
    input [31:0] A,
    input[31:0] B,
    input [3:0] ALU_OP,
    output reg[31:0]F,
    output ZF,
    output reg OF
    );
    
    wire myOF;
    reg C32;
    
    
    initial
        begin
            OF = 0;
        end
       
    assign ZF = ~(|F);   
    assign myOF = A[31] ^ B[31] ^ F[31] ^ C32;
    
    always @*
        begin
            case(ALU_OP)
                4'b0000: F <= A & B;
                4'b0001: F <= A | B;
                4'b0010: F <= A ^ B;
                4'b0011: F <= ~(A | B);
                4'b0100: 
                    begin
                        {C32,F} <= A + B;
                        OF <= myOF;
                    end
                4'b0101:
                    begin
                        {C32,F} <= A - B;
                        OF <= myOF;
                    end
                4'b0110: F <= A < B ? 1 : 0;
                4'b0111: F <= A << B; 
            endcase
        end 
endmodule
