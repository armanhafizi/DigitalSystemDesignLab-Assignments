module incubator(clk, temp, heater, cooler, CRS);
	input clk;
	input signed [7:0] temp;
	output reg heater, cooler;
	output reg [4:0] CRS;
	reg [2:0] state;
	
	initial state = 0;
	
	always @(posedge clk)
	begin
		case(state)
			0: //Idle
			begin
				cooler = 0;
				heater = 0;
				CRS = 0;
				if(temp < 15)
				begin
					state = 1;
				end
				if(temp > 35)
				begin
					state = 2;
				end
			end
			1: //Heater ON
			begin
				cooler = 0;
				heater = 1;
				CRS = 0;
				if(temp > 30)
				begin
					state = 0;
				end
			end
			2: //Cooler ON: 4RPS
			begin
				heater = 0;
				cooler = 1;
				CRS = 4;
				if(temp < 25)
				begin
					state = 0;
				end
				if(temp > 40)
				begin
					state = 3;
				end
			end
			3: //Cooler ON: 6RPS
			begin
				heater = 0;
				cooler = 1;
				CRS = 6;
				if(temp < 35)
				begin
					state = 2;
				end
				if(temp > 45)
				begin
					state = 4;
				end
			end
			4: //Cooler ON: 8RPS
			begin
				heater = 0;
				cooler = 1;
				CRS = 8;
				if(temp < 40)
				begin
					state = 3;
				end
			end
		endcase
	end
	
endmodule
