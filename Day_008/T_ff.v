module T_ff(clk,rst,T_in,T_out);

input clk,rst;
input T_in;
output T_out;
wire temp;
assign temp=~T_in;
D_FF d1(clk,rst,temp,T_out);

endmodule

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