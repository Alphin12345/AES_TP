`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 22:19:41
// Design Name: 
// Module Name: gf_mult
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


module gf_mult (
    input  [7:0] a,
    input  [1:0] sel,   
    output reg [7:0] out
);

// Multiply by 2
function [7:0] mul2;
    input [7:0] x;
    begin
        if (x[7])
            mul2 = (x << 1) ^ 8'h1b;
        else
            mul2 = (x << 1);
    end
endfunction

// Multiply by 3
function [7:0] mul3;
    input [7:0] x;
    begin
        mul3 = mul2(x) ^ x;
    end
endfunction

always @(*) begin
    case (sel)
        2'b00: out = a;        // ×1
        2'b01: out = mul2(a);  // ×2
        2'b10: out = mul3(a);  // ×3
        default: out = 8'h00;
    endcase
end

endmodule
