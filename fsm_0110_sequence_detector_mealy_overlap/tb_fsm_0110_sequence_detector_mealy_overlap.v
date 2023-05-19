`timescale 1ns / 1ns

module tb_fsm;
    reg clk, reset, x;
    wire z;

    reg [1:0] NS,PS;

    // parameter s0 =0; //0
    // parameter s1 =1; //01
    // parameter s2 =2; //011
    // parameter s3 =3; //0110

    fsm dut (.clk(clk), .reset(reset), .x(x), .z(z));

    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial
    begin
        rst;
        #20;
        stim;
        #300;
        $finish;
    end

    initial
    begin
        $monitor("time=%d,clk=%b, reset=%b, x=%b, z=%b",$time,clk,reset,x,z);
    end

    task rst;
        begin
            reset = 0;
            @(negedge clk ) reset = 1;
            @(negedge clk ) reset = 0;
        end
    endtask

    task stim;
        begin
            x=0; #10 x=1; #10 x=1; #10 x=0;
            #10 x=1; #10 x=1; #10 x=0;
        end
    endtask

endmodule
