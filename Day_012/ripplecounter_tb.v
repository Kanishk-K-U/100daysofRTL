module tb_ripplecounter;
    reg clk;
    reg clr;
    wire [7:0] count;
    ripplecounter uut(count, clk, clr);
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        clr = 0;
        clr = 1;
        #10 clr = 0;
        repeat (10) begin
            #10;
        $display("Counter Value: %b => %d", count, count);
        end
        $finish;
    end
endmodule
