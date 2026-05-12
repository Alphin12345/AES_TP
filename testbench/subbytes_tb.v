`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 19:45:15
// Design Name: 
// Module Name: subbytes_tb
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


module subbytes_tb();

reg  [127:0] data_in;
wire [127:0] data_out;

subbytes uut(.data_in(data_in),.data_out(data_out));

initial
begin
data_in = 128'h00112233445566778899aabbccddeeff;
#10;
$stop;
end
endmodule
