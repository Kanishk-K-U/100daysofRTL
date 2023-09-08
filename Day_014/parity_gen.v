module serial_paritity_gen (x,clk,z);
    input x,clk;
    output reg z;
    reg even_odd;
    parameter EVEN=0, ODD=1;
    always @ (posedge clk) begin
        case (even_odd)
            EVEN: even_odd <= x? ODD:EVEN;
            ODD: even_odd <= x? EVEN:ODD;
            default: even_odd <= EVEN;
        endcase
    end
    always @ (even_odd) begin
        case (even_odd)
            EVEN: z= 0;
            ODD: z = 1;
        endcase
    end
endmodule