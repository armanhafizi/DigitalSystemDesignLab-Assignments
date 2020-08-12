module stack(Data_Out, Full, Empty, clk, RstN, Data_In, Push, Pop);
output reg[3:0] Data_Out;
output reg Full, Empty;
input clk, RstN, Push, Pop;
input wire[3:0] Data_In;
reg[3:0] stack [7:0];
reg[2:0] head = 3'b0;
reg[3:0] used = 4'b0;

parameter SIZE = 8;

always @(posedge clk or negedge RstN)
begin
	if (RstN == 1'b0)
	begin
		head = 3'b0;
		used = 4'b0;
		Empty = 1'b1;
		Full = 1'b0;
		Data_Out = 4'b0;
	end
	else
	begin
		if (Full == 1'b0)
		begin
			if (Push == 1'b1)
			begin
				stack[head] = Data_In;
				head = head + 1;
				used = used + 1;
			end
		end
		if (Empty == 1'b0)
		begin
			if (Pop == 1'b1)
			begin
				Data_Out = stack[head-1];
				head = head - 1;
				used = used - 1;
			end
		end
		if (used >= SIZE)
		begin
			Full = 1'b1;
		end
		else
		begin
			Full = 1'b0;
		end
		if (used <= 0)
		begin
			Empty = 1'b1;
		end
		else
		begin
			Empty = 1'b0;
		end
	end
end
endmodule