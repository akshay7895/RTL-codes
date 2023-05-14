`timescale 1ns / 1ps

module full_adder( a, b, cin,  sum, cout);
    parameter SIZE = 8; //can modify depending upon our need
    input [SIZE-1:0]a,b;
    output  [SIZE-1:0] sum;
    input cin;
    output  cout;
    genvar i; //this variable for generate block only 
    wire [SIZE-2:0]w; //the wire here needed 1 bit less then the inputs and outputs 

    fa fa0(a[0], b[0], cin, sum[0], w[0]); //first fa 

    generate for (i=1;i<SIZE-1;i=i+1) //to geenrate the many fa blocks
        begin: ripple
            fa fa1(a[i], b[i], w[i-1], sum[i], w[i]);
        end
    endgenerate

    fa fa2 (a[SIZE-1], b[SIZE-1], w[SIZE-2], sum[SIZE-1], cout); //last fa

endmodule

module fa(input a,b,cin,output reg sum,cout);
    always@(*)
    begin
        sum = a^b^cin;
        cout = a*b + b*cin + cin*a;
    end
endmodule
