`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2026 09:13:08 PM
// Design Name: 
// Module Name: BCDtoChar
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


module BCDtoChar(
input [7:0] x,
output reg [7:0] data
);


always @(*) begin
    case(x)
    8'b01100001: data = 8'b00000000;//a
    8'b01100010: data = 8'b00000000;//b
    8'b01100011: data = 8'b00000000;//c
    8'b01100100: data = 8'b00000000;//d
    8'b01100101: data = 8'b00000000;//e
    8'b01100110: data = 8'b00000000;//f
    8'b01100111: data = 8'b00000000;//g
    8'b01101000: data = 8'b00000000;//h
    8'b01101001: data = 8'b00000000;//i
    8'b01101010: data = 8'b00000000;//j
    8'b01101011: data = 8'b00000000;//k
    8'b01101100: data = 8'b00000000;//l
    8'b01101101: data = 8'b00000000;//m
    8'b01101110: data = 8'b00000000;//n
    8'b01101111: data = 8'b00000000;//o
    8'b01110000: data = 8'b00000000;//p
    8'b01110001: data = 8'b00000000;//q
    8'b01110010: data = 8'b00000000;//r
    8'b01110011: data = 8'b00000000;//s
    8'b01110100: data = 8'b00000000;//t
    8'b01110101: data = 8'b00000000;//u
    8'b01110110: data = 8'b00000000;//v
    8'b01110111: data = 8'b00000000;//w
    8'b01111000: data = 8'b00000000;//x
    8'b01111001: data = 8'b00000000;//y
    8'b01111010: data = 8'b00000000;//z
    default: data = 8'b11111111;
    endcase
end
endmodule
