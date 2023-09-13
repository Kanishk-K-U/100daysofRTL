module cla(in1,in2,out);

input [3:0] in1,in2;
output [4:0] out;

wire c0,c1,c2,c3,c4;

wire p0,p1,p2,p3;
wire g0,g1,g2,g3;

assign p0=(in1[0]^in2[0]);
assign p1=(in1[1]^in2[1]);
assign p2=(in1[2]^in2[2]);
assign p3=(in1[3]^in2[3]);

assign g0=(in1[0]&in2[0]);
assign g1=(in1[1]&in2[1]);
assign g2=(in1[2]&in2[2]);
assign g3=(in1[3]&in2[3]);

assign c0=1'b0;
assign c1=((p0&c0)|g0);
assign c2=((p1&c1)|g1);
assign c3=((p2&c2)|g2);
assign c4=((p3&c3)|g3);

assign out[0]=(p0^c0);
assign out[1]=(p1^c1);
assign out[2]=(p2^c2);
assign out[3]=(p3^c3);
assign out[4]=c4;

endmodule