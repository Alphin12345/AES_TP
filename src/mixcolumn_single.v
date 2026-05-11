`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:19:37
// Design Name: 
// Module Name: mixcolumn_single
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


module mixcolumn_single(
    input  [31:0] col_in,
    output [31:0] col_out
);

wire [7:0] a0,a1,a2,a3;
wire [7:0] b0,b1,b2,b3;

// Split input column into bytes
assign a0 = col_in[31:24];
assign a1 = col_in[23:16];
assign a2 = col_in[15:8];
assign a3 = col_in[7:0];

// Multiply by 2
function [7:0] mul2;
    input [7:0] x;
    begin
        if(x[7])
            mul2 = (x << 1) ^ 8'h1b;
        else
            mul2 = (x << 1);
    end
endfunction

// Multiply by 3
function [7:0] mul3;
    input [7:0] x;
    begin
        mul3 = mul2(x) ^ x;
    end
endfunction

// AES MixColumns equations
assign b0 = mul2(a0) ^ mul3(a1) ^ a2 ^ a3;
assign b1 = a0 ^ mul2(a1) ^ mul3(a2) ^ a3;
assign b2 = a0 ^ a1 ^ mul2(a2) ^ mul3(a3);
assign b3 = mul3(a0) ^ a1 ^ a2 ^ mul2(a3);


assign col_out = {b0,b1,b2,b3}; // Combine output bytes
endmodule