module cyclic_lamp_tb;
    reg clk;
    wire [0:2] out;
    cyclic_lamp uut(.clk(clk), .out(out));
    always #5 clk = ~clk;
    initial begin
        clk=1'b0;
        #100 $finish;
    end
    initial begin
        $dumpfile("lamp.vcd");
        $dumpvars(0,cyclic_lamp_tb);
        $monitor($time," RGY=%b",out);
    end
endmodule