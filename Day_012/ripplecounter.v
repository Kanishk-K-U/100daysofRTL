// T-Flipflop
primitive t_ff (q,clk,clr);
    input clr,clk;
    output reg q;
    table
    // clk   clr  : q : q_new
        ?     1   : ? : 0;
        ?    (10) : ? : -;
      (10)    0   : 1 : 0;
      (10)    0   : 0 : 1;
      (0?)    0   : ? : -;
    endtable
endprimitive

//8-bit ripple counter
module ripplecounter (count,clk,clr);
input clk,clr;
output [7:0] count;
t_ff t0(count[0],clk,clr);
t_ff t1(count[1],count[0],clr);
t_ff t2(count[2],count[1],clr);
t_ff t3(count[3],count[2],clr);
t_ff t4(count[4],count[3],clr);
t_ff t5(count[5],count[4],clr);
t_ff t6(count[6],count[5],clr);
t_ff t7(count[7],count[6],clr);
endmodule