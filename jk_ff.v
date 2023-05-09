module tb_try;
reg j,k,clk,rst,prst;
wire q,qbar;

try dut (.j(j),.k(k),.clk(clk),.rst(resetn),.prst(presetn),.q(q),.qbar(qbar));

initial 
begin
clk=1'b0;
forever #10 clk = ~clk;
end

initial
begin
