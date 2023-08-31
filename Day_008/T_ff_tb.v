module T_ff_tb;
	reg clk;
	reg rst;
	reg T_in;
	wire T_out;
	T_ff uut (
		.clk(clk), 
		.rst(rst), 
		.T_in(T_in), 
		.T_out(T_out)
	);

	initial begin
		$dumpfile("t_ff.vcd");
		$dumpvars(0,T_ff_tb);
        $monitor($time," rst=%b, T_in=%b, T_out=%b",rst,T_in,T_out);
		clk = 0;
		rst = 0;
		T_in = 0;

		#10;
		rst = 0;
		T_in = 1;
		
		#13;
		rst = 1;
		T_in = 1;

		#5;
		rst = 0;
		T_in = 0;

      #25;
		rst = 0;
		T_in = 1;

      #10;
		rst = 1;
		T_in = 1;
		
		#14
		$stop;

	end
     always #5 clk=~clk; 
endmodule