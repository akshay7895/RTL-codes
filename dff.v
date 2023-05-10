`timescale 1ns / 1ps

module d_ff( input data, clk, reset, output reg q, output qbar);

  always@(posedge clk or negedge reset)
begin
if(!reset) 
q <= 1'b0;
else
q <= data;
end

assign qbar = ~q;

endmodule
