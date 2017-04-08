module tester;
wire signed[31:0] z;
reg signed[31:0] a;
reg flag;

Engine engine1(z, a);

initial
begin
	flag = $value$plusargs("a=%d", a);
	#1
	$display("a=%d z=%d", a, z);
end
endmodule