module half_sub (Diff, Bout, X, Y);

  input  X, Y;
  output Diff, Bout;

  assign Diff = X ^ Y;
  assign Bout = (~X) & Y;
endmodule

module full_sub_3bit (Sub, BO, A, B, BI);

  input  [2:0] A, B;
  input BI;

  output [2:0] Sub;
  output BO;
 
  wire [2:0] td; 
  wire [5:0] t;
  wire [1:0] tbo;
 
  half_sub h0 (td[0], t[0], A[0], B[0]);
  half_sub h1 (Sub[0], t[1], td[0], BI);
  or g1 (tbo[0], t[0], t[1]); 
  half_sub h2 (td[1], t[2], A[1], B[1]);
  half_sub h3 (Sub[1], t[3], td[1], tbo[0]);
  or g2 (tbo[1], t[2], t[3]); 
  half_sub h4 (td[2], t[4], A[2], B[2]);
  half_sub h5 (Sub[2], t[5], td[2], tbo[1]);
  or g3 (BO, t[4], t[5]); 
endmodule