module shift_reg_tb;
  reg clk;
  reg clr;
  reg A;
  wire E;

  shift_reg uut (.clk(clk), .clr(clr), .A(A), .E(E));

  always begin
    #5 clk = ~clk; 
  end

  initial begin
    $dumpfile("shift_reg.vcd");
    $dumpvars(0,shift_reg_tb);
    clk = 0;
    clr = 0;
    A = 0;

    clr = 1;
    #10 clr = 0;

    A = 1;
    #10 A = 0;
    #10 A = 1;
    #10 A = 0;
    #10 A = 1;
    #20
    $display("E = %b", E);
    $finish;
  end
endmodule
