module COUNTER(
    input rst,
    input clk,
    input [1:0] state,       
    input [11:0] out,        
    output wire normal_led
);

reg [3:0] RED_TIME;
reg [3:0] GREEN_TIME;
reg [3:0] YELLOW_TIME;

reg [3:0] counter;
reg [3:0] TIME;

parameter OFF_LED   = 2'b00; 
parameter RED_LED    = 2'b01; 
parameter GREEN_LED  = 2'b10;
parameter YELLOW_LED = 2'b11;



reg [3:0] time_reg; 
reg timeout;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        timeout <= 0;
        RED_TIME    <= out[11:8];  
        GREEN_TIME  <= out[7:4];  
        YELLOW_TIME <= out[3:0];
        time_reg <= 0;

        $display("STATE CHANGE: RED_TIME = %0d, GREEN_TIME = %0d, YELLOW_TIME = %0d", RED_TIME, GREEN_TIME, YELLOW_TIME);
    end
    else begin
        if (counter == 0) begin
            case (state)
                OFF_LED:    time_reg <= RED_TIME;  
                RED_LED:    time_reg <= GREEN_TIME;
                GREEN_LED:  time_reg <= YELLOW_TIME;
                YELLOW_LED: time_reg <= 0;
                default:    time_reg <= 0;
            endcase
            $display("STATE CHANGE: %b, TIME = %0d", state, time_reg);
        end

        if (counter >= time_reg) begin
            counter <= 0;
            timeout <= 1;
        end
        else begin
            counter <= counter + 1;
            timeout <= 0;
        end
    end
end

assign normal_led = !timeout;


endmodule