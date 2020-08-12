module Adder(
	input wire [3:0] real1,
	input wire [3:0] image1,
	input wire [3:0] real2,
	input wire [3:0] image2,
	input wire add_sub,
	output wire [3:0] realResult,
	output wire [3:0] imageResult);

	
assign realResult[3:0] = add_sub?(real1 - real2):(real1+real2);
assign imageResult[3:0] = add_sub?(image1 - image2):(image1+image2);

endmodule

