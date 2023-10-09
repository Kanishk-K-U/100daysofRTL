module b2g_g2b_tb;
	reg select;
	reg [3:0] in;
	// Outputs
	wire [3:0] out;
	b2g_g2b uut (
		.select(select), 
		.in(in), 
		.out(out)
	);
integer i;
initial begin
$dumpfile("b2g_g2b_tb.vcd");
$dumpvars(0,b2g_g2b_tb);
$monitor($time," in=%b, out=%b",in,out);
for(i=0;i<=15;i=i+1) begin
#10
select=1'b1;
in=i;
end

for(i=0;i<=15;i=i+1) begin
#10
select=1'b0;
in=i;
end
#10
$stop;
end
endmodule