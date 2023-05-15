`timescale 1ns / 1ps


module tb_jk_ff;
    reg j,k,clk,reset;
    wire q;

    jk_ff dut (.clk(clk), .reset(reset), .j(j), .k(k), .q(q));

    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial
    begin
        #2 reset = 1;
        #20 reset = 0; j=0;k=1;
        #20 j=1;k=1;
        #20 j=0;k=0;
        #20 j=1;k=0;
        #20 j=1;k=1;
    end

    initial
    begin
        $monitor("time=%d, clk=%b, reset = %b, j=%b, k=%b, q=%b",$time, clk, reset, j, k ,q);
        #200 $finish;
    end


endmodule
