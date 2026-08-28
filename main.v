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
output [6:0] Data,
output [3:0] an
);

assign an = 4'b1110;
wire [7:0] RxData;

UART_main uart(.clk(clk), .reset(reset), .RxD(RxD), .RxData(RxData));

 BCDtoChar bcd(.x(RxData), .data(Data));


endmodule
