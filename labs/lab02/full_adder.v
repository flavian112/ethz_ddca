// 1 Bit Full Adder, implemented with structural modeling.

module full_adder (
    input  a,
    input  b,
    input  c_in,
    output s,
    output c_out
);

wire n_0;
wire n_1;
wire n_2;

half_adder ha_0 (.a(a), .b(b), .s(n_0), .c_out(n_1));
half_adder ha_1 (.a(c_in), .b(n_0), .s(s), .c_out(n_2));

or or_0 (c_out, n_1, n_2);


endmodule