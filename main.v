`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2026 09:09:06 PM
// Design Name: 
// Module Name: main
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


module main(
input clk,
input reset,
input RxD,
output Data
);
    
wire [7:0] RxData;

uart uart(.clk(clk), .reset(reset), .RxD(RxD), .RxData(RxData));
bcd BCDtoChar(.x(RxData), .data(Data));


endmodule
