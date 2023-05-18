// Code your design here
`timescale 1ns/10ps

module new ;
reg clk=0;
  always #15.757 clk = ~clk;
  initial
    $timeformat(-9,3,"ns",1);
  initial
    begin
      $monitor("time=%t, clk=%b",$time,clk);
      #200 $finish;
    end
endmodule
