module tester;
wire z;
reg[1:0] a, b;
reg flag;

Engine engine1(z, a, b);

initial
begin
	flag = $value$plusargs("a=%d", a);
	flag = $value$plusargs("b=%d", b);
	#1
	$display("a=%b b=%b z=%b", a, b, z);
end
endmodule