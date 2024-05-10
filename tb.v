`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 19:13:57
// Design Name: 
// Module Name: tb
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


module tb();

reg clk;
//reg [7:0] spc;
merged uut (clk);
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin

//spc = 8'b0000_0000; 
#150;

$finish();
end
endmodule
