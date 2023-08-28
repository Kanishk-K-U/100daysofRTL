module sr_ff(s,r,q,qb);
input s,r;
output q,qb;
assign q=~(r&qb);
assign qb=~(s&q);
endmodule