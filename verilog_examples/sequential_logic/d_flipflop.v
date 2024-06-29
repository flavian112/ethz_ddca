module d_flipflop #(
    parameter N = 1
)(
    input clk, rstn,
    input [N-1:0] d,
    output reg [N-1:0] q
);

    always @(posedge clk) begin
        if (!rstn) q <= 0;
        else       q <= d;
    end

endmodule