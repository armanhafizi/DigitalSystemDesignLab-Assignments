module BoothMultiplier(input clk, rst, input[4: 0] cand, ier, output[10: 0] R, output valid);
	reg [4:0] AC = 0, QR = 0;
	reg [2:0] counter = 6;
	reg Qn = 0, sh_en = 0, op_en = 0;
	wire [1:0] op;
	reg [1:0] opr;
	wire [10:0] all;
	ControlUnit(QR[0], Qn, op_en, op);
	Shifter({AC, QR, Qn}, all, sh_en);
	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			AC = 0;
			QR = ier;
			Qn = 0;
			counter = 6;
			sh_en = 0;
			op_en = 0;
		end
		else
		if(counter != 0)
		begin
			if(counter != 6)
			begin
				sh_en = 1;
				sh_en = 0;
				{AC, QR, Qn} = all;
			end
			op_en = 1;
			op_en = 0;
			opr = op;
			if(opr == 2'b01)
			begin
				AC = AC + cand;
			end
			if(opr == 2'b10)
			begin
				AC = AC - cand;
			end
			counter = counter - 1;
		end
	end
	assign R = all;
	assign valid = (counter == 0);
endmodule