module jk_ff (Q, Qb, J, K, Clk, Set, Rst);
  input J, K, Clk, Set, Rst;
  output Q, Qb;
  wire [6:0] t;
  
  not g1 (t[0], Clk);

  nand g2(t[1], Qb, J, Clk),
       g3(t[2], Q, K, Clk),
       g4(t[3], t[1], t[4]),
       g5(t[4], t[2], t[3]),
       g6(t[5], t[3], t[0]),
       g7(t[6], t[4], t[0]),
       g8(Q, t[5], Qb, Set),
       g9(Qb, t[6], Q, Rst);

endmodule