`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/25 12:07:46
// Design Name: 
// Module Name: board
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


module board(
    input clk,
    input [1:0]swb,
    input [1:0]options,
    output[2:0] which,
    output [31:0]led,
    output [7:0]seg,
    output reg enable=1
    );
 
    wire[31:0] PC;
    wire[31:0] data;
      
    Instructions myInstructions(.clk(clk),.reset(swb[0]),.myclk(swb[1]),.Inst_code(led),.PC(PC));
    Display Display_Instance(.clk(clk), .data(PC),
        .which(which), .seg(seg));
    
    
endmodule
