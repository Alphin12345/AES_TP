`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 22:20:23
// Design Name: 
// Module Name: gf_mult_tb
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


`timescale 1ns/1ps

module gf_mult_tb;

reg  [7:0] a;
reg  [1:0] sel;
wire [7:0] out;

// Instantiate module
gf_mult uut (
    .a(a),
    .sel(sel),
    .out(out)
);

initial begin
    $display(" a   sel   out");

    a = 8'h57; sel = 2'b00; #10; // ×1
    a = 8'h57; sel = 2'b01; #10; // ×2
    a = 8'h57; sel = 2'b10; #10; // ×3

    a = 8'h83; sel = 2'b01; #10;
    a = 8'h83; sel = 2'b10; #10;

    a = 8'h1F; sel = 2'b01; #10;
    a = 8'h1F; sel = 2'b10; #10;

    $finish;
end

initial begin
    $monitor("%h   %b    %h", a, sel, out);
end

endmodule
