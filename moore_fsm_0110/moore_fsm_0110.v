// Code your design here
`timescale 1ns / 1ns
//0110 overlapping moore fsm
module fsm_moore_0110(clk, reset, x, z);
    input clk, reset, x;
    output  reg  z;

    parameter s0 = 3'd0;
    parameter s1 = 3'd1;
    parameter s2 = 3'd2;
    parameter s3 = 3'd3;
    parameter s4 = 3'd4;

  reg [2:0] PS,NS; //as it requires 5 states 

  //ff logic to get present state 
    always@(posedge clk ) begin
        if(reset) PS <= s0;
        else PS <= NS;
    end

  //combinational block to get the next state, based on present state and present input 
    always@(x,PS) begin
        case(PS)
            s0: begin
                NS = x ? s0 : s1;
                //z <= x ? 0 : 0;
            end
            s1: begin
                NS = x ? s2 :s1;
                //z <= x ? 0 :0;
            end
            s2:  begin
                NS = x ? s3 :s1;
                //z <= x ? 0 :0;
            end
            s3: begin
                NS = x ? s0 :s4;
                //z <= x ? 0 :0;
            end
            s4: begin
                NS = x ? s2 :s1;
                //z <= x ? 1: 1;
            end
            default: NS = s0;
        endcase
    end

  //combinational block for output value, in case of moore depends only on the present state
     always@(PS) begin
         if (PS == s4) z = 1'b1;
         else z = 1'b0;
     end

 // assign z = (PS==s4) ? 1 :0;



endmodule
