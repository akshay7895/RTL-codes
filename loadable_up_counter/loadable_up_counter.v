`timescale 1ns / 1ps
module up (input clk, reset,load_en,input [3:0]load, output reg [3:0]count);
  
  always@(posedge clk) begin
    if(reset) count = 0;
    else if(load_en)
    count <= load;
    else
    count <= count +1;
    end
    endmodule
