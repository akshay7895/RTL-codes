module new(output a,b);
  reg a=0;
  reg b =1;
  
  always@(*) begin
    b=a;
    
  end
  always@(*) begin
    a=b;
     end
  always@(*)
    $monitor("time=%d, a=%b, b=%b", $time, a,b);
endmodule
