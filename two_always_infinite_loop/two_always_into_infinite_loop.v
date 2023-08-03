// Code your design here
`timescale 1ns/1ps 
module tb;
  reg c, e, d;
  initial begin
	 c = 1'b1;
  end
  
always@*
begin 
#2 
d = c;
#2 
d = ~c;
end

  //becasue of below always it will keep executing it whether e changes or not. goes into infinite loop (try to give always@* and see the difference in ouput)
always 
begin 
#2 
e = c;
#2 
e = ~c;
end
  initial $monitor("time=%d, d=%d, e=%d, c=%d",$time,d,e,c);
endmodule
