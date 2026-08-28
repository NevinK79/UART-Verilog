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
    8'b01100001: data = 7'b1110111;//a
    8'b01100010: data = 7'b1111111;//b
    8'b01100011: data = 7'b1001110;//c
    8'b01100100: data = 7'b0000000;//d
    8'b01100101: data = 7'b1001111;//e
    8'b01100110: data = 7'b1000111;//f
    8'b01100111: data = 7'b1011111;//g
    8'b01101000: data = 7'b0110111;//h
    8'b01101001: data = 7'b0110000;//i
    8'b01101010: data = 7'b0111100;//j
    8'b01101011: data = 7'b1110111;//k
    8'b01101100: data = 7'b1110001;//l
    8'b01101101: data = 7'b1111111;//m-not done
    8'b01101110: data = 7'b1110110;//n
    8'b01101111: data = 7'b1111110;//o
    8'b01110000: data = 7'b1100111;//p
    8'b01110001: data = 7'b1110011;//q
    8'b01110010: data = 7'b0000101;//r
    8'b01110011: data = 7'b1011011;//s
    8'b01110100: data = 7'b1111111;//t-not done
    8'b01110101: data = 7'b0111110;//u
    8'b01110110: data = 7'b0111110;//v-looks similar to u
    8'b01110111: data = 7'b1111111;//w-not done
    8'b01111000: data = 7'b0110111;//x
    8'b01111001: data = 7'b0111011;//y
    8'b01111010: data = 7'b1101101;//z
    default: data = 7'b1111111;
    endcase
end
endmodule
