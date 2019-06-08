`timescale 1ns / 1ps
module board(
    input clk,
    input[1:0] swb,
    input[1:0] myInput,
    output [31:0] led,
    output [2:0] which,
    output [7:0] seg,
    output reg enable = 1
    );
    
    wire ZF,OF;
    wire[31:0] PC,ALU_F,M_R_Data;
    reg[31:0] data;
    
    assign led = data;
    
    CPU myCPU(.clk(swb[1]),.rst(swb[0]),.ZF(ZF),.OF(OF),.ALU_F(ALU_F),.M_R_Data(M_R_Data),.PC(PC));
    Display Display_Instance(.clk(clk), .data(PC),.which(which), .seg(seg));
    
    always@(myInput)
        begin
            case(myInput)
                2'b00: data <= ALU_F;
                2'b01: 
                    begin
                        data <= 0;
                        data[31] <= ZF;
                        data[0] <= OF;
                    end
                2'b10: data <= M_R_Data;
            endcase
        end
        
endmodule
