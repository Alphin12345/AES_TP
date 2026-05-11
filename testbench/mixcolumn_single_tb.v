`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:19:57
// Design Name: 
// Module Name: mixcolumn_single_tb
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


module mixcolumn_single_tb();

reg  [31:0] col_in;
wire [31:0] col_out;

mixcolumn_single uut(.col_in(col_in),.col_out(col_out));

initial
begin
col_in = 32'hdb135345;
#10;
$display("Input  = %h", col_in);
$display("Output = %h", col_out);
$stop;
end
endmodule
