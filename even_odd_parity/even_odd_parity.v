`timescale 1ns / 1ps

module even_odd_parity(x, clk, z);
    input x, clk;
    output reg z;
    reg even_odd; //the FSM state
    parameter EVEN = 0, ODD = 1;

    always@(posedge clk) begin
        case(even_odd)
            EVEN:
            begin
                even_odd <= x?ODD:EVEN;
            end
            ODD:
            begin
                even_odd <= x?EVEN:ODD;
            end
            default: even_odd <= EVEN; //assume for reset it is EVEN state
        endcase
        end
        always@(even_odd) begin
        case(even_odd)
        EVEN: z = 0;
        ODD: z = 1;
        endcase
        end
        
        
endmodule
