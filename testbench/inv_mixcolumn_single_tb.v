`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:41:35
// Design Name: 
// Module Name: inv_mixcolumn_single_tb
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


module inv_mixcolumn_single_tb();

reg  [31:0] col_in;
wire [31:0] col_out;

inv_mixcolumn_single uut(.col_in(col_in),.col_out(col_out));

initial
begin
col_in = 32'h8e4da1bc;
#10;
$display("Input  = %h", col_in);
$display("Output = %h", col_out);
$stop;
end
endmodule
