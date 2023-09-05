module fa_tb;
    reg a, b, c;
    wire sum, cout;
    fa uut(sum, cout, a, b, c);
    reg clk = 0;
    always #5 clk = ~clk;
    always begin
        $dumpfile("fa.vcd");
        $dumpvars(0,fa_tb);
        $monitor("%t a=%b b=%b c=%b sum=%b cout=%b", $time, a, b, c, sum, cout);
        a = 0; b = 0; c = 0;
        #5 a = 0; b = 1; c = 0;
        #5 a = 1; b = 1; c = 0;
        #5 a = 0; b = 1; c = 1;
        #5 a = 1; b = 1; c = 1;
        #5 $finish;
    end
endmodule
