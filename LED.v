module LED(
    input [1:0] state,
    input rst,
    output [1:0] led
);

assign led = (rst) ? 2'b00 : state;  // Nếu rst, tắt đèn; ngược lại, giữ nguyên state
endmodule