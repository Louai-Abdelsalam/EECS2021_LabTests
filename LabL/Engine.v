module Engine(z, a);
output [31:0] z;
input [31:0] a;
wire [31:0] b;
wire cout, cin;

assign cin = 0;
assign b[0] = 0;
assign b[31:1] = a[30:0];
yAdder adder(z, cout, a, b, cin);

endmodule
