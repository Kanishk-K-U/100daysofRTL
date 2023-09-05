module majority16_tb;
  reg [0:15] Data;
  wire Out;
  majority16 uut(Out, Data);
  initial begin
    $dumpfile("majority16.vcd");
    $dumpvars(0,majority16_tb);
    $monitor($time," Data=%b => Out=%b",Data,Out);
	  #5 Data=16'b1001000101111101;
	 #10 Data=16'b0101010101010101;
	 #15 Data=16'b1111001101010101;
	 #20 Data=16'b0010111111011110;
	 #25 Data=16'b1111111111111111;
	 #30 Data=16'b1111010110101111;
	 #35 Data=16'b1111100000110000;
	 #40 Data=16'b0;

  end
  endmodule