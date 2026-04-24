module top
(
    input clk,
    input uart_rx_pin,
    output uart_tx_pin
);

wire [7:0] rx_data;
wire rx_valid;
wire tx_busy;

// UART Receiver
uart_rx RX
(
    .clk(clk),
    .rx(uart_rx_pin),
    .data(rx_data),
    .valid(rx_valid)
);

// UART Transmitter
uart_tx TX
(
    .clk(clk),
    .data(rx_data),      // send same pixel back
    .start(rx_valid),
    .tx(uart_tx_pin),
    .busy(tx_busy)
);

endmodule