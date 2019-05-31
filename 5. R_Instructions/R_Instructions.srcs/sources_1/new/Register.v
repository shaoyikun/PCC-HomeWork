`timescale 1ns / 1ps
module Register(
    input[4:0] R_Addr_A,R_Addr_B,W_Addr,
    input Write_Reg,Reset,clk,
    input[31:0] W_Data,
    output[31:0] R_Data_A,R_Data_B
    );
    
    reg [5:0] i;
    reg[31:0] REG_Files[0:31];
    
    assign R_Data_A = REG_Files[R_Addr_A];
    assign R_Data_B = REG_Files[R_Addr_B];
    
    initial
        begin
            for(i = 0; i <= 31; i=i+1)
                REG_Files[i] <= 0;
        end
        
    always @(negedge clk)
    begin 
        if(Reset)
            for(i = 0; i <= 31; i=i+1)
                REG_Files[i] <= 0;
        else
            begin
                if(Write_Reg)
                    REG_Files[W_Addr] <= W_Data;
            end         
    end
    
endmodule
