module tb_dff();
  reg d, clk, reset;
  wire q, qbar;
  
  dff dut(.d(d), .clk(clk), .reset(reset), .q(q), .qbar(qbar));
  
  initial
    begin
      clk = 0;
      forever #10 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      d = 0;
      #15 reset = 0;
      #10;
      #20 d =1;
      #20 d = 0;
      #100 $finish;
      $monitor("time=%d, d = %b , q = %b, reset = %b, clk = %b", $time, d,q,reset,clk);
    end
endmodule
