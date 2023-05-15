`timescale 1ns / 1ps

module siso( input din, clk, reset, output reg dout);
wire d0,d1,d2;
  reg q3,q2,q1;
  
  always@(posedge clk) begin
    if(reset) begin
      q3 <= 0;
      q2 <= 0;
      q1 <= 0;
      dout <= 0;
      end
    else begin
        q3 <= din;
        q2 <= d2;
        q1 <= d1;
        dout <= d0;
      end
    end
  assign d2 = q3;
  assign d1 = q2;
  assign d0 = q1;
  //assign dout = q0;
endmodule
