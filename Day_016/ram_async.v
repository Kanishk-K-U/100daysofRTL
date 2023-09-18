// Single port RAM with asynchronous read/write
module ram_asynchronous(addr, data, rd, wr,cs);
    input [9:0] addr;
    inout [7:0] data;
    reg [7:0] mem [1023:0];
    reg [7:0] d_out;
    assign data = (cs && rd)? d_out : 8'bz;
    always @(addr or data or clk or rd or wr or cs) begin
        if (cs && wr && !rd)
            mem[addr] = data;
    always @(addr or clk or rd or wr or cs ) begin
        if (cs && rd && !wr)
            d_out = mem[addr];
    end
    end
endmodule