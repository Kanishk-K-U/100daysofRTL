module ring_counter  #(parameter WIDTH=8)   
  (    
    input clk,                  
    input rstn,  
    output reg [WIDTH-1:0] count  
  );      
   
  always @ (posedge clk) begin  
      if (!rstn)  
         count <= 1;  
      else begin  
        count[WIDTH-1] <= count[0];  
        for (integer i = 0; i < WIDTH-1; i=i+1) begin  
          count[i] <= count[i+1];  
        end  
      end  
  end  
endmodule  