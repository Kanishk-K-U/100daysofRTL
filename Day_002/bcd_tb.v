module tb_BCD_to_Excess3;

    // Parameters
    reg [3:0] bcd_in;
    wire [9:0] excess3_out;

    // Instantiate the BCD to Excess-3 converter
    BCD_to_Excess3 uut (
        .bcd_in(bcd_in),
        .excess3_out(excess3_out)
    );

    // Clock generation
    reg clk;
    always #5 clk = ~clk;

    // Testbench behavior
    initial begin
        $dumpfile ("bcd.vcd");
        $dumpvars (0,tb_BCD_to_Excess3);
        // Initialize clock
        clk = 0;

        // Test different BCD input values
        for (bcd_in = 0; bcd_in < 10; bcd_in = bcd_in + 1) begin
            #10; // Wait for a few clock cycles
            
            // Display input and output
            $display("BCD Input: %d, Excess-3 Output: %b", bcd_in, excess3_out);
        end

        $finish; // End simulation
    end

endmodule
