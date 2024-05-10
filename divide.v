`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 18:34:50
// Design Name: 
// Module Name: divide
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


module divide(dividend, divisor, quo, rem, en);
input [7:0] dividend, divisor;
input en;
reg [7:0] div;
reg [15:0] y;
output reg [7:0] quo, rem;
integer i;

always@(posedge en)
begin
quo = 8'h00;
rem = 8'h00;
div = dividend;

for (i = 0; i<8; i = i+1)
    begin
    quo = quo << 1;
    y = {rem, div};
    y = y << 1;
    rem = y[15:8];
    div = y[7:0];
    if (rem >= divisor)
        begin
        rem  = rem - divisor;
        quo[0] = 1;
        end
    end
end
endmodule
