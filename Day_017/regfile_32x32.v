module regfile ( rd_data1, rd_data2, wr_data, sr1, sr2, dr, wr, rst, clk);
    input clk, rst, wr;
    input [4:0] sr1, sr2, dr;
    input [31:0] wr_data;
    output [31:0] rd_data1, rd_data2;
    integer i;
    reg [31:0] regfile[31:0];

    assign rd_data1= regfile[sr1];
    assign rd_data2= regfile[sr2];
    always @(posedge clk ) begin
        if(rst) begin
            for (i=0; i<32; i=i+1) begin
                regfile[i]<=0;
            end
        end
        else begin
            if(wr) begin
                regfile[dr]<= wr_data;
            end
        end
    end
endmodule