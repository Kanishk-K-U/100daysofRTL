module D_FF_tb;

	// Inputs
	reg clk;
	reg rst;
	reg D_in;

	// Outputs
	wire D_out;

	// Instantiate the Unit Under Test (UUT)
	D_FF uut (
		.clk(clk), 
		.rst(rst), 
		.D_in(D_in), 
		.D_out(D_out)
	);

	initial begin
		// Initialize Inputs
		$dumpfile("d_ff.vcd");
		$dumpvars(0,D_FF_tb);
        $monitor($time,"rst=%b,D_in=%b, D_out=%b",rst,D_in,D_out);

		clk = 0;
		rst = 0;
		D_in = 0;

		
		#10;
		rst = 0;
		D_in = 1;
		
		#13;
		rst = 1;
		D_in = 1;

      
		#5;
		rst = 0;
		D_in = 0;



      #25;
		rst = 0;
		D_in = 1;

      #10;
		rst = 1;
		D_in = 1;
		
		#14
		$stop;



	end
   always #5 clk=~clk;   
endmodule