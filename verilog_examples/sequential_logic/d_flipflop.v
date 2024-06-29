// N bit wide D Flip-Flop (Register) with
// synchronous, active-low reset.

module d_flipflop #(
    parameter N = 1
)(
    input              clk,
    input              rstn,
    input      [N-1:0] d,
    output reg [N-1:0] q
);

    always @(posedge clk) begin
        if (!rstn) q <= 0;
        else       q <= d;
    end

endmodule