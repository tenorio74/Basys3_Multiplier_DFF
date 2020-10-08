`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 02:50:25 AM
// Design Name: 
// Module Name: multiplier_4bit
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


module multiplier_4bit(Z, X, Y);

output [7:0]Z;
input [3:0]X;
input [3:0]Y;


// w's hold results from the and gates
wire w10, w11, w12, w13, 
    w20, w21, w22, w23,
    w30, w31, w32, w33,
    w40, w41, w42, w43;

// c's hold carryouts from adders
wire c10, c11, c12, c13,
    c20, c21, c22, c23,
    c30, c31, c32, c33;

// s's hold sums from the adders
wire s10, s11, s12, s13,
    s20, s21, s22, s23,
    s30, s31, s32, s33;

// AND operations of all X[] and Y[0]
and(w10, X[0], Y[0]);
and(w11, X[1], Y[0]);
and(w12, X[2], Y[0]);
and(w13, X[3], Y[0]);

// AND operations of all X[] and Y[1]
and(w20, X[0], Y[1]);
and(w21, X[1], Y[1]);
and(w22, X[2], Y[1]);
and(w23, X[3], Y[1]);

// AND operations of all X[] and Y[2]
and(w30, X[0], Y[2]);
and(w31, X[1], Y[2]);
and(w32, X[2], Y[2]);
and(w33, X[3], Y[2]);

// AND operations of all X[] and Y[3]
and(w40, X[0], Y[3]);
and(w41, X[1], Y[3]);
and(w42, X[2], Y[3]);
and(w43, X[3], Y[3]);

// first 4 bit adder
adder_half H10 (c10, s10, w11, w20);
adder_full F10 (c11, s11, w12, w21, c10);
adder_full F11 (c12, s12, w13, w22, c11);
adder_half H11 (c13, s13, w23, c12);

// second 4 bit adder
adder_half H20 (c20, s20, s11, w30);
adder_full F20 (c21, s21, s12, w31, c20);
adder_full F21 (c22, s22, s13, w32, c21);
adder_full F22 (c23, s23, w33, c13, c22);

// third 4 bit adder
adder_half H30 (c30, s30, s21, w40);
adder_full F30 (c31, s31, s22, w41, c30);
adder_full F31 (c32, s32, s23, w42, c31);
adder_full F32 (c33, s33, w43, c23, c32);


assign Z[0] = w10;
assign Z[1] = s10;
assign Z[2] = s20;
assign Z[3] = s30;
assign Z[4] = s31;
assign Z[5] = s32;
assign Z[6] = s33;
assign Z[7] = c33;
endmodule
