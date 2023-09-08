module seq_detector_tb;
reg x, clk, rst;
wire z;
seq_detector uut( .x(x), .clk(clk), .rst(rst), .z(z));
initial begin
    $dumpfile("seq_detector.vcd");
    $dumpvars(0,seq_detector_tb);
    $monitor($time, " x=%b z=%b",x,z);
    clk =1'b0;
    rst=1'b1;
    #10 rst=1'b0;
end
always #5 clk=~clk;
initial begin
    #8 x=0; #10 x=1; #10 x=0; #10 x=1; #10 x=1; #10 x=0;
        #10 x=0; #10 x=1; #10 x=1; #10 x=0; #10 x=1; #10 x=0;
        #10 x=1; #10 x=1; #10 x=0; #10 x=0; #10 x=1; #10 x=0;
        #10 $finish;
end
endmodule