`timescale 1ns / 1ps
module Instruction_Decoder(
    input[5:0] OP,func,
    output reg[3:0] ALU_OP,
    output reg Write_Reg,rd_rt_s,rt_imm_s,imm_s
    );
    
    always @(*)
        begin
            case(OP)
                6'b000000:
                    begin
                        case(func)
                            6'b100000:
                                begin
                                    ALU_OP <= 4'b0100;
                                    Write_Reg <= 1;
                                end
                            6'b100010:
                                begin
                                    ALU_OP <= 4'b0101;
                                    Write_Reg <= 1;
                                end
                            6'b100100:
                                begin
                                    ALU_OP <= 4'b0000;
                                    Write_Reg <= 1;
                                end
                            6'b100101:
                                begin
                                    ALU_OP <= 4'b0001;
                                    Write_Reg <= 1;
                                end
                            6'b100110:
                                begin
                                    ALU_OP <= 4'b0010;
                                    Write_Reg <= 1;
                                end
                            6'b100111:
                                begin
                                    ALU_OP <= 4'b0011;
                                    Write_Reg <= 1;
                                end
                            6'b101011:
                                begin
                                    ALU_OP <= 4'b0110;
                                    Write_Reg <= 1;
                                end
                            6'b000100:
                                begin
                                    ALU_OP <= 4'b0111;
                                    Write_Reg <= 1;
                                end
                        endcase
                    end
            endcase
        end
endmodule
