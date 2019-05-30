`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/30 19:15:51
// Design Name: 
// Module Name: Instruction_Decoder
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
module Instruction_Decoder(
    input[5:0] OP,func,
    output reg[2:0] ALU_OP,
    output reg Write_Reg
    );
    
    always @(*)
        begin
            case(OP)
                2'b000000:
                    begin
                        case(func)
                            6'b100000:
                                begin
                                    ALU_OP <= 3'b100;
                                    Write_Reg <= 1;
                                end
                            6'b100010:
                                begin
                                    ALU_OP <= 3'b101;
                                    Write_Reg <= 1;
                                end
                            6'b100100:
                                begin
                                    ALU_OP <= 3'b000;
                                    Write_Reg <= 1;
                                end
                            6'b100101:
                                begin
                                    ALU_OP <= 3'b001;
                                    Write_Reg <= 1;
                                end
                            6'b100110:
                                begin
                                    ALU_OP <= 3'b010;
                                    Write_Reg <= 1;
                                end
                            6'b100111:
                                begin
                                    ALU_OP <= 3'b011;
                                    Write_Reg <= 1;
                                end
                            6'b101011:
                                begin
                                    ALU_OP <= 3'b110;
                                    Write_Reg <= 1;
                                end
                            6'b000100:
                                begin
                                    ALU_OP <= 3'b111;
                                    Write_Reg <= 1;
                                end
                        endcase
                    end
            endcase
        end
endmodule
