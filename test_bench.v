`include "TRAFFIC_LIGHT.v"

module tb_TRAFFIC_LIGHT;
reg clk;
reg rst;
reg [11:0] sw_led;
reg controll_led;
reg sw_mode = 0;


wire [1:0] led;

TRAFFIC_LIGHT u_traffic_light (
    .clk (clk),
    .rst (rst),
    .sw_led (sw_led),
    .controll_led (controll_led),
    .led (led),
    .sw_mode (sw_mode)
);


localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_TRAFFIC_LIGHT.vcd");
    $dumpvars(0, tb_TRAFFIC_LIGHT);
end

initial begin
    sw_led = 12'b1111_1111_0010 ;
    sw_mode = 0;
    controll_led = 0;
end

initial begin
    clk = 0;
    rst = 1; # (5 * CLK_PERIOD) ;
    rst = 0;
    #40000; $finish;
end



endmodule