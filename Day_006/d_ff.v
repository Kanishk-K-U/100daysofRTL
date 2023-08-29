module D_FF(clk,rst,D_in,D_out);
input D_in;
input clk,rst;
output reg D_out;

always@(posedge clk) begin
if(rst) begin
D_out<=1'b0;
end
else begin
D_out<=D_in;
end
end


endmodule