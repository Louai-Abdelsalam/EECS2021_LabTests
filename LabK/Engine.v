module Engine(z, a, b);
output z;
input[1:0] a, b;
wire c, notC, and1, and2, z1, z2;

assign z1 = b[0];
rm rm1(z2, a, b);

and and0(c, a[0], a[1]);
not not1(notC, c);

and upperAnd(and2, z2, notC);
and lowerAnd(and1, z1, c);
or or1(z, and1, and2);
endmodule