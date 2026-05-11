`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:24:58
// Design Name: 
// Module Name: mixcolumns
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


module mixcolumns(
    input  [127:0] data_in,
    output [127:0] data_out
);

wire [31:0] col0_in, col1_in, col2_in, col3_in;
wire [31:0] col0_out, col1_out, col2_out, col3_out;

// Split 128-bit AES state into 4 columns
assign col0_in = data_in[127:96];
assign col1_in = data_in[95:64];
assign col2_in = data_in[63:32];
assign col3_in = data_in[31:0];

// Column 0
mixcolumn_single m0(
    .col_in(col0_in),
    .col_out(col0_out)
);
// Column 1
mixcolumn_single m1(
    .col_in(col1_in),
    .col_out(col1_out)
);
// Column 2
mixcolumn_single m2(
    .col_in(col2_in),
    .col_out(col2_out)
);
// Column 3
mixcolumn_single m3(
    .col_in(col3_in),
    .col_out(col3_out)
);

// Combine transformed columns
assign data_out = {
    col0_out,
    col1_out,
    col2_out,
    col3_out
};
endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////////////////


module mixcolumn_single(
    input  [31:0] col_in,
    output [31:0] col_out
);
wire [7:0] a0,a1,a2,a3;
wire [7:0] b0,b1,b2,b3;
assign a0 = col_in[31:24];
assign a1 = col_in[23:16];
assign a2 = col_in[15:8];
assign a3 = col_in[7:0];
function [7:0] mul2;
    input [7:0] x;
    begin
        if(x[7])
            mul2 = (x << 1) ^ 8'h1b;
        else
            mul2 = (x << 1);
    end
endfunction
function [7:0] mul3;
    input [7:0] x;
    begin
        mul3 = mul2(x) ^ x;
    end
endfunction

assign b0 = mul2(a0) ^ mul3(a1) ^ a2 ^ a3;
assign b1 = a0 ^ mul2(a1) ^ mul3(a2) ^ a3;
assign b2 = a0 ^ a1 ^ mul2(a2) ^ mul3(a3);
assign b3 = mul3(a0) ^ a1 ^ a2 ^ mul2(a3);
assign col_out = {b0,b1,b2,b3};
endmodule
