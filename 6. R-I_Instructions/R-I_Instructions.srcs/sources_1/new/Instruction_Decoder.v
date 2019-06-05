`timescale 1ns / 1ps
module Instruction_Decoder(
    input[5:0] OP,func,
    output reg[3:0] ALU_OP,
    output reg Write_Reg,rd_rt_s,rt_imm_s,imm_s,alu_men_s,Mem_Write
    );
    
    always @(*)
        begin
            case(OP)
                6'b000000:
                    begin
                        case(func)
                            6'b100000:ALU_OP <= 4'b0100;
                            6'b100010:ALU_OP <= 4'b0101;
                            6'b100100:ALU_OP <= 4'b0000;
                            6'b100101:ALU_OP <= 4'b0001;
                            6'b100110:ALU_OP <= 4'b0010;
                            6'b100111:ALU_OP <= 4'b0011;
                            6'b101011:ALU_OP <= 4'b0110;
                            6'b000100:ALU_OP <= 4'b0111; 
                        endcase
                        rd_rt_s <= 0;
                        rt_imm_s <= 0;
                        imm_s <= 0;
                        alu_men_s <= 0;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end
                6'b001000:
                    begin
                        ALU_OP <= 4'b0100;
                        rd_rt_s <= 1; 
                        imm_s <= 1;
                        rt_imm_s <= 1;
                        alu_men_s <= 0;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end  
                6'b001100:
                    begin
                        ALU_OP <= 4'b0000;
                        rd_rt_s <= 1;
                        imm_s <= 0;
                        rt_imm_s <= 1;
                        alu_men_s <= 0;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end   
                6'b001110:
                    begin
                        ALU_OP <= 4'b0001;
                        rd_rt_s <= 1;
                        imm_s <= 0;
                        rt_imm_s <= 1;
                        alu_men_s <= 0;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end   
                6'b001011:
                    begin
                        ALU_OP <= 4'b0110;
                        rd_rt_s <= 1;
                        imm_s <= 0;
                        rt_imm_s <= 1;
                        alu_men_s <= 0;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end
                6'b100011:
                    begin
                        ALU_OP <= 4'b0100;
                        rd_rt_s <= 1;
                        imm_s <= 1;
                        rt_imm_s <= 1;
                        alu_men_s <= 1;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end
                6'b101011:
                    begin
                        ALU_OP <= 4'b0100;
                        rd_rt_s <= 0;
                        imm_s <= 1;
                        rt_imm_s <= 1;
                        alu_men_s <= 0;
                        Write_Reg <= 0;
                        Mem_Write <= 1;
                    end                          
            endcase
        end
endmodule
