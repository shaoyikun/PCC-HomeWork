`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/31 11:05:52
// Design Name: 
// Module Name: test
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


module test(
output [31:0] Inst_code,PC
    );
   reg clk,rst;
   
   Instructions myInstructions(.clk(clk),.reset(rst),.Inst_code(Inst_code),.PC(PC));
    initial
        begin
            clk = 0;
            rst = 0;
            
            #50;
            clk = 1;
            #50;
            clk = 0;
            
            #50;
            clk = 1;
            #50;
            clk = 0;
            
            #50;
            clk = 1;
            #50;
            clk = 0;
            
            #50;
            clk = 1;
            #50;
            clk = 0;
        end
endmodule
