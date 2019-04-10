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
    input[3:0] swb,
    input Write_Reg,
    output[31:0] led
    );
    
    reg output_flag = 0;
    reg addr_flag = 0;
    reg[5:0] R_Addr_A,R_Addr_B,W_Addr;
    reg[31:0] result,W_Data;
    wire[31:0] R_Data_A,R_Data_B;
    
    assign led = result;
    
    assign toggle = swb[2]|swb[3];
    
    always @(posedge toggle)
        begin
            case(swb)
                4'b0100:
                    begin
                        output_flag <= ~output_flag;
                        case(output_flag)
                            0:result <= R_Data_A;
                            1:result <= R_Data_B;
                        endcase    
                    end
                4'b1000:
                    begin
                        addr_flag <= ~ addr_flag;
                        case(addr_flag)
                            0:W_Data <= myInput;
                            1:W_Addr <= myInput[4:0];
                        endcase
                    end
            endcase    
        end
    register myregister(R_Addr_A,R_Addr_B,W_Addr,Write_Reg,swb[0],swb[1],W_Data,R_Data_A,R_Data_B);
endmodule
