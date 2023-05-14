`timescale 1ns/1ps

module tff(input t, clk, reset, output q, qbar);

    wire tmp;
    wire op,op1;
    assign tmp = t^q;
    dff dut (.d(tmp), .clk(clk), .reset(reset), .q(op), .qbar(op1));
    assign q = op;
    assign qbar = op1;
endmodule

module dff(input d, clk, reset, output reg q, qbar);
    always@(posedge clk)
    begin
        if(reset) begin
            q <= 0;
            qbar <= 1;
        end
        else
            begin
                q <= d;
                qbar <= ~d;
            end
    end
endmodule
