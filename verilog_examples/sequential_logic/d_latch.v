// N bit wide D Latch with enable
// and active-low reset.

module d_latch #(
    parameter N = 1
)(
    input              rstn,
    input              en,
    input      [N-1:0] d,
    output reg [N-1:0] q
);

    always @ (en or rstn or d) begin
        if (!rstn)   q <= 0;
        else if (en) q <= d;
    end

endmodule