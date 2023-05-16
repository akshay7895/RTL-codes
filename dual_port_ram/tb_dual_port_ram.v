`timescale 1ns/1ps

module tb_dual;

reg  [7:0] mem [15:0];
reg clk, rd_en, wr_en,cs,reset;
reg [3:0]wr_addr,rd_addr;
reg [7:0]wr_data;
wire [7:0]rd_data;
integer j,k;
dual_port_ram dut(.clk(clk), .reset(reset), .cs(cs), .rd_en(rd_en),  .wr_en(wr_en), .wr_addr(wr_addr), .rd_addr(rd_addr), .wr_data(wr_data), .rd_data(rd_data));
 
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      initialize;
      #2 t_reset;
      #5 write;
      #12 read;
    end
  
  initial
    begin
      
      $monitor("time=%d,clk=%b, cs=%b, rd_en=%b, wr_en=%b,wr_addr=%d,rd_addr=%d ,wr_data=%d, rd_data=%d , reset=%b",$time,clk,cs, rd_en, wr_en,wr_addr,rd_addr,wr_data, rd_data , reset);
      #500 $finish;
    end
  
  task initialize;
    begin
      cs <= 0; 
      rd_en<=0; 
      wr_en<=0; 
      wr_addr<=0; 
      rd_addr<=0;
      wr_data<=0; 
      reset<=0;
    end
  endtask
      
      task t_reset;
        begin
          @(negedge clk) reset <= 1;
          @(negedge clk) reset <= 0;
        end
      endtask
      
  task write;
    begin
      wr_en <= 1;
      rd_en <= 0;
      cs <= 1;
      for (j=0;j<15;j=j+1) begin
        wr_addr <= j;
        wr_data <= {$random} % 100;
        #12;
      end
    end
  endtask
      
    task read;
      begin
        rd_en <= 1;
        wr_en <= 0;
        cs <= 1;
        for(k=0;k<15;k=k+1) begin
          rd_addr <= k;
          #12;
        end
      end
    endtask
 
endmodule
  
