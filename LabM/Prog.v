module tester;
wire[31:0] z;
wire[1:0] zero;
reg[31:0] rd1, rd2, imm;
reg[2:0] op;
reg ALUSrc;
integer i;

yEX my_yEX(z, zero, rd1, rd2, imm, op, ALUSrc);

initial
begin
	rd1 = 15;
	rd2 = 15;
	imm = 15;
	ALUSrc = 1;
	for (i = 0; i < 8; i = i + 1)
	begin
		op = i;
		#1
		$display("z=%d zero[0]=%b zero[1]=%b", z, zero[0], zero[1]);
	end

end
endmodule


/*
In this exercise you are asked to modify this module (and any module on which it depends) so that zero becomes 2-bit wide instead of 1-bit. Set the least significant bit of this signal (i.e. zero[0]) so it acts as a zero flag (as before) and set its most significant bit (i.e. zero[1]) so it acts as an even flag. These two flags are defined below.

The zero flag should be 1 if the output z is zero and should be 0 otherwise.
*/
