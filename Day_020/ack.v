module Ack(
  input wire clk,
  input wire req,
  output reg ack
);

  reg [2:0] count;

  always @(posedge clk) begin
    if (req) begin
      if (count < 5) begin
        count <= count + 1;
        ack <= 0;
      end else begin
        count <= 0;
        ack <= 1;
      end
    end else begin
      count <= 0;
      ack <= 0;
    end
  end

endmodule
