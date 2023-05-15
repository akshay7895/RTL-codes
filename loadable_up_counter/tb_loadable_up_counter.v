`timescale 1ns / 1ps

module tb_up;
reg clk, reset,load_en;
reg [3:0]load;
wire [3:0]count;

up dut(.clk(clk), .reset(reset), .load_en(load_en), .load(load), .count(count));
initial
begin
clk = 0;
forever #10 clk = ~clk;
end

initial
begin
#2 reset =1;load_en=0;
#20 reset =0;
#80 load_en =1; load = 1100;
#20 load_en = 0;
end

initial
begin
$monitor("time=%d, clk=%b, reset=%b, count=%b, load_en=%b, load=%b",$time,clk,reset,count,load_en,load);
#200 $finish;
end
 
endmodule
