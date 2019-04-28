`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 19:15:36
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
    input[5:0] swb,//按钮绑定
    output[31:0] led
    );
    
    reg[31:0] X,Y,result;
    reg[3:0] ALU_OP;
    
    wire[31:0] F;
    wire ZF,OF; 
    reg res_change = 0;
    reg input_change = 1;
    
    assign led = result;//结果直接与led绑定
    assign toggle = |swb;
    
    always @(posedge toggle)
        begin
            case(swb)
            6'b000001:X <= myInput;
            6'b000010:Y <= myInput;
            6'b000100:ALU_OP <= myInput[3:0];
            6'b001000:
                begin
                    res_change <= ~res_change;
                    case(res_change)
                        0:result <= F;
                        1:begin result <= 0; result[0] <= OF; result[31] <= ZF; end
                    endcase
                end
            6'b010000:result <= X;
            6'b100000:result <= Y;
            endcase
        end
        
    ALU myALU(X,Y,ALU_OP,F,ZF,OF);

endmodule
