module tb;
  reg a, clk;
  always 
    begin
      #10 clk = ~clk;
    end
  always@(clk) begin
    
    a <=  #15 clk;
    #21;
  end 
 
  initial
    begin
      $dumpvars;
      $monitor("t=%d,a=%b",$time,a);
      clk = 1;
      a = 0;
    #200 $finish;
    end
endmodule
