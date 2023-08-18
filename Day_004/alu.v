module ALU(opcode,in1,in2,out);
parameter ADD=2'b00,
			 SUB=2'b01,
			 MUL=2'b10,
			 XOR_BIT=2'b11;
input [1:0] opcode;
input [3:0] in1,in2;
output reg [7:0] out;
reg temp_out0,temp_out1,temp_out2,temp_out3,temp_out4;
reg temp_car0,temp_car1,temp_car2,temp_car3;
always@( * ) begin
case(opcode)
ADD: begin
     temp_out0=(in1[0]^in2[0]);
	  temp_car0=(in1[0]&in2[0]);
	  temp_out1=(in1[1]^in2[1]^temp_car0);
	  temp_car1=(in1[1]&in2[1])|(in2[1]&temp_car0)|(temp_car0&in1[1]);
	  temp_out2=(in1[2]^in2[2]^temp_car1);
	  temp_car2=(in1[2]&in2[2])|(in2[2]&temp_car1)|(temp_car1&in1[2]);
	  temp_out3=(in1[3]^in2[3]^temp_car2);
	  temp_out4=(in1[3]&in2[3])|(in2[3]&temp_car2)|(temp_car2&in1[3]);
     out={temp_out4,temp_out3,temp_out2,temp_out1,temp_out0};
     end
SUB: begin
     temp_out0=(in1[0]^(~in2[0])^1'b1);
	  temp_car0=((in1[0]&(~in2[0]))|(~in2[0]&1'b1)|(in1[0]&1'b0));
	  temp_out1=(in1[1]^(~in2[1])^temp_car0);
	  temp_car1=(in1[1]&(~in2[1]))|((~in2[1])&temp_car0)|(temp_car0&in1[1]);
	  temp_out2=(in1[2]^(~in2[2])^temp_car1);
	  temp_car2=(in1[2]&(~in2[2]))|((~in2[2])&temp_car1)|(temp_car1&in1[2]);
	  temp_out3=(in1[3]^(~in2[3])^temp_car2);
     out={temp_out3,temp_out2,temp_out1,temp_out0};
     end
	  
MUL: begin
	  out=in1*in2; 
     end
	  
XOR_BIT : begin
          out=in1^in2;
          end
			 
default: out=8'dx;
endcase
end

endmodule