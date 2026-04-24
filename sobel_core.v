module sobel_core
(
input clk,

input [7:0] p0,p1,p2,
input [7:0] p3,p4,p5,
input [7:0] p6,p7,p8,

output reg [7:0] edge_pixel
);

reg signed [10:0] gx;
reg signed [10:0] gy;
reg [10:0] mag;

always @(posedge clk)
begin

gx = -p0 + p2
     -2*p3 + 2*p5
     -p6 + p8;

gy = -p0 -2*p1 -p2
     +p6 +2*p7 +p8;

mag = (gx<0?-gx:gx) + (gy<0?-gy:gy);

if(mag > 150)
edge_pixel <= 8'hff;
else
edge_pixel <= 8'h00;

end

endmodule
