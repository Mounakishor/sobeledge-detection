module line_buffer
(
input clk,
input [7:0] pixel_in,
input valid,

output [7:0] p0,p1,p2,
output [7:0] p3,p4,p5,
output [7:0] p6,p7,p8
);

reg [7:0] line1 [0:255];
reg [7:0] line2 [0:255];

reg [8:0] col = 0;

always @(posedge clk)
begin

if(valid)
begin

line2[col] <= line1[col];
line1[col] <= pixel_in;

col <= col + 1;

end

end

assign p0 = line2[col-2];
assign p1 = line2[col-1];
assign p2 = line2[col];

assign p3 = line1[col-2];
assign p4 = line1[col-1];
assign p5 = line1[col];

assign p6 = pixel_in;

endmodule