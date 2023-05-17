`timescale 1ns / 1ps

module tb_asy_dual_port_ram;

    parameter ADDR_SIZE = 4;
    parameter DATA_SIZE = 8;

    reg reset,wr_en,rd_en;
    reg [ADDR_SIZE-1:0]wr_addr;
    reg [DATA_SIZE-1:0] wr_data;
    reg [ADDR_SIZE-1:0]rd_addr;
    wire [DATA_SIZE-1:0] rd_data;
    integer j,k;

    asy_dual_port_ram dut (.reset(reset), .wr_data(wr_data), .wr_en(wr_en), .rd_en(rd_en), .wr_addr(wr_addr), .rd_addr(rd_addr), .rd_data(rd_data));

    initial
    begin
        rst;
        #20;
        write;
        #20;
        read;
        #20;
        $finish;
    end


    initial
    begin
        $monitor("time=%d, rd_en=%b, wr_en=%b,wr_addr=%d,rd_addr=%d ,wr_data=%d, rd_data=%d , reset=%b",$time, rd_en, wr_en,wr_addr,rd_addr,wr_data, rd_data , reset);
    end

    task write;
        begin
            wr_en=1; rd_en =0;
            for(k=0;k<2**ADDR_SIZE-1;k=k+1) begin
                wr_addr = k; wr_data = {$random} %100;
                #5;
            end
        end
    endtask

    task read;
        begin
            rd_en = 1; wr_en = 0;
            for(j=0;j<2**ADDR_SIZE-1;j=j+1) begin
                rd_addr = j;
                #5;
            end
        end
    endtask

    task rst;
        begin
            reset=1;
            #10 reset =0;
        end
    endtask



endmodule
