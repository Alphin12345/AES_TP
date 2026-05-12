`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 22:18:39
// Design Name: 
// Module Name: roundkey
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

module roundkey (input  [127:0] key_in,input  [3:0]    round,output reg [127:0] key_out);
    wire [31:0] w0, w1, w2, w3;
    reg  [31:0] temp;
    reg  [7:0]  rcon_val;
    assign w0 = key_in[127:96];
    assign w1 = key_in[95:64];
    assign w2 = key_in[63:32];
    assign w3 = key_in[31:0];

    function [31:0] rot_word;  // Rotate word (left rotate by 1 byte)
        input [31:0] w;
        begin
            rot_word = {w[23:0], w[31:24]};
        end
    endfunction

    function [7:0] rcon;   // Rcon values
        input [3:0] r;
        begin
            case(r)
                4'h1: rcon = 8'h01;
                4'h2: rcon = 8'h02;
                4'h3: rcon = 8'h04;
                4'h4: rcon = 8'h08;
                4'h5: rcon = 8'h10;
                4'h6: rcon = 8'h20;
                4'h7: rcon = 8'h40;
                4'h8: rcon = 8'h80;
                4'h9: rcon = 8'h1B;
                4'hA: rcon = 8'h36;
                default: rcon = 8'h00;
            endcase
        end
    endfunction

    always @(*) begin
        rcon_val = rcon(round);
        temp = rot_word(w3);  // Step 1: rotate last word
        temp = temp ^ {rcon_val, 24'h0};  // Step 2: XOR with Rcon (NO S-box used)
        key_out[127:96] = w0 ^ temp;   // Step 3: generate new round key
        key_out[95:64]  = w1 ^ key_out[127:96];
        key_out[63:32]  = w2 ^ key_out[95:64];
        key_out[31:0]   = w3 ^ key_out[63:32];
    end
endmodule