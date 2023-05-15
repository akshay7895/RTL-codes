`timescale 1ns / 1ps
module tb_siso;
reg din,clk,reset;
  wire dout;
  
  siso dut(.din(din), .clk(clk), .reset(reset), .dout(dout));
  
initial
  begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial
    begin
      #2 reset = 1; din=0;
      #20 reset = 0; din = 0;
      #20 din = 0;
      #20 din = 1;
      #20 din = 1;
      #20 din = 0;
      #20 din = 1;
      #20 din = 0;
    end
  initial
    begin

      $monitor("time=%d, clk=%b, reset=%b, din=%b, dout=%b",$time,clk,reset,din,dout);
      #200 $finish; end
endmodule
