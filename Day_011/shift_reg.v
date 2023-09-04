module shift_reg (clk, clr, A, E);
input clk,clr,A;
output reg E;
reg B,C,D;
always @(posedge clk or negedge clr) begin
    if (!clr) begin
        E<=D;
        D<=C;
        C<=B;
        B<=A;
    end
end
endmodule