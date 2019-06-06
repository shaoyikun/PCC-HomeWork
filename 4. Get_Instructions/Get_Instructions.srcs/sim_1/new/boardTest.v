`timescale 1ns / 1ps
module boardTest(
    output [31:0]led,PC
    );
    
    reg clk,rst;
    wire[31:0] data;
      
    Instructions myInstructions(.clk(clk),.reset(rst),.Inst_code(led),.PC(PC));
    
    initial
        begin
            clk = 0;
            rst = 1;
            
            #50;
            clk = 1;
            rst = 0;
            
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
            rst = 1;
            
            #50;
            clk = 0;
            
             #50;
            clk = 1;
            
            #50;
            clk = 0;
        end
endmodule
