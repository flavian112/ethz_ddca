// N to 2^N Decoder

module decoder #(
    parameter N = 2
)(
    input [N - 1:0]         a,
    output [(1 << N) - 1:0] y
);

genvar i;
generate
    for (i = 0; i < (1 << N); i = i + 1) begin
        assign y[i] = (a == i);
    end
endgenerate

endmodule