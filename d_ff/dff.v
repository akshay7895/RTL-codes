module dff(input d, clk, reset, output reg q, qbar);
  always@(posedge clk)
    begin
      if(reset) begin
        q <= 0;
        qbar <= 1;
      end
      else
        begin
          q <= d;
          qbar <= ~d;
        end
    end
endmodule
