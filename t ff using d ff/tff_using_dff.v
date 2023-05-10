`timescale 1ns / 1ps

module tff_using_dff( input t, reset, clk, output  q, output qbar);
    wire tmp;
    assign tmp = t ^ q;

    dff dut (.data(tmp), .reset(reset), .clk(clk), .q(q), .qbar(qbar));


endmodule

module dff (input data, reset, clk, output reg q, output qbar);

    always@(posedge clk)
    begin
        if(reset)
            q <= 0;
        else
            q <= data;
    end

    assign qbar = ~q;
endmodule
