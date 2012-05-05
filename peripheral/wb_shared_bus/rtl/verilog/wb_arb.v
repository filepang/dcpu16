
module wb_arb (
	  input		wire			clk
	  input		wire			rst
	, input		wire	[3:0]	request
	, output	wire	[3:0]	grant
);
	// ----------------------------
	// parameter
	// ----------------------------
	parameter [3:0]	grant0 = 4'b0001,
					grant1 = 4'b0010,
					grant2 = 4'b0100,
					grant3 = 4'b1000;

	reg [3:0] state;
	assign grant = state;

	// ----------------------------
	// general round robin arbiter
	// ----------------------------
	always @(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			state <= grant0;
		end else begin
			case(state)

			grant0: begin
				if(request[0] != 1'b1) begin
					if(request[1] == 1'b1) state <= grant1;
					else if(request[2] == 1'b1) state <= grant2;
					else if(request[3] == 1'b1) state <= grant3;
				end
			end		// grant0

			grant1: begin
				if(request[1] != 1'b1) begin
					if(request[2] == 1'b1) state <= grant2;
					else if(request[3] == 1'b1) state <= grant3;
					else if(request[0] == 1'b1) state <= grant0;
				end
			end		// grant1

			grant2: begin
				if(request[2] != 1'b1) begin
					if(request[3] == 1'b1) state <= grant3;
					else if(request[0] == 1'b1) state <= grant0;
					else if(request[1] == 1'b1) state <= grant1;
				end
			end		// grant2

			grant3: begin
				if(request[3] != 1'b1) begin
					if(request[0] == 1'b1) state <= grant0;
					else if(request[1] == 1'b1) state <= grant1;
					else if(request[2] == 1'b1) state <= grant2;
				end
			end		// grant3

			endcase
		end
	end
endmodule

