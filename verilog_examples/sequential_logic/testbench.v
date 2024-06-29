`timescale 1ns / 1ps

module testbench();

reg [1023:0] waveform_filename;
reg [31:0] clk_cycle_count;

initial begin
    if ($value$plusargs("waveform=%s", waveform_filename)) begin
    end else begin
        $display("ERROR: waveform not specified");
        $finish;
    end
    $dumpfile(waveform_filename);
    $dumpvars(0, testbench);

    clk_cycle_count = 0;
end

reg clk;
reg rstn;

reg d;
wire q;

d_flipflop #(.N(1)) dff (
    .clk(clk),
    .rstn(rstn),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rstn = 1;
    @(negedge clk);
    rstn = 0;
    @(negedge clk);
    rstn = 1;

    while (1) begin
    @(posedge clk);
    clk_cycle_count = clk_cycle_count + 1;
    if (clk_cycle_count == 10) $finish;
  end
end

initial begin
    d = 0;
    #30;
    d = 1;
    #10;
    d = 0;
    #20;
    d = 1;
    #20;
    rstn = 0;
end

endmodule