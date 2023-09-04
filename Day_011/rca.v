module rca(a, b, c, sum, cout);
    parameter N = 8;
    input [N-1:0] a, b;
    input c;
    output [N-1:0] sum;
    output cout;
    wire [N:0] carry;
    assign carry[0] = c;

    generate
        for (genvar i = 0; i < N; i = i + 1) begin : fa_loop
            wire t1, t2, t3;
            xor G1 (t1, a[i], b[i]);
            xor G2 (sum[i], t1, carry[i]);
            and G3 (t2, a[i], b[i]);
            and G4 (t3, t1, carry[i]);
            or G5 (carry[i+1], t2, t3);
        end
    endgenerate

    assign cout = carry[N];
endmodule
