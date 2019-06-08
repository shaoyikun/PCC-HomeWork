`timescale 1ns / 1ps
module Instruction_Decoder(
    input ZF,
    input[5:0] OP,func,
    output reg[3:0] ALU_OP,
    output reg[1:0] w_r_s,wr_data_s,PC_s,
    output reg Write_Reg,rt_imm_s,imm_s,Mem_Write
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
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b100010:
                                begin
                                    ALU_OP <= 4'b0101;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b100100:
                                begin
                                    ALU_OP <= 4'b0000;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b100101:
                                begin
                                    ALU_OP <= 4'b0001;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b100110:
                                begin
                                    ALU_OP <= 4'b0010;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b100111:
                                begin
                                    ALU_OP <= 4'b0011;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b101011:
                                begin
                                    ALU_OP <= 4'b0110;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                            6'b001000:
                                begin
                                    ALU_OP <=4'b0100;
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 0;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b01;
                                end
                            6'b000100:
                                begin
                                    ALU_OP <= 4'b0111; 
                                    w_r_s <= 2'b00;
                                    rt_imm_s <= 0;
                                    imm_s <= 0;
                                    wr_data_s <= 2'b00;
                                    Write_Reg <= 1;
                                    Mem_Write <= 0;
                                    PC_s <= 2'b00;
                                end
                        endcase
                    end
                6'b001000:
                    begin
                        ALU_OP <= 4'b0100;
                        w_r_s <= 2'b01; 
                        imm_s <= 1;
                        rt_imm_s <= 1;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                        PC_s <= 2'b00;
                    end
                6'b000100:
                    begin
                        ALU_OP <= 4'b0101;
                        w_r_s <= 2'b00; 
                        imm_s <= 0;
                        rt_imm_s <= 0;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 0;
                        Mem_Write <= 0;
                        if(ZF)
                            PC_s <= 2'b01;
                        else
                            PC_s <= 2'b00;    
                    end
                 6'b000101:
                    begin
                        ALU_OP <= 4'b0101;
                        w_r_s <= 2'b00; 
                        imm_s <= 0;
                        rt_imm_s <= 0;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 0;
                        Mem_Write <= 0;
                        if(!ZF)
                            PC_s <= 2'b01;
                        else
                            PC_s <= 2'b00;    
                    end    
                6'b001100:
                    begin
                        ALU_OP <= 4'b0000;
                        w_r_s <= 2'b01;
                        imm_s <= 0;
                        rt_imm_s <= 1;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end   
                6'b001110:
                    begin
                        ALU_OP <= 4'b0001;
                        w_r_s <= 2'b01;
                        imm_s <= 0;
                        rt_imm_s <= 1;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end   
                6'b001011:
                    begin
                        ALU_OP <= 4'b0110;
                        w_r_s <= 2'b01;
                        imm_s <= 0;
                        rt_imm_s <= 1;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end
                6'b100011:
                    begin
                        ALU_OP <= 4'b0100;
                        w_r_s <= 2'b01;
                        imm_s <= 1;
                        rt_imm_s <= 1;
                        wr_data_s <= 2'b01;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                    end
                6'b101011:
                    begin
                        ALU_OP <= 4'b0100;
                        w_r_s <= 2'b00;
                        imm_s <= 1;
                        rt_imm_s <= 1;
                        wr_data_s <= 2'b00;
                        Write_Reg <= 0;
                        Mem_Write <= 1;
                    end  
                6'b000010:
                    begin
                        Write_Reg <= 0;
                        Mem_Write <= 0;
                        PC_s <= 2'b11;
                    end            
                6'b000011:
                    begin
                        w_r_s <= 2'b1X;
                        wr_data_s <= 2'b1X;
                        Write_Reg <= 1;
                        Mem_Write <= 0;
                        PC_s <= 2'b11;
                    end            
            endcase
        end
endmodule
