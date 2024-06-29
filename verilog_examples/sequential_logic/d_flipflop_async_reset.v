// N bit wide D Flip-Flop (Register) with
// asynchronous, active-low reset.

module d_flipflop_async_reset #(
    parameter N = 1
)(
    input              clk,
    input              rstn,
    input      [N-1:0] d,
    output reg [N-1:0] q
);

    always @ (posedge clk negedge rstn) begin
        if (!rstn) q <= 0;
        else       q <= d;
    end

endmodule