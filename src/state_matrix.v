`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 23:58:08
// Design Name: 
// Module Name: state_matrix
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


module state_matrix (
    input  [127:0] plaintext,
    output [127:0] state
);

    // Direct mapping (AES state = input initially)
    assign state = plaintext;

endmodule
