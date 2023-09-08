module serial_paritity_gen_tb;
    reg x,clk;
    wire z;
    serial_paritity_gen uut(.x(x), .clk(clk), .z(z));
    initial begin
        $dumpfile("serial_parity.vcd");
        $dumpvars(0,serial_paritity_gen_tb);
        $monitor($time," x=%b  z=%b",x,z);
        clk=1'b0;
    end
    always #5 clk=~clk;
    initial begin
        #2 x=0; #10 x=1; #10 x=0; #10 x=1; #10 x=1; #10 x=0;
        #10 x=0; #10 x=1; #10 x=0; #10 x=0; #10 x=1; #10 x=0;
        #10 x=1; #10 x=1; #10 x=0; #10 x=0; #10 x=1; #10 x=0;
        #10 $finish;
    end
endmodule