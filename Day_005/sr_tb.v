module sr_tb;
reg s,r;
wire q,qb;
sr_ff M(.s(s),.r(r),.q(q),.qb(qb));
initial
    begin
        $dumpfile("sr_tb.vcd");
        $dumpvars(0,sr_tb);
        $monitor($time," S=%b R=%b q=%b qb=%b",s,r,q,qb);
        #5 s=1'b0; r=1'b0;
        #5 s=1'b0; r=1'b1;
        #5 s=1'b1; r=1'b1;
        #5 s=1'b1; r=1'b0;
        #5 s=1'b0; r=1'b1;
    end
endmodule