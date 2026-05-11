`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:41:02
// Design Name: 
// Module Name: inv_mixcolumn_single
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


module inv_mixcolumn_single(
    input  [31:0] col_in,
    output [31:0] col_out
);

wire [7:0] a0,a1,a2,a3;
wire [7:0] b0,b1,b2,b3;

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

// Multiply by 9
function [7:0] mul9;
    input [7:0] x;
    reg [7:0] x2,x4,x8;
    begin
        x2 = mul2(x);
        x4 = mul2(x2);
        x8 = mul2(x4);

        mul9 = x8 ^ x;
    end
endfunction

// Multiply by 11
function [7:0] mul11;
    input [7:0] x;
    reg [7:0] x2,x4,x8;
    begin
        x2 = mul2(x);
        x4 = mul2(x2);
        x8 = mul2(x4);

        mul11 = x8 ^ x2 ^ x;
    end
endfunction

// Multiply by 13
function [7:0] mul13;
    input [7:0] x;
    reg [7:0] x2,x4,x8;
    begin
        x2 = mul2(x);
        x4 = mul2(x2);
        x8 = mul2(x4);

        mul13 = x8 ^ x4 ^ x;
    end
endfunction

// Multiply by 14
function [7:0] mul14;
    input [7:0] x;
    reg [7:0] x2,x4,x8;
    begin
        x2 = mul2(x);
        x4 = mul2(x2);
        x8 = mul2(x4);

        mul14 = x8 ^ x4 ^ x2;
    end
endfunction

// Inverse MixColumns equations
assign b0 = mul14(a0) ^ mul11(a1) ^ mul13(a2) ^ mul9(a3);
assign b1 = mul9(a0) ^ mul14(a1) ^ mul11(a2) ^ mul13(a3);
assign b2 = mul13(a0) ^ mul9(a1) ^ mul14(a2) ^ mul11(a3);
assign b3 = mul11(a0) ^ mul13(a1) ^ mul9(a2) ^ mul14(a3);
assign col_out = {b0,b1,b2,b3}; // Combine output bytes
endmodule