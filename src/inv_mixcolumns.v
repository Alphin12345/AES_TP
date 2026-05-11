`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:46:16
// Design Name: 
// Module Name: inv_mixcolumns
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


module inv_mixcolumns(
    input  [127:0] data_in,
    output [127:0] data_out
);

wire [31:0] col0_in, col1_in, col2_in, col3_in;
wire [31:0] col0_out, col1_out, col2_out, col3_out;

// Split into columns
assign col0_in = data_in[127:96];
assign col1_in = data_in[95:64];
assign col2_in = data_in[63:32];
assign col3_in = data_in[31:0];

// Column 0
inv_mixcolumn_single m0(
    .col_in(col0_in),
    .col_out(col0_out)
);
// Column 1
inv_mixcolumn_single m1(
    .col_in(col1_in),
    .col_out(col1_out)
);
// Column 2
inv_mixcolumn_single m2(
    .col_in(col2_in),
    .col_out(col2_out)
);
// Column 3
inv_mixcolumn_single m3(
    .col_in(col3_in),
    .col_out(col3_out)
);

assign data_out = {
    col0_out,
    col1_out,
    col2_out,
    col3_out
};
endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////////////////


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
