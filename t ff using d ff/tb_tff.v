`timescale 1ns/1ps

module tb_dff();
    reg t, clk, reset;
    wire q, qbar;

    tff dut(.t(t), .clk(clk), .reset(reset), .q(q), .qbar(qbar));

    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial
    begin
        reset = 1;
        t = 0;
        #15 reset = 0;
        #10;
        #20 t =1;
        #20 t = 0;
        #100 $finish;
        $monitor("time=%d, t = %b , q = %b, reset = %b, clk = %b", $time, t,q,reset,clk);
    end
endmodule
