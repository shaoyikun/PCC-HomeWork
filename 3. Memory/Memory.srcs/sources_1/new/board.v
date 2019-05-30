`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/16 10:46:58
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
   input [31:0] myInput,
   input [5:0] swb,
   output [31:0] led
    );
   
   wire toggle;
   reg [31:0] douta;
   reg [7:2] addra;
   reg [31:0] dina;
   reg wea=0;
   
   assign toggle = swb[0]|swb[1]|swb[2];
   
   always @(posedge toggle)
   begin
        if(swb[0])
            addra <=myInput[5:0];
        if(swb[1])
            dina <= myInput;
        if(swb[2])
            wea <= myInput[31];   
   end
   
   RAM_B myRAM (
      .clka(swb[3]),    // input wire clka
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [5 : 0] addra
      .dina(dina),    // input wire [31 : 0] dina
      .douta(led)  // output wire [31 : 0] douta
    ); 
endmodule
