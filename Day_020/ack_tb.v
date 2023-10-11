`timescale 1ns/1ns

module Ack_tb;
  reg clk;
  reg req;
  wire ack;

  // Instantiate the module
  Ack uut(
    .clk(clk),
    .req(req),
    .ack(ack)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    $dumpfile("ack.vcd");
    $dumpvars(0,Ack_tb);
    clk = 0;
    req = 0;

    // Apply req at time 0
    #1 req = 1;
    #10 req = 0;

    // Apply req again within 5 cycles (ignored)
    #20 req = 1;
    #25 req = 0;

    // Apply req after 5 cycles (ack should go high)
    #30 req = 1;
    #35 req = 0;

    // Apply req again within 5 cycles (ignored)
    #40 req = 1;
    #45 req = 0;

    // Apply req after 5 cycles (ack should go high)
    #50 req = 1;
    #55 req = 0;

    // Stop simulation
    #60 $finish;
  end

endmodule
