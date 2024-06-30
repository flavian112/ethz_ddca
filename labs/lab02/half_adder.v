// 1 Bit Half Adder, implemented with structural modeling.

module half_adder (
    input  a,
    input  b,
    output s,
    output c_out
);

xor xor_0 (s, a, b);
and and_0 (c_out, a, b);

endmodule