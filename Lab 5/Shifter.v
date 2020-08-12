module Shifter(input[10: 0] in, output reg[10: 0] out, input en);
	always @(en)
	begin
		out = in >> 1;
		out[10] = in[10];
	end
endmodule