// Single port RAM with synchronous read/write
module ram(addr, data, clk, rd, wr,cs);
    input [9:0] addr;
    inout [7:0] data;
    reg [7:0] mem [1023:0];
    reg [7:0] d_out;
    assign data = (cs && rd)? d_out : 8'bz;
    always @(posedge clk) begin
        if (cs && wr && !rd)
            mem[addr] = data;
    always @(posedge clk ) begin
        if (cs && rd && !wr)
            d_out = mem[addr];
    end
    end
endmodule