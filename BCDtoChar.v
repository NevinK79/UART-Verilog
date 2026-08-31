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
output reg [6:0] data
);


always @(*) begin
    case(x)
    8'b01100001: data = 7'b0001000;//a
    8'b01100010: data = 7'b0000000;//b
    8'b01100011: data = 7'b0110001;//c
    8'b01100100: data = 7'b0000001;//d
    8'b01100101: data = 7'b0110000;//e
    8'b01100110: data = 7'b0111000;//f
    8'b01100111: data = 7'b0100000;//g
    8'b01101000: data = 7'b1001000;//h
    8'b01101001: data = 7'b1001111;//i
    8'b01101010: data = 7'b1000011;//j
    8'b01101011: data = 7'b0001000;//k
    8'b01101100: data = 7'b0001110;//l
    8'b01101101: data = 7'b1111111;//m-not done
    8'b01101110: data = 7'b0001001;//n
    8'b01101111: data = 7'b0000001;//o
    8'b01110000: data = 7'b0011000;//p
    8'b01110001: data = 7'b0001100;//q
    8'b01110010: data = 7'b1111010;//r
    8'b01110011: data = 7'b0100100;//s
    8'b01110100: data = 7'b1111111;//t-not done
    8'b01110101: data = 7'b1000001;//u
    8'b01110110: data = 7'b1000001;//v-looks similar to u
    8'b01110111: data = 7'b1111111;//w-not done
    8'b01111000: data = 7'b1001000;//x
    8'b01111001: data = 7'b1000100;//y
    8'b01111010: data = 7'b0010010;//z
    default: data = 7'b0000000;
    endcase
end
endmodule
