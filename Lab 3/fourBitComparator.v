module fourBitComparator(input [3:0] a, b,
			 output aBigger, equal, bBigger);
	wire [3:0] barabar, aBig, bBig;
	oneBitComparator four(.a(a[3]), .b(b[3]), .aBigger(aBig[3]), 
			      .equal(barabar[3]), .bBigger(bBig[3]));
	oneBitComparator three(.a(a[2]), .b(b[2]), .aBigger(aBig[2]), 
			      .equal(barabar[2]), .bBigger(bBig[2]));
	oneBitComparator two(.a(a[1]), .b(b[1]), .aBigger(aBig[1]), 
			      .equal(barabar[1]), .bBigger(bBig[1]));
	oneBitComparator one(.a(a[0]), .b(b[0]), .aBigger(aBig[0]), 
			      .equal(barabar[0]), .bBigger(bBig[0]));

	assign aBigger = (aBig[3]) | (barabar[3] & aBig[2]) | (barabar[3] & barabar[2] & aBig[1]) 
			| (barabar[3] & barabar[2] & barabar[1] & aBig[0]);
	assign equal = (barabar[3] & barabar[2] & barabar[1] & barabar[0]);
	assign bBigger = ~(aBigger | equal);
endmodule