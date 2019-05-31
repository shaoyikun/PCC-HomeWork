`timescale 1ns / 1ps
module board(
    input clk,
    input[2:0] swb,
    output [31:0] led,
    output [2:0] which,
    output [7:0] seg,
    output reg enable = 1
    );
    
    wire ZF,OF;
    wire[31:0] PC,ALU_F;
    reg[31:0] data;
    
    assign led = data;
    
    CPU myCPU(.clk(swb[1]),.rst(swb[0]),.ZF(ZF),.OF(OF),.ALU_F(ALU_F),.PC(PC));
    Display Display_Instance(.clk(clk), .data(PC),.which(which), .seg(seg));
    
    always@(swb[2])
        begin
            if(swb[2])
                begin
                    data <= 0;
                    data[31] <= ZF;
                    data[0] <= OF;
                end
            else
                data <= ALU_F;
        end
        
endmodule
