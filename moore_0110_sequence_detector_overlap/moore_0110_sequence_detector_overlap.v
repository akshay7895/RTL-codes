`timescale 1ns / 1ps
//0110 overlapping moore fsm
module moore_fsm(clk, reset, x, z);
    input clk, reset, x;
    output reg z;

    parameter s0 = 3'd0;
    parameter s1 = 3'd1;
    parameter s2 = 3'd2;
    parameter s3 = 3'd3;
    parameter s4 = 3'd4;

    reg [1:0] PS,NS;

    always@(posedge clk ) begin
        if(reset) PS <= s0;
        else PS <= NS;
    end

    always@(x,PS) begin
        case(PS)
            s0: begin
                NS <= x ? s0 : s1;
                //z <= x ? 0 : 0;
            end
            s1: begin
                NS <= x ? s2 :s1;
                //z <= x ? 0 :0;
            end
            s2:  begin
                NS <= x ? s3 :s1;
                //z <= x ? 0 :0;
            end
            s3: begin
                NS <= x ? s0 :s4;
                //z <= x ? 0 :0;
            end
            s4: begin
                NS <= x ? s2 :s1;
                //z <= x ? 1: 1;
            end
            default: NS <= s0;
        endcase
    end

    always@(PS) begin
        if (PS == s4) z <= 1'b1;
        else z <= 1'b0;
    end




endmodule
