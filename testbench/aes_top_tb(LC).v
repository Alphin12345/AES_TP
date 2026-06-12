`timescale 1ns / 1ps

module aes_top_tb;

reg  [7:0] data_in;
reg  [1:0] gf_sel;
reg  [7:0] key_in;

wire [7:0] data_out;

aes_top uut (
    .data_in(data_in),
    .gf_sel(gf_sel),
    .key_in(key_in),
    .data_out(data_out)
);

initial begin
    $display("Time\tIn\tGF\tKey\tOut");
    $monitor("%0t\t%h\t%b\t%h\t%h",
             $time, data_in, gf_sel, key_in, data_out);

    // Test 1
    data_in = 8'h00;
    gf_sel  = 2'b00;   // ×1
    key_in  = 8'h00;
    #10;

    // Test 2
    data_in = 8'h01;
    gf_sel  = 2'b01;   // ×2
    key_in  = 8'hFF;
    #10;

    // Test 3
    data_in = 8'h53;
    gf_sel  = 2'b10;   // ×3
    key_in  = 8'hAA;
    #10;

    // Test 4
    data_in = 8'hFF;
    gf_sel  = 2'b01;   // ×2
    key_in  = 8'h55;
    #10;

    $finish;
end

endmodule
