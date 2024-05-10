`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 18:56:09
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(address, r_bus);

input [3:0] address;
output reg [7:0] r_bus;
reg [7:0]instr[15:0];

initial begin
instr[0] = 8'h9_1;
instr[1] = 8'h1_2;
instr[2] = 8'h2_3;
instr[3] = 8'h3_4;
instr[4] = 8'h8_6;
instr[5] = 8'h5_6;
instr[6] = 8'h6_7;
instr[7] = 8'h7_8;
instr[8] = 8'h4_5;
instr[9] = 8'h5_6;
instr[10] = 8'd9;
instr[11] = 8'd11;
instr[12] = 8'd12;
instr[13] = 8'hf_f;
instr[14] = 8'd18;
instr[15] = 8'd1;
end

always@(*)
begin
r_bus <= instr[address];
end
endmodule
