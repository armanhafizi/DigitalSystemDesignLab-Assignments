module serialComparator(input clk, a, b, reset,
			output aBigger, equal, bBigger);
	assign aBigger = clk ? ( ~reset & ( (a > b) | ( aBigger & (a == b)) ) ) : aBigger;
	assign eqaul = clk ? (~reset & ( (a == b) & equal)) : equal;
	assign bBigger = clk? (~reset & ( ~(aBigger | equal))) : bBigger;
endmodule