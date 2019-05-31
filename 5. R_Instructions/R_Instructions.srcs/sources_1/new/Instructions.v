`timescale 1ns / 1ps
module Instructions(
    input clk,  //数码管时钟信号  
    input reset,
    output[31:0] Inst_code,//输出数据
    output reg[31:0] PC = 0
    );
    
    reg [5:0] addr;
    reg [31:0] dina = 0;
    
    Inst_ROM my_ROM (
    .clka(clk),    // input wire clka
    .wea(0),      // input wire [0 : 0] wea
    .addra(addr),  // input wire [5 : 0] addra
    .douta(Inst_code),  // output wire [31 : 0] douta
    .dina(dina)
    );
    
    always@(posedge clk)
        begin 
            addr <= PC[7:2];
        end
        
    always@(negedge clk)
        begin
            if(reset)
                begin
                    PC <= 0;
                end
            else
                PC <= PC + 4;
        end
endmodule
