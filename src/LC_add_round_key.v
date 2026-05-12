`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 20:21:09
// Design Name: 
// Module Name: add_round_key
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


module add_round_key (
    input  [127:0] state_in,
    input  [127:0] round_key,
    output [127:0] state_out
);

assign state_out = state_in ^ round_key;

endmodule
