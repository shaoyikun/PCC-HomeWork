`timescale 1ns / 1ps
module board(
    input clk,
    input [1:0]swb,
    output[2:0] which,
    output [31:0]led,
    output [7:0]seg,
    output reg enable=1
    );
 
    wire[31:0] PC;
    wire[31:0] data;
      
    Instructions myInstructions(.clk(swb[1]),.reset(swb[0]),.Inst_code(led),.PC(PC));
    Display Display_Instance(.clk(clk), .data(PC),
        .which(which), .seg(seg));
    
    
endmodule
