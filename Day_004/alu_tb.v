module alu_tb;
	reg [1:0] opcode;
	reg [3:0] in1;
	reg [3:0] in2;
	wire [7:0] out;

	ALU dut (.opcode(opcode), .in1(in1), .in2(in2), .out(out));

	initial begin
        $dumpfile ("alu.vcd");
        $dumpvars (0,alu_tb);
		opcode = 0;
		in1 = 0;
		in2 = 0;
        $monitor($time ," opcode=%b,in1=%b,in2=%b, out=%b",opcode,in1,in2,out);
		#5 opcode=2'b01; in1=4'b1011; in2=4'b0110;
		#5 opcode=2'b00; in1=4'b1100; in2=4'b0111;
		#5 opcode=2'b10; in1=4'b1100; in2=4'b0111;
		#5 opcode=2'b11; in1=4'b1100; in2=4'b0111;
		#5 $finish;
	end
      
endmodule
