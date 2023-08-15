//16to1 mux using 4to1
module mux16to1(out,in,sel);
    input [15:0]in;
    input [3:0]sel;
    output out;
    wire [3:0]t;
    mux4to1 m0 (t[0],in[3:0],sel[1:0]);
    mux4to1 m1 (t[1],in[7:4],sel[1:0]);
    mux4to1 m2 (t[2],in[11:8],sel[1:0]);
    mux4to1 m3 (t[3],in[15:12],sel[1:0]);
    mux4to1 m4 (out,t,sel[3:2]);
endmodule
//4to1 mux using 2to1
module mux4to1(out,in,sel);
    input[3:0]in;
    input[1:0]sel;
    output out;
    wire [1:0]t;
    mux2to1 m0(t[0],in[1:0],sel[0]);
    mux2to1 m1(t[1],in[3:2],sel[0]);
    mux2to1 m3(out,t,sel[1]);
endmodule
//2to1 mux structural
module mux2to1(out,in,sel);
    input[1:0]in;
    input sel;
    output out;
    not g1(t1,sel);
    and g2(t2,in[0],t1);
    and g3(t3,in[1],sel);
    or g4(out,t2,t3);
endmodule


