`timescale 1ns / 1ps

module jk_ff(input j,k,clk,reset, output reg q );
    parameter HOLD=2'b00;
    parameter RESET=2'b01;
    parameter SET=2'b10;
    parameter TOGGLE=2'b11;


    always@(posedge clk) begin
        if (reset) begin
            q <= 0;
        end
        else
            begin
                case({j,k})
                    HOLD: q<= q;
                    RESET: q<= 0;
                    SET: q<= 1;
                    TOGGLE: q<= ~q;
                endcase
            end
    end
endmodule
