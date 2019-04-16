`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 14:52:55
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
    input[31:0] myInput,
    input[5:0] swb,
    input clk,
    output[31:0] led,
    output [2:0] which,
    output [7:0] seg,
    output reg enable = 1
    );
    
    reg Write_Reg = 0;
    reg flag = 0;
    reg[4:0] R_Addr_A,R_Addr_B,W_Addr;
    reg[31:0] led_result,dis_result,W_Data;
    wire[31:0] R_Data_A,R_Data_B;
    
    assign led = led_result;
    //��ť1������32λǰ15λΪ�Ĵ�����ַ
    //��ť2������32λΪ����Ĵ���������
    //��ť3�����λ����Ϊд�źţ�1ʱִ��д����
    //��ť4��A/B���˿ڵ�ѡ��
    //��ť5������
    //��ť6��ģ��clk�ź�
    assign toggle = swb[0]|swb[1]|swb[2]|swb[3];
    
    always @(posedge toggle)
        begin
            case(swb)
                6'b000001:
                    begin
                        R_Addr_A <= myInput[4:0];
                        R_Addr_B <= myInput[9:5];
                        W_Addr <= myInput[14:10];
                    end
                6'b000010:W_Data <= myInput;
                6'b000100:Write_Reg <= myInput[31];
                6'b001000:
                    begin
                        led_result <= R_Data_A;
                        dis_result <= R_Data_B;        
                    end
            endcase    
        end
    register myregister(R_Addr_A,R_Addr_B,W_Addr,Write_Reg,swb[4],swb[5],W_Data,R_Data_A,R_Data_B);
    Display Display_Instance(.clk(clk), .data(dis_result),
        .which(which), .seg(seg));
endmodule
