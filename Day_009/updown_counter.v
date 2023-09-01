module updown_counter(clk,d_in,rst,ld,mode,out);
    input clk,ld,rst,mode;
    input[7:0] d_in;
    output reg [7:0] out;
    always@(posedge clk)
        begin
            if (ld) 
                out <= d_in;
            else if (rst)
                out <= 0;
            else if (mode)
                out <= out+1;
            else
                out <= out-1;
        end
endmodule 