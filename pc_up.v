`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 18:47:48
// Design Name: 
// Module Name: pc_up
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


module pc_up(spc, clk);
input [7:0] spc;
input clk;
wire [7:0] instr;
wire hlt;
wire [7:0] pc;


assign pc = spc;
assign hlt = 0;

instr_mem inst1(pc, instr);
istr_set inst2(instr, clk, hlt, pc);
    
endmodule
