module LOGIC(
    input clk,
    input rst,
    input mux_out,
    output reg [1:0] state
);

parameter OFF_LED   = 2'b00; 
parameter RED_LED    = 2'b01; 
parameter GREEN_LED  = 2'b10;
parameter YELLOW_LED = 2'b11;

reg mux_out_prev; 
wire mux_rising_edge;

assign mux_rising_edge = (mux_out == 1'b1) && (mux_out_prev == 1'b0);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= OFF_LED; 
        mux_out_prev <= 1'b0;
    end
    else begin
        mux_out_prev <= mux_out;
        if (mux_rising_edge) begin
            case (state)
                OFF_LED:   state <= RED_LED;   
                RED_LED:   state <= GREEN_LED;
                GREEN_LED: state <= YELLOW_LED;
                YELLOW_LED: state <= RED_LED;
                default:   state <= OFF_LED;
            endcase
        end
    end
end

endmodule