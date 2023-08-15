module muxtest;
reg [15:0] a;
reg [3:0] s;
wire f;
mux16to1 M(.in(a),.sel(s),.out(f));
initial 
    begin
        $dumpfile("mux16to1.vcd");
        $dumpvars(0,muxtest);
        $monitor($time,"a=%h,s=%h,f=%b",a,s,f);
        #5 a=16'h3f0a;s=4'h0;
        #5 s=4'hc;
        #5 s=4'h6;
        #5 $finish;
    end
endmodule
