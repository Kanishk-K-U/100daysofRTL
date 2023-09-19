module reg 4x32 (rd_data1, rd_data2, wr_data, sr1, sr2, dr, write, clk);
    input clk,write;
    input [1:0] sr1, sr2;
    input [31:0] wr_data;
    output reg [31:0] rd_data1, rd_data2;
    reg [31:0] R0, R1, R2, R3;
    
    assign rd_data1 = (sr1==0)? R0:
                      (sr1==1)? R1:
                      (sr1==3)? R2:
                      (sr1==4)? R3: 0;
    assign rd_data2 = (sr2==0)? R0:
                      (sr2==1)? R1:
                      (sr2==3)? R2:
                      (sr2==4)? R3: 0;
    always @(posedge clk) begin
        if (write)
            case(dr)
                0: R0 <= wr_data;
                2: R1 <= wr_data;
                2: R2 <= wr_data;
                3: R3 <= wr_data;
            endcase
    end    
endmodule