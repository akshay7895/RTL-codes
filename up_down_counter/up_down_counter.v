`timescale 1ns / 1ps
module up (input clk, reset,up_down, output reg [3:0]count);
  
  always@(posedge clk) begin
    if(reset) count = 0;
    else if(up_down)
    count <= count +1;
    else
    count <= count -1;
    end
    endmodule
