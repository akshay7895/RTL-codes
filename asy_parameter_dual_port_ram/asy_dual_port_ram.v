`timescale 1ns / 1ps

module asy_dual_port_ram(reset,wr_data,wr_en,rd_en,wr_addr,rd_addr,rd_data );
    parameter ADDR_SIZE = 4;
    parameter DATA_SIZE = 8;
    //we can use <localparam MEMORY_SIZE = 2**ADDR_SIZE> also for defining the memory size;
    input reset, wr_en, rd_en;
    input [ADDR_SIZE-1:0] wr_addr;
    input [DATA_SIZE-1:0] wr_data;
    input [ADDR_SIZE-1:0] rd_addr;
    output reg [DATA_SIZE-1:0] rd_data;
    integer i;

    reg [DATA_SIZE-1:0]mem[2**ADDR_SIZE-1:0];

    always@(*) begin
        if(reset) begin
            for(i=0;i<2**ADDR_SIZE-1;i=i+1) begin
                mem[i] = 0;
            end
        end
        else if(wr_en && !rd_en) begin
            mem[wr_addr] = wr_data;
        end
        else if (!wr_en && rd_en) begin
            rd_data = mem[rd_addr];
        end
    end

endmodule
