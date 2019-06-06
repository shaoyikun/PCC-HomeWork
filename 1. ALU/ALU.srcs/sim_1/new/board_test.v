`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/30 11:21:20
// Design Name: 
// Module Name: board_test
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


module board_test(
    output[31:0] led
    );
    
    reg[31:0] myInput;
    reg[5:0] swb;
    
    board myboard(myInput,swb,led);
    
    initial begin
    
    myInput = 0;  swb = 0;
    
    #50;
    myInput = 32'b10000000000000000000000000000000;
    
    #50;
    swb[0] = ~swb[0];
    
    #50;
    swb[0] = ~swb[0];
    
    myInput = 32'b11111111111111111111111111111111;
    
    #50;
    swb[1] = ~swb[1];
    
    #50;
    swb[1] = ~swb[1];
    
    #50;
    myInput[3:0] = 4'b0000;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    myInput[3:0] = 4'b0001;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
   #50;
    myInput[3:0] = 4'b0010;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    myInput[3:0] = 4'b0011;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    myInput[3:0] = 4'b0100;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
   
   #50;
    myInput[3:0] = 4'b0101;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    myInput[3:0] = 4'b0110;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    myInput[3:0] = 4'b0111;
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[2] = ~swb[2];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    
    #50;
    swb[3] = ~swb[3];
    end
endmodule
