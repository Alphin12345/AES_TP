`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 22:05:55
// Design Name: 
// Module Name: sbox_tb
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

module sbox_tb;

reg  [7:0] in;
wire [7:0] out;


sbox uut (
    .in(in),
    .out(out)
);

initial begin
    $display("Input -> Output");

    in = 8'h00; #10;
    in = 8'h01; #10;
    in = 8'h02; #10;
    in = 8'h03; #10;

    in = 8'h10; #10;
    in = 8'h20; #10;
    in = 8'h7F; #10;
    in = 8'hA5; #10;
    in = 8'hFF; #10;

    $finish;
end

initial begin
    $monitor("%h -> %h", in, out);
end

endmodule
