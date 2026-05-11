`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:25:16
// Design Name: 
// Module Name: mixcolumns_tb
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

module mixcolumns_tb();

reg  [127:0] data_in;
wire [127:0] data_out;

mixcolumns uut(.data_in(data_in),.data_out(data_out));

initial
begin
data_in = 128'hdb135345f20a225c01010101c6c6c6c6;
#10;
$display("Input  = %h", data_in);
$display("Output = %h", data_out);
$stop;
end
endmodule
