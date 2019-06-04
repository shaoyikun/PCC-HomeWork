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
    input clk,  //�����ʱ���ź�  
    input reset,
    input myclk,
    output[31:0] Inst_code,//�������
    output reg[31:0] PC = 0
    );
    
    wire [31:0] PC_new;
    reg [31:0] dina = 0;
    
    Inst_ROM my_ROM (
    .clka(clk),    // input wire clka
    .wea(0),      // input wire [0 : 0] wea
    .addra(PC[7:2]),  // input wire [5 : 0] addra
    .douta(Inst_code),  // output wire [31 : 0] douta
    .dina(dina)
    );
        
    always@(negedge clk)
        begin
            if(reset)
                begin
                    PC <= 0;
                end
            else
                PC <= {24'h000000,PC_new[7:0]};
        end
endmodule
