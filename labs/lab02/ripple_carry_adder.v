// N Bit Ripple Carry Adder (RCA), which is a type
// of Carry Propagation Adder (CPA).

module ripple_carry_adder #(
    parameter N = 8
)(
    input  [N-1:0] a,
    input  [N-1:0] b,
    input          c_in,
    output [N-1:0] s,
    output         c_out
);

wire [N:0] c;
assign c[0] = c_in;

genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : full_adder_gen
        full_adder fa (
            .a(a[i]),
            .b(b[i]),
            .c_in(c[i]),
            .s(s[i]),
            .c_out(c[i+1])
        );
    end
endgenerate

assign c_out = c[N];

endmodule