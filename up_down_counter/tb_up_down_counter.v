`timescale 1ns / 1ps

module tb_up;
reg clk, reset,up_down;
wire [3:0]count;

up dut(.clk(clk), .reset(reset), .up_down(up_down), .count(count));
initial
begin
clk = 0;
forever #10 clk = ~clk;
end

initial
begin
#2 reset =1;up_down=0;
#20 reset =0;
#80 up_down =1; 
#20 up_down = 0;
end

initial
begin
$monitor("time=%d, clk=%b, reset=%b, count=%b, up_down=%b",$time,clk,reset,count,up_down);
#200 $finish;
end
 
endmodule
