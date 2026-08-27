`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2026 10:57:35 PM
// Design Name: 
// Module Name: UART_main
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


module UART_main(
input clk,
input reset,
input RxD,
output [7:0] RxData
);

reg shift, state, nextState;
reg [3:0] bitCounter;
reg [1:0] sampleCounter;
reg[13:0] baudrateCounter;
reg [9:0] rxshift;
reg clearBit, incBit, incSample, clearSample;


parameter divCounter = (100000000)/(9600*4);
parameter midSample = 2; //mid of 0-3 to get change
parameter divBit = 10;


parameter IDLE = 1'b0;
parameter RECIEVE = 1'b1;

assign RxData = rxshift[8:1];


always @(*) begin
    shift<=0;
    clearSample <=0;
    incSample <=0;
    clearBit <=0;
    incBit <=0;
    nextState <=0;
    
    case(state)
        IDLE: begin
            if(RxD == 0) begin
                nextState = RECIEVE;
                clearSample = 1;
                clearBit = 1;
                end
            end
        RECIEVE: begin
            if((bitCounter == 10)&&(RxD ==1))
                nextState = IDLE;
        else if( sampleCounter == midSample) begin
                shift = 1;
                incBit =1;
        end
        if(sampleCounter == 3)
            clearSample = 1;
        else
            incSample = 1;
        end
    endcase
end


always @(posedge clk) begin
    if(reset) begin
        state <= 0;
        bitCounter <= 0;
        baudrateCounter <= 0;
        sampleCounter <= 0;
    end
    else begin
        baudrateCounter <= baudrateCounter +1;//count for each clock for 1 sample for 1 bit
        if(baudrateCounter >= (divCounter-1)) begin
        
        baudrateCounter <=0;//reset after done counting
        
        state<=nextState;
            if(shift)
                rxshift <={RxData, rxshift[9:1]};
            if(clearSample)
                sampleCounter <= 0;
            if(incSample)
                sampleCounter <= sampleCounter +1;
            if(clearBit)
                bitCounter <=0;
            if(incBit)
                bitCounter <= bitCounter +1;
        end
    end    
end


endmodule
