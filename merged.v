`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 16:39:26
// Design Name: 
// Module Name: merged
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

module merged(slow_clk);


//input [7:0] spc;
input slow_clk;
//input [3:0] reg_num;
//wire slow_clk;
//output reg [7:0] acc_ext, out;
//input mode;

reg [7:0]R[15:0];
reg [7:0]instr_m[15:0];
integer i;
reg [7:0] pc;
reg [7:0] ACC, EXT, DR, instr;
reg [7:0] div, divisor;
reg [15:0] y;
reg c_b;
reg [3:0] opcode;
reg [3:0] add_reg;

initial begin
pc = 8'h0_0;

R[0] = 8'd0;
R[1] = 8'd10;
R[2] = 8'd3;
R[3] = 8'd2;
R[4] = 8'd20;
R[5] = 8'd5;
R[6] = 8'd18;
R[7] = 8'd20;
R[8] = 8'd255;
R[9] = 8'd13;
R[10] = 8'd9;
R[11] = 8'd11;
R[12] = 8'd12;
R[13] = 8'd26;
R[14] = 8'd18;
R[15] = 8'd1;
end

initial begin

instr_m[0] = 8'h9_1;
//instr_m[1] = 8'h0_1;
//instr_m[1] = 8'h0_2;
//instr_m[2] = 8'h03;
//instr_m[3] = 8'h04;
//instr_m[4] = 8'h05;
//instr_m[5] = 8'h00;
//instr_m[6] = 8'h10_7;
//instr_m[1] = 8'h5_6;
instr_m[1] = 8'h6_1;
instr_m[2] = 8'h1_5;
instr_m[3] = 8'h1_6;
instr_m[4] = 8'ha_7;
instr_m[5] = 8'hf_f;
instr_m[6] = 8'h9_5;
instr_m[7] = 8'h1_f;
instr_m[8] = 8'h7_5;
instr_m[9] = 8'h6_4;
instr_m[10] = 8'hf_f;
instr_m[11] = 8'h0_7;
instr_m[12] = 8'ha_f;
instr_m[13] = 8'hb_f;
instr_m[14] = 8'h0_5;
instr_m[15] = 8'hff;
end

//clock_div inst(clk, slow_clk);

always@(posedge slow_clk)
begin
//if (mode == 1) acc_ext = ACC;
//else acc_ext = EXT;
instr = instr_m[pc];
opcode = instr[7:4];

if (opcode == 15) $finish();
else if (opcode == 0)
    case(instr[3:0])
    4'h1 : ACC <= ACC<<1;
    4'h2 : ACC <= ACC>>1;
    4'h3 : begin ACC <= ACC>>1; ACC[7] <= ACC[0]; end
    4'h4 : begin ACC <= ACC<<1; ACC[0] <= ACC[7]; end
    4'h5 : begin ACC <= ACC>>1; ACC[7] <= ACC[6]; end
    4'h6 : begin {c_b, ACC} <= ACC + 1; end
    4'h7 : begin {c_b, ACC} <= ACC - 1; end
    default : ACC <= ACC;
    endcase
else
begin
add_reg = instr[3:0];
DR = R[add_reg];

case(opcode)
    4'h1 : {c_b, ACC} <= ACC + DR;
    4'h2 : {c_b, ACC} <= ACC - DR;
    4'h3 : {EXT, ACC} <= ACC * DR;
    4'h4 : begin
            div = ACC;
            divisor = DR;
            ACC = 8'h00;
            EXT = 8'h00;
            for (i = 0; i<8; i = i+1)
                begin
                ACC = ACC << 1;
                y = {EXT, div};
                y = y << 1;
                EXT = y[15:8];
                div = y[7:0];
                if (EXT >= divisor)
                    begin
                    EXT  = EXT - divisor;
                    ACC[0] = 1;
                    end
                end
            end
    4'h5 : ACC <= (ACC & DR);
    4'h6 : ACC <= (ACC ^ DR);
    4'h7 : if (ACC == DR) ACC = ACC ^ DR; else ACC = ACC & DR;
    4'h8 : if (c_b == 1) pc = add_reg - 1; else pc = pc;
    4'h9 : ACC <= DR;
    4'ha : R[add_reg] <= ACC;
    4'hb : pc <= add_reg - 1;
    default : ACC <= ACC;
    endcase
end    
pc = pc + 1;
//out = R[reg_num];
end
endmodule