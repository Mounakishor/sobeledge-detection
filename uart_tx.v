module uart_tx
#(
parameter CLK_FREQ = 27000000,
parameter BAUD = 115200
)
(
input clk,
input [7:0] data,
input start,
output reg tx,
output reg busy
);

localparam CLKS_PER_BIT = CLK_FREQ / BAUD;

reg [15:0] clk_cnt = 0;
reg [3:0] bit_index = 0;
reg [9:0] tx_data;

always @(posedge clk)
begin

if(start && !busy)
begin
tx_data <= {1'b1,data,1'b0};
busy <= 1;
bit_index <= 0;
end

if(busy)
begin

if(clk_cnt < CLKS_PER_BIT)
clk_cnt <= clk_cnt + 1;

else
begin

clk_cnt <= 0;
tx <= tx_data[bit_index];
bit_index <= bit_index + 1;

if(bit_index == 9)
busy <= 0;

end

end

end

endmodule