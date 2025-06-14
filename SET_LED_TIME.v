module SET_LED_TIME(
    input clk,
    input [11:0] sw_led,
    output reg [11:0] out
);

always @(posedge clk) begin
    out <= sw_led;
end

endmodule