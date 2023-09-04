module tb_rca;
    parameter N = 8;

    // Inputs
    reg [N-1:0] a, b;
    reg c;

    // Outputs
    wire [N-1:0] sum;
    wire cout;

    // Instantiate the RCA module
    rca uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus generation
    initial begin
        $dumpfile("rca.vcd");
        $dumpvars(0,tb_rca);        
        a = 8'b10101010; // Example input values
        b = 8'b11001100;
        c = 1'b0; // Carry-in

        // Apply inputs and observe outputs
        #10; // Wait for some simulation cycles

        // Display the results
        $display("Inputs: a=%b, b=%b, c=%b", a, b, c);
        $display("Sum: sum=%b, cout=%b", sum, cout);

        // Add more test cases if needed

        // End simulation
        $finish;
    end
endmodule
