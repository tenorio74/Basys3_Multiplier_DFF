`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 11:10:39 PM
// Design Name: 
// Module Name: top
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


module top(
// CLK Input
	input clock_100Mhz,
	 
// Push Button Inputs	 
	input btnU, 
	 
// Slide Switch Inputs
   // Input A = sw[7:4]
   // Input B = sw[3:0]	 
    input [7:0] sw, 
// Seven Segment Display Outputs
    output [6:0] LED_out,
    output [3:0] Anode_Activate
    );
    
// Wire to hold output of multiplier and DFF registers to send to 7 seg Display
    wire [7:0] binary;
    
// Multiplier and DFF Wrapper
    multiplier_DFF mult (
    .Z(binary),
    .X(sw[7:4]),
    .Y(sw[3:0]),
    .clock_100Mhz(clock_100Mhz),
    .reset(reset)
    );
    
// Seven Segment Display Wrapper
    sseg display_wrapper(
    .clock_100Mhz(clock_100Mhz), // 100 Mhz clock source on Basys 3 FPGA
    .reset(btnU), // reset
    .displayed_number(binary), // counting number to be displayed
    .Anode_Activate(Anode_Activate), // anode signals of the 7-segment LED display
    .LED_out(LED_out)// cathode patterns of the 7-segment LED display
    );
endmodule
