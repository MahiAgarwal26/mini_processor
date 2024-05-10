`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 17:36:41
// Design Name: 
// Module Name: istr_set
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


module istr_set(instr, clk, hlt, pc);
input [7:0] instr;
input clk;
reg [7:0] ACC, EXT;
wire [7:0] DR, quo;
reg c_b, divide, read, write;
reg [3:0] opcode;
reg [3:0] add_reg;
output reg [7:0] pc;
output reg hlt;

always@(*)
begin

opcode = instr[7:4];

if (opcode == 15) $finish();
else if (opcode == 0)
    case(instr[3:0])
    4'h1 : ACC = ACC<<1;
    4'h2 : ACC = ACC>>1;
    4'h3 : begin ACC <= ACC>>1; ACC[7] <= ACC[0]; end
    4'h4 : begin ACC <= ACC<<1; ACC[0] <= ACC[7]; end
    4'h5 : begin ACC = ACC>>1; ACC[7] = ACC[6]; end
    4'h6 : begin {c_b, ACC} = ACC + 1; end
    4'h7 : begin {c_b, ACC} = ACC - 1; end
    default : ACC <= ACC;
    endcase
else
begin
read = 1;
add_reg = instr[3:0];
case(opcode)

    4'h1 : {c_b, ACC} = ACC + DR;
    4'h2 : {c_b, ACC} = ACC - DR;
    4'h3 : {EXT, ACC} = ACC * DR;
    4'h4 : begin divide <= 1; ACC <= quo; end
    4'h5 : ACC = ACC && DR;
    4'h6 : ACC = ACC ^ DR;
    4'h7 : if (ACC < DR) c_b = 1; else c_b = 0;
    4'h8 : if (c_b == 1) pc = add_reg - 1; else pc = pc;
    4'h9 : ACC = DR;
    4'ha : write = 1;
    4'hb : pc = add_reg - 1;
    default : ACC <= ACC;
    endcase
pc = pc + 1;
end
end
reg_file inst1(.address(add_reg), .read(read), .write(write), .r_bus(DR), .w_bus(ACC));
divide inst2 (.dividend(ACC), .divisor(DR), .quo(quo), .rem(EXT), .en(divide));
endmodule
