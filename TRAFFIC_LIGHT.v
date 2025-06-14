
`include "COUNTER.v"
`include "SET_LED_TIME.v"
`include "MUX.v"
`include "LOGIC.v"
`include "LED.v"

module TRAFFIC_LIGHT(
    input clk,
    input rst,
    input [11:0] sw_led,
    input controll_led,
    input sw_mode, 

    output [1:0] led
);

wire normal_led;
wire [11:0] out;
wire mux_out;
wire [1:0] state;

COUNTER u_counter (
    .rst(rst),
    .clk(clk),
    .state(state),
    .out(out),
    .normal_led(normal_led)
);

SET_LED_TIME u_set_led_time (
    .clk(clk),
    .sw_led(sw_led),
    .out(out)
);

MUX u_mux (
    .normal_led(normal_led),
    .controll_led(controll_led),
    .sw_mode(sw_mode),
    .mux_out(mux_out),
    .rst(rst)
);

LOGIC u_logic (
    .clk(clk),
    .rst(rst),
    .mux_out(mux_out),
    .state(state)
);

LED u_led (
    .rst(rst),
    .state(state),
    .led(led)
);

endmodule