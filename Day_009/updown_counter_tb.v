module updown_counter_tb;

  reg clk;
  reg rst;
  reg ld;
  reg mode;
  reg [7:0] d_in;

  wire [7:0] out;

  updown_counter uut (
    .clk(clk),
    .rst(rst),
    .ld(ld),
    .mode(mode),
    .d_in(d_in),
    .out(out)
  );

  always begin
    #5 clk = ~clk; 
  end

  initial begin
    $dumpfile("updown_counter.vcd");
    $dumpvars(0,updown_counter_tb);
    $monitor($time," d_in=%b,rst=%b,ld=%b,mode=%b,out=%b", d_in,rst,ld,mode,out);
    clk = 0;
    rst = 0;
    ld = 0;
    mode = 0;
    d_in = 8'b00000000;

    rst = 1;
    #10 rst = 0;

    ld = 1;
    d_in = 8'b10101010; // Load a specific value
    #10;
    ld = 0; // Disable loading

    mode = 1; // Count up
    #20;
    mode = 0; // Count down
    #20;
    rst = 1;
    #20;
    
    $finish;
  end
endmodule
