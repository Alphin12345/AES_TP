`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 22:18:59
// Design Name: 
// Module Name: roundkey_tb
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


module roundkey_tb;

    reg  [127:0] key_in;
    reg  [3:0]   round;
    wire [127:0] key_out;

    roundkey uut (
        .key_in(key_in),
        .round(round),
        .key_out(key_out)
    );

    initial begin
        $display("Time | Round | Input Key | Output Round Key");
        $monitor("%0t | %0d | %h | %h", $time, round, key_in, key_out);

        key_in = 128'h00112233445566778899aabbccddeeff;
        round  = 4'h1;
        #10;
        round  = 4'h2;
        #10;
        round  = 4'h3;
        #10;
        round  = 4'h4;
        #10;
        key_in = 128'h0f1571c947d9e8590cb7add6af7f6798;
        round  = 4'h1;
        #10;
        round  = 4'h2;
        #10;
        $finish;
    end
endmodule
