// N^2 to 1 Multiplexer (N Bit Select Line)

module multiplexer #(
    parameter N = 2
)(
    input  wire [(1 << N) - 1:0] a,
    input  wire [N-1:0]          s,
    output wire                  y
);

wire [(1<<N)-1:0] n_0;

genvar i;
generate
    for (i = 0; i < (1 << N); i = i + 1) begin
        assign n_0[i] = (s == i) ? a[i] : 1'b0;
    end
endgenerate

assign y = |n_0;

endmodule