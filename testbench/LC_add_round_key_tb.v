`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 20:21:45
// Design Name: 
// Module Name: add_round_key_tb
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


module add_round_key_tb;

reg  [127:0] state_in;
reg  [127:0] round_key;
wire [127:0] state_out;

add_round_key uut (
    .state_in(state_in),
    .round_key(round_key),
    .state_out(state_out)
);

initial begin
 
    state_in  = 128'h00112233445566778899aabbccddeeff;

 
    round_key = 128'h000102030405060708090a0b0c0d0e0f;

    #10;

    $display("State In  = %h", state_in);
    $display("Round Key = %h", round_key);
    $display("State Out = %h", state_out);

    $finish;
end

endmodule
