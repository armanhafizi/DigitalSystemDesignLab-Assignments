module ControlUnit(input P, Q, en, output reg[1:0] operation);
always @(en)
begin
	operation = (P == Q) ? 2'b00 : (P == 1'b0) ? 2'b01 : 2'b10;
end
endmodule