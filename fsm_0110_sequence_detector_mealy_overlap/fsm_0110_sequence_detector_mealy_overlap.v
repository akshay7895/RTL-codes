`timescale 1ns / 1ns
// Code your design here
module fsm(clk, reset, x, z);
    input clk, reset, x;
    output reg z;

    reg [1:0]NS, PS;

    parameter [1:0]s0 =0; //0
    parameter [1:0]s1 =1; //01
    parameter [1:0]s2 =2; //011
    parameter [1:0]s3 =3; //0110

    always@(posedge clk) begin
        if(reset) PS <= s0;
        else
            PS <= NS;
    end

    always@(x,PS) begin
        case(PS)
            s0: begin
                NS = (x==0)?s1:s0;
                z = x?0:0;
            end

            s1: begin
                NS = (x==1)?s2:s1;
                z = x?0:0;
            end

            s2: begin
                NS = (x==1)?s3:s1;
                z = x?0:0;
            end

            s3: begin
                NS = (x==0)?s1:s0;
                z = x?0:1;
            end

            default: begin
                NS = s0;
                z = 0;
            end

        endcase
    end
endmodule
