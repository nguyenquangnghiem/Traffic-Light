module MUX(
    input normal_led,
    input controll_led,
    input sw_mode,
    input rst,
    output mux_out
);

assign mux_out = rst ? 1'b0 : ((normal_led && !sw_mode) || (controll_led && sw_mode));

endmodule