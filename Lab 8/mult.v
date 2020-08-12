module Mult(
	input wire [3:0] real1,
	input wire [3:0] image1,
	input wire [3:0] real2,
	input wire [3:0] image2,
	output wire [3:0] realResult,
	output wire [3:0] imageResult);

assign realResult[3:0] = (real1*real2 - image1*image2);
assign imageResult[3:0] = (image1 * real2 + image2*real1);

endmodule

