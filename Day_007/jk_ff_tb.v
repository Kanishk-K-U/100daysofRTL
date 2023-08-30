module tb_jk_ff;
  reg J, K, Clk, Set, Rst;
  wire Q, Qb;
  jk_ff uut (.J(J), .K(K), .Clk(Clk), .Set(Set), .Rst(Rst), .Q(Q), .Qb(Qb));
  
    initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
  end
  
  initial begin
    $dumpfile("tb_jk_ff.vcd");
    $dumpvars(0, tb_jk_ff);
    
    // Scenario 1: Set and Reset both active (not allowed behavior)
    #10; J = 1'b0; K = 1'b0; Set = 1'b1; Rst = 1'b1;
    
    // Scenario 2: Set active, then Reset active (not allowed behavior)
    #10; Set = 1'b1; Rst = 1'b0;
    #10; Set = 1'b0; Rst = 1'b1;
    
    // Scenario 3: J and K both inactive (toggle behavior)
    #10; Set = 1'b0; Rst = 1'b0; J = 1'b0; K = 1'b0;
    
    // Scenario 4: J active (set behavior)
    #10; J = 1'b1;
    
    // Scenario 5: K active (reset behavior)
    #10; J = 1'b0; K = 1'b1;
    
    // Scenario 6: Set active (set behavior)
    #10; K = 1'b0; Set = 1'b1;
    
    // Scenario 7: Reset active (reset behavior)
    #10; Set = 1'b0; Rst = 1'b1;
    
    // Scenario 8: J and K both active (toggle behavior)
    #10; J = 1'b1; K = 1'b1;
    
    // Wait for simulation to finish
    #10;
    $finish;
  end
  
  // Monitor outputs
  always @(Q or Qb)
    $display($time, " Q = %b, Qb = %b", Q, Qb);
  
endmodule
