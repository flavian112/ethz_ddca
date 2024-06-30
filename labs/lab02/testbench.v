`timescale 1ns / 1ps

module testbench();

reg [1023:0] waveform_filename;

initial begin
    if ($value$plusargs("waveform=%s", waveform_filename)) begin
    end else begin
        $display("ERROR: waveform not specified");
        $finish;
    end
    $dumpfile(waveform_filename);
    $dumpvars(0, testbench);
end


reg ha_a;
reg ha_b;
wire ha_s;
wire ha_c_out;

half_adder ha (
    .a(ha_a),
    .b(ha_b),
    .s(ha_s),
    .c_out(ha_c_out)
);

reg fa_a;
reg fa_b;
reg fa_c_in;
wire fa_s;
wire fa_c_out;

full_adder fa (
    .a(fa_a),
    .b(fa_b),
    .c_in(fa_c_in),
    .s(fa_s),
    .c_out(fa_c_out)
);

parameter rca_n = 4;
reg [rca_n-1:0] rca_a;
reg [rca_n-1:0] rca_b;
reg rca_c_in;
wire [rca_n-1:0] rca_s;
wire rca_c_out;

ripple_carry_adder #(.N(rca_n)) rca (
    .a(rca_a),
    .b(rca_b),
    .c_in(rca_c_in),
    .s(rca_s),
    .c_out(rca_c_out)
);

integer i;


initial begin
    $display();
    $display("Half Adder:");
    $display("a b | c_out s");
    $display("-------------");
    for (i = 0; i < 4; i = i + 1) begin
        ha_a = i[1];
        ha_b = i[0];
        #10;
        $display("%b %b | %b     %b", ha_a, ha_b, ha_c_out, ha_s);
    end
    $display();

    $display();
    $display("Full Adder:");
    $display("a b c_in | c_out s");
    $display("------------------");
    for (i = 0; i < 8; i = i + 1) begin
        fa_a = i[2];
        fa_b = i[1];
        fa_c_in = i[0];
        #10;
        $display("%b %b %b    | %b     %b", fa_a, fa_b, fa_c_in, fa_c_out, fa_s);
    end
    $display();

    $display();
    $display("Ripple Carry Adder (4 bit):");
    $display("a b c_in | c_out s");
    $display("------------------");
    for (i = 0; i < 5; i = i + 1) begin
        rca_c_in = 0;
        rca_a = $random;
        rca_b = $random;
        #10;
        $display("%H %H %b    | %b     %H", rca_a, rca_b, rca_c_in, rca_c_out, rca_s);
    end
     $display();


    $finish;
end

endmodule