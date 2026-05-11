`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 20:50:24
// Design Name: 
// Module Name: inv_shiftrows_tb
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


module inv_shiftrows_tb();

reg  [127:0] data_in;
wire [127:0] data_out;

inv_shiftrows uut(.data_in(data_in),.data_out(data_out));
initial
begin
data_in = 128'h00112233445566778899aabbccddeeff;
#10;
$display("Input  = %h", data_in);
$display("Output = %h", data_out);
$stop;
end
endmodule
