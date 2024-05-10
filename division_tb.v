`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 18:58:22
// Design Name: 
// Module Name: division_tb
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


module division_tb();

reg [7:0] dividend, divisor;
wire [7:0] quo, rem;

divide uut(dividend, divisor, quo, rem);

initial
begin

dividend = 8; divisor = 2;
#10;
dividend = 1; divisor = 7;
#10;
dividend = 32; divisor = 6;
#10;
dividend = 8; divisor = 8;
#10;
dividend = 70; divisor = 10;
#10;

$finish();
end
endmodule
