module cla_tb;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;

	// Outputs
	wire [4:0] out;
	cla uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	always begin
        $dumpfile("cla.vcd");
        $dumpvars(0,cla_tb);
    	$monitor($time, " in1=%b in2=%b out=%b",in1,in2,out);

		// Initialize Inputs
		in1 = 0;
		in2 = 0;

		in1=4'b1011;
		in2=4'b0011;
		
		#10
		in1=4'b1011;
		in2=4'b1011;
		
		#10
		in1=4'b1011;
		in2=4'b0111;

		#10
		$finish;
        

	end
endmodule