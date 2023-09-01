module mux8to1_tb;
    reg [7:0] in;
    reg [2:0] sel;
    wire out;
    mux8to1 uut(.in(in), .sel(sel), .out(out));
    initial begin
    $dumpfile("mux8to1.vcd");
    $dumpvars(0,mux8to1_tb);
    $monitor($time,"in=%b, sel=%b, out=%b",in,sel,out);
    #5 in=8'b00001111; sel=3'b111;
    #5 sel=3'b000;
    #5 sel=3'b100;
    #5 sel=3'b010;
    end
endmodule

    

