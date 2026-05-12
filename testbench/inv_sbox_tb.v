`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 19:35:58
// Design Name: 
// Module Name: inv_sbox_tb
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


module inv_sbox_tb();

reg [7:0] in;
wire [7:0] out;

inv_sbox uut(.in(in),.out(out));

initial
begin
in = 8'h00;
#10;
in = 8'h63;
#10;
in = 8'h7c;
#10;
in = 8'hff;
#10;
in = 8'h52;
#10;
$stop;
end
endmodule
