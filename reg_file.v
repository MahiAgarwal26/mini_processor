`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 17:19:46
// Design Name: 
// Module Name: reg_file
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


module reg_file(address, read, write, r_bus, w_bus);

input read, write;
input [3:0] address;
output reg [7:0] r_bus;
input [7:0] w_bus;
reg [7:0]R[15:0];

initial begin
R[0] = 8'd0;
R[1] = 8'd5;
R[2] = 8'd4;
R[3] = 8'd14;
R[4] = 8'd15;
R[5] = 8'd25;
R[6] = 8'd18;
R[7] = 8'd20;
R[8] = 8'd8;
R[9] = 8'd13;
R[10] = 8'd9;
R[11] = 8'd11;
R[12] = 8'd12;
R[13] = 8'd26;
R[14] = 8'd18;
R[15] = 8'd1;
end

always@(*)
begin
    if (read)
        r_bus <= R[address];
    else if (write)
        R[address] <= w_bus;
  
end
endmodule
