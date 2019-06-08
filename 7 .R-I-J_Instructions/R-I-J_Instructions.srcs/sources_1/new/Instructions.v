`timescale 1ns / 1ps
module Instructions(
    input clk,  //数码管时钟信号  
    input reset,
    input[1:0] PC_s,
    input[31:0] imm_data,R_Data_A,
    input[25:0] address,
    output [31:0] PC_new,
    output[31:0] Inst_code,//输出数据
    output reg[31:0] PC = 0
    );
    
    reg [5:0] addr = 0;
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
                begin
                    case(PC_s)
                        2'b00: PC <= PC_new;
                        2'b01: PC <= R_Data_A;
                        2'b10: PC <= PC_new + (imm_data << 2);
                        2'b11: PC <= {PC_new[31:28],address,2'b00};
                    endcase
                end
        end
endmodule
