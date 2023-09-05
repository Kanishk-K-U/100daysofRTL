module majority16 (Out, Data);
  input [0:15] Data;
  output Out;
  reg [0:4] count, i;

  assign Out = count > 5'b1000 ? 1 : 0;

  always @ (Data) begin
    count = 5'b0;
    for (i=0; i<= 15; i=i+1)
      if (Data[i] == 1) 
        count = count + 1;
  end
endmodule