`timescale 1ns / 1ps

module dual_port_ram( clk,cs, rd_en, wr_en,wr_addr,rd_addr,wr_data, rd_data , reset );
reg [7:0] mem [15:0];
input clk, rd_en, wr_en,cs,reset;
input [3:0]wr_addr,rd_addr;
input [7:0]wr_data;
output reg [7:0]rd_data;
integer i;
always@(posedge clk) begin
  if(reset) begin
    for( i=0;i<15;i=i+1) begin
      mem[i] <= 0;
    end
  end
  else if(cs & wr_en & !rd_en) 
mem[wr_addr] <= wr_data;
else if(cs & rd_en & !wr_en)
rd_data <= mem[rd_addr];
end
 
endmodule

