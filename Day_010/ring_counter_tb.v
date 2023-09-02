module ring_counter_tb;  
  parameter WIDTH = 8;  
    
  reg clk;  
  reg rstn;  
  wire [WIDTH-1:0] count;  
    
  ring_counter  uut(.clk (clk),  
                .rstn (rstn),  
                .count (count));  
    
  always #10 clk = ~clk;  
    
  initial begin  
    $dumpfile("ring_counter_tb.vcd");
    $dumpvars(0,ring_counter_tb);
    $monitor($time," rstn=%b, count=%b",rstn,count);
    {clk, rstn} <= 0;  
  
    repeat (2) @(posedge clk);  
    rstn <= 1;  
    repeat (10) @(posedge clk);  
    $finish;  
  end  
endmodule  