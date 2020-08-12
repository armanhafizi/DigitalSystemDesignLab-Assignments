module oneBitComparator(input a, b,
			output aBigger, equal, bBigger);
	assign aBigger = (a > b);
	assign bBigger = (b > a);
	assign equal = (a == b);
endmodule	