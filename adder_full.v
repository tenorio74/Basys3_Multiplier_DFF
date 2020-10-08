`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 02:30:01 AM
// Design Name: 
// Module Name: adder_full
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


module adder_full(output c_out, sum, input a, b, c_in );
wire s1, c1, c2;

adder_half M1 (c1, s1, a, b);
adder_half M2 (c2, sum, c_in, s1);
or(c_out, c1, c2);

endmodule
