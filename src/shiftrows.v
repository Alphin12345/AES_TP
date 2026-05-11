`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 20:06:12
// Design Name: 
// Module Name: shiftrows
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


module shiftrows(
    input  [127:0] data_in,
    output [127:0] data_out
);

wire [7:0] b0,b1,b2,b3,b4,b5,b6,b7;
wire [7:0] b8,b9,b10,b11,b12,b13,b14,b15;

assign b0  = data_in[127:120];
assign b1  = data_in[119:112];
assign b2  = data_in[111:104];
assign b3  = data_in[103:96];

assign b4  = data_in[95:88];
assign b5  = data_in[87:80];
assign b6  = data_in[79:72];
assign b7  = data_in[71:64];

assign b8  = data_in[63:56];
assign b9  = data_in[55:48];
assign b10 = data_in[47:40];
assign b11 = data_in[39:32];

assign b12 = data_in[31:24];
assign b13 = data_in[23:16];
assign b14 = data_in[15:8];
assign b15 = data_in[7:0];

assign data_out = {

b0,  b5,  b10, b15,
b4,  b9,  b14, b3,
b8,  b13, b2,  b7,
b12, b1,  b6,  b11

};

endmodule
