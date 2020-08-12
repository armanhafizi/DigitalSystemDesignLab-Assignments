module PC(input clk,
	  input reset,
	  output [3:0]realPart,
	  output [3:0]imagePart,
	  output reg [3:0]pc
	 );

reg [14:0] mem [15:0];
ComplexALU alu(
	mem[pc[3:0]][14:0],
	clk,
	reset,
	realPart[3:0],
	imagePart[3:0]
	);

always @(posedge clk)
begin
	if(reset) begin
		pc[3:0] <= 4'b0000;
		mem[0] <= 15'b001_0001_0010_0001;//load 1+2i to R1
		mem[1] <= 15'b001_0010_0010_0010;//load 2+2i to R2
		mem[2] <= 15'b000_0000_0000_0001;//show R1
		mem[3] <= 15'b000_0000_0000_0010;//show R2
		mem[4] <= 15'b010_0001_0010_0011;//R1+R2->R3
		mem[5] <= 15'b100_0001_0010_0100;//R1*R2->R4
		mem[6] <= 15'b000_0000_0000_0011;//show R3
		mem[7] <= 15'b000_0000_0000_0100;//show R4
		mem[8]  <= 15'b0000000000000;
		mem[9]  <= 15'b0000000000000;
		mem[10] <= 15'b0000000000000;
		mem[11] <= 15'b0000000000000;
		mem[12] <= 15'b0000000000000;
		mem[13] <= 15'b0000000000000;
		mem[14] <= 15'b0000000000000;
		mem[15] <= 15'b0000000000000;
	end
	else begin
		pc <= pc+1;
	end
end
endmodule

