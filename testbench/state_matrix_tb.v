`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 23:58:29
// Design Name: 
// Module Name: state_matrix_tb
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


module state_matrix_tb;

    reg  [127:0] plaintext;
    wire [127:0] state;

    state_matrix uut (.plaintext(plaintext),.state(state));

    initial begin

        plaintext = "HELLOAESWORLD123";

        #10;

        $display("================================");
        $display("PLAINTEXT: HELLOAESWORLD123");
        $display("AES STATE MATRIX (COLUMN-WISE)");
        $display("================================");

$display("%c %c %c %c",
    state[127:120],
    state[119:112],
    state[111:104],
    state[103:96]);

$display("%c %c %c %c",
    state[95:88],
    state[87:80],
    state[79:72],
    state[71:64]);

$display("%c %c %c %c",
    state[63:56],
    state[55:48],
    state[47:40],
    state[39:32]);

$display("%c %c %c %c",
    state[31:24],
    state[23:16],
    state[15:8],
    state[7:0]);

        $display("================================");

        $finish;
    end
endmodule
