module pipe_tb;
parameter N = 10;
wire [N-1:0] F;
reg [N-1:0] A, B, C, D;
reg clk;
pipe UUT (F, A, B, C, D, clk);
initial clk = 0;
always #10 clk = ~clk;
initial
begin
#5 A = 10; B = 12; C = 6; D = 3; // F = 75 (4Bh)
#20 A = 10; B = 10; C = 5; D = 3; // F = 66 (42h)
#20 A = 20; B = 11; C = 1; D = 4; // F = 112 (70h)
#20 A = 15; B = 10; C = 8; D = 2; // F = 62 (3Eh)
#20 A = 8; B = 15; C = 5; D = 0; // F = 0 (00h)
#20 A = 10; B = 20; C = 5; D = 3; // F = 66 (42h)
#20 A = 10; B = 10; C = 30; D = 1; // F = 49 (31h)
#20 A = 30; B = 1; C = 2; D = 4; // F = 116 (74h)
end
initial
begin
$dumpfile ("pipe.vcd");
$dumpvars (0,pipe_tb);
$monitor ("Time: %d, F = %d", $time, F);
#300 $finish;
end
endmodule