// Code your testbench here
// or browse Examples
`timescale 1ns / 1ns

module tb_moore_fsm;

reg clk, reset, x;
wire  z;

moore_fsm dut (.clk(clk), .reset(reset), .x(x), .z(z));

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
  $dumpfile("moore_fsm.vcd");
  $dumpvars(0,tb_moore_fsm);
$monitor("time=%d, clk = %b, reset = %b, x = %b, z = %b", $time, clk , reset, x, z);
#300 $finish;
end

initial
begin
reset=0;
@(negedge clk) reset = 1;
@(negedge clk) reset = 0;
#4;
x = 0; #10 x=0; #10; x=0; #10; x=1; #4; x=0; 
#10; x=0; #10; x=0; #10; x=1; #10; x=1; #10; x=0;
end
endmodule



