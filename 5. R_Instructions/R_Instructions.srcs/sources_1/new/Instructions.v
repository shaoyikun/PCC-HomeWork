`timescale 1ns / 1ps
module Instructions(
    input clk,  //数码管时钟信号  
    input reset,
    output[31:0] Inst_code,//输出数据
    output reg[31:0] PC = 0
    );
    
    wire [31:0] PC_new;
    reg [31:0] dina = 0;
    
    assign PC_new = PC + 4;
    
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
