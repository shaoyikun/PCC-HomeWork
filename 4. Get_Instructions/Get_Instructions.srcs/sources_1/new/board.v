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
    output [7:0]led,
    output [7:0]seg
    );
    
    wire[31:0] data;
    reg [7:0] byte;
    
    assign led = byte;
    
    Instructions myInstructions(.clk(clk),.reset(swb[0]),.myclk(swb[1]),.Inst_code(data),.seg(seg));
    
    always @(options)
        begin
            case(options)
                2'b00:byte = data[7:0];  
                2'b01:byte = data[15:8];  
                2'b10:byte = data[23:16];   
                2'b11:byte = data[31:24];  
                default:byte = data[7:0];
            endcase
        end
endmodule
