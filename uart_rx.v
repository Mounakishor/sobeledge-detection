module uart_rx
#(
    parameter CLK_FREQ = 27000000,
    parameter BAUD = 115200
)
(
    input clk,
    input rx,
    output reg [7:0] data,
    output reg valid
);

localparam CLKS_PER_BIT = CLK_FREQ / BAUD;

reg [15:0] clk_cnt = 0;
reg [3:0] bit_index = 0;
reg receiving = 0;
reg [7:0] rx_shift = 0;

always @(posedge clk)
begin

    if(receiving == 0)
    begin
        if(rx == 0)
        begin
            receiving <= 1;
            clk_cnt <= CLKS_PER_BIT/2;
            bit_index <= 0;
        end
    end

    else
    begin
        if(clk_cnt == CLKS_PER_BIT)
        begin
            clk_cnt <= 0;

            rx_shift[bit_index] <= rx;
            bit_index <= bit_index + 1;

            if(bit_index == 7)
            begin
                receiving <= 0;
                data <= rx_shift;
                valid <= 1;
            end
        end

        else
        clk_cnt <= clk_cnt + 1;
    end

    if(valid)
    valid <= 0;

end

endmodule