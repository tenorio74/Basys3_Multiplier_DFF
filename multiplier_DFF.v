`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 08:25:43 PM
// Design Name: 
// Module Name: multiplier_DFF
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


module multiplier_DFF(X,Y,Z,reset,clock_100Mhz );
wire [7:0]w;
output[7:0]Z;
input [3:0]X;
input [3:0]Y;
input clock_100Mhz;
input reset;

multiplier_4bit M1 (w,X,Y);
D_FlipFlop D0 (Z[0], w[0], reset, clock_100Mhz);
D_FlipFlop D1 (Z[1], w[1], reset, clock_100Mhz);
D_FlipFlop D2 (Z[2], w[2], reset, clock_100Mhz);
D_FlipFlop D3 (Z[3], w[3], reset, clock_100Mhz);
D_FlipFlop D4 (Z[4], w[4], reset, clock_100Mhz);
D_FlipFlop D5 (Z[5], w[5], reset, clock_100Mhz);
D_FlipFlop D6 (Z[6], w[6], reset, clock_100Mhz);
D_FlipFlop D7 (Z[7], w[7], reset, clock_100Mhz);

endmodule
