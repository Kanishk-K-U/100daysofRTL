module b2g_g2b(select,in,out);

input select;
input [3:0] in;
output reg [3:0] out;

always@( * ) begin
if(select==1'b1) begin // means we choose the binary to grey converter
out[3]=in[3];
out[2]=in[3]^in[2];
out[1]=in[2]^in[1];
out[0]=in[1]^in[0];
end
else if(select==1'b0) begin // means we choose the grey to binary converter
out[3]=in[3];
out[2]=out[3]^in[2];
out[1]=out[2]^in[1];
out[0]=out[1]^in[0];
end
end

endmodule