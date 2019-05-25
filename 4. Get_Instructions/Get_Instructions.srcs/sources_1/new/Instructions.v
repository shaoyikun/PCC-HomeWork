`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/23 10:22:56
// Design Name: 
// Module Name: Instructions
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


module Instructions(
    input clk,  //数码管时钟信号  
    input reset,
    input myclk,
    output[31:0] Inst_code,//输出数据
    output[7:0] seg,//数码管输出
    output reg enable = 1
    );
    
    reg [31:0] PC = 0;
    reg [5:0] addr;
    
    Inst_ROM my_ROM (
    .clka(clk),    // input wire clka
    .wea(0),      // input wire [0 : 0] wea
    .addra(addr),  // input wire [5 : 0] addra
    .douta(Inst_code)  // output wire [31 : 0] douta
    );
    
    Display Display_Instance(.clk(clk), .data(PC),.seg(seg));
    
    always@(posedge myclk)
        addr = PC[7:2];
    always@(negedge myclk or posedge reset)
        begin
            if(reset)
                begin
                    PC <= 0;
                end
            else
                PC <= PC +4;
        end
endmodule
