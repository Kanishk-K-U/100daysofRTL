module cyclic_lamp ( clk, out);
    input clk;
    output reg [2:0] out;
    parameter S0=0, S1=1, S2=2;
    parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
    reg [0:1] state;
    always @(posedge clk) 
        case (state)
        S0: state<=S1;
        S1: state<=S2;
        S2: state<=S0;
        default: state<=S0;
        endcase
    always @(state)
        case (state)
        S0: out<=RED;
        S1: out<=YELLOW;
        S2: out<=GREEN;
        default: out<=RED;
        endcase

endmodule