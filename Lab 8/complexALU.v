module ComplexALU(
	input wire[14:0] inst,
	input wire clk,
	input wire reset,//it will work if the reset is one
	output reg [3:0] realAns,//the real part of the answer will be shown here
	output reg [3:0] imageAns//the imaginary part of the answer is shown here
);

reg [7:0] mem [15:0];//it is the memory which every record is 8 bit(a byte) and we have 16 byte in our memory
wire [3:0] addReal;//result of the adder component, real part
wire [3:0] addImage;//result of the adder component, imaginary part
wire [3:0] multReal;//result of the adder component, real part
wire [3:0] multImage;//result of the adder component, imaginary part

Adder adder(
	mem[inst[11:8]][7:4],//mem[src1].real
	mem[inst[11:8]][3:0],//mem[src1].image
	mem[inst[7:4]][7:4],//mem[src2].real
	mem[inst[7:4]][3:0],//mem[src2].image
	inst[12],//1 : sub, 0 : add
	addReal[3:0],//ans.real
	addImage[3:0]//ans.image
);

Mult multiplier(
	mem[inst[11:8]][7:4],//mem[src1].real
	mem[inst[11:8]][3:0],//mem[src1].image
	mem[inst[7:4]][7:4],//mem[src2].real
	mem[inst[7:4]][3:0],//mem[src2].image
	multReal[3:0],//ans.real
	multImage[3:0]//ans.image
);


always @(posedge clk)
begin
	if(reset) begin
		mem[0] <= 8'b00000000;
		mem[1] <= 8'b00000000;
		mem[2] <= 8'b00000000;
		mem[3] <= 8'b00000000;
		mem[4] <= 8'b00000000;
		mem[5] <= 8'b00000000;
		mem[6] <= 8'b00000000;
		mem[7] <= 8'b00000000;
		mem[8] <= 8'b00000000;
		mem[9] <= 8'b00000000;
		mem[10] <= 8'b00000000;
		mem[11] <= 8'b00000000;
		mem[12] <= 8'b00000000;
		mem[13] <= 8'b00000000;
		mem[14] <= 8'b00000000;
		mem[15] <= 8'b00000000;
	end
	else begin
	if(inst[14:12] == 3'b000) begin
		realAns[3:0] <= mem[inst[3:0]][7:4];
		imageAns[3:0] <= mem[inst[3:0]][3:0];
	end
	else if(inst[14:12] == 3'b001) begin
		mem[inst[3:0]][3:0] <= inst[7:4];
		mem[inst[3:0]][7:4] <= inst[11:8];
	end
	else if(inst[14:12] == 3'b010) begin
		mem[inst[3:0]][7:4] <= addReal[3:0];
		mem[inst[3:0]][3:0] <= addImage[3:0];
	end
	else if(inst[14:12] == 3'b011) begin
		mem[inst[3:0]][7:4] <= addReal[3:0];
		mem[inst[3:0]][3:0] <= addImage[3:0];
	end
	else if(inst[14:12] == 3'b100) begin
		mem[inst[3:0]][7:4] <= multReal[3:0];
		mem[inst[3:0]][3:0] <= multImage[3:0];
	end
	end
end


endmodule



