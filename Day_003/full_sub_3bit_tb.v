module full_sub_3bit_tb;

  reg [2:0] A, B;
  reg BI;
  wire [2:0] Sub;
  wire BO;

  // Instantiate the DUT (Design Under Test)
  full_sub_3bit DUT(
    .Sub(Sub),
    .BO(BO),
    .A(A),
    .B(B),
    .BI(BI)
  );

  // Stimulus generation
  initial begin
    $dumpfile("sub.vcd");
    $dumpvars(0,full_sub_3bit_tb);
    $monitor("Time=%0t: A=%b, B=%b, BI=%b, Sub=%b, BO=%b", $time, A, B, BI, Sub, BO);
    
    // Test case 1
    A = 3'b011;
    B = 3'b101;
    BI = 1'b1;
    #5;

    // Test case 2
    A = 3'b101;
    B = 3'b010;
    BI = 1'b0;
    #5;

    // Test case 3
    A = 3'b110;
    B = 3'b100;
    BI = 1'b1;
    #5;

    // Add more test cases here
    
    $finish;
  end

endmodule
