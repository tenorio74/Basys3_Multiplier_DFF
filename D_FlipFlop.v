`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 02:08:48 AM
// Design Name: 
// Module Name: D_FlipFlop
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


module D_FlipFlop(q, d, reset, clock_100Mhz);
    input d, reset, clock_100Mhz;
    output reg q;
    
    //Flip Flop synchronous with reset
    always @ (posedge clock_100Mhz)
        begin
        if(reset==1'b1)
            q <= 1'b0; 
        else 
            q <= d;
        end
endmodule
