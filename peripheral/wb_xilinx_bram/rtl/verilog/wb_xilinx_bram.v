

module wb_xilinx_bram (
	// ----------------------------
	// 16Bit Wishbone interface
	// ----------------------------
	  input		wire				clk
	, input		wire				rst
	, input		wire	[15:0]		adr
	, input		wire	[15:0]		din
	, output	reg		[15:0]		dout
	, input		wire				cyc
	, input		wire				stb
	, input		wire	[1:0]		sel
	, input		wire				we
	, output	reg					ack
	, output	reg					err
	, output	reg					rty
);

	// --------------------------
	// Internal signals
	// --------------------------
	wire 		bram_clk	;
	reg  [15:0]	bram_addra	;
	wire [15:0]	bram_dout	;		// bram side outout
	reg  [15:0]	bram_din	;		// bram side input
	reg  [ 1:0]	bram_wea	;

	assign bram_clk = clk;
	
	// --------------------------
	// 16Bit xilinx bram
	// --------------------------
	blk_mem64k Ublk_mem (
		  .clka		(bram_clk	)
		, .wea		(bram_wea	)
		, .addra	(bram_addra[14:0])
		, .dina		(bram_din	)
		, .douta	(bram_dout	)
	);

	// --------------------------
	// Wishbone interface logic
	// --------------------------
	reg [3:0] state;
	parameter 	STW_IDLE	= 3'b001,
				STW_READ	= 3'b010,
				STW_DONE	= 3'b100;
	always @(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			ack		<= 1'b0;
			rty		<= 1'b0;
			err		<= 1'b0;
			dout	<= 16'h0;	

			state	<= STW_IDLE;

			bram_addra 	<= 16'h0;
			bram_din	<= 16'h0;
			bram_wea	<= 2'h0;
		end else begin
			case(state)
			STW_IDLE: begin
				if(cyc & stb & we) begin			// write cycle
					bram_addra 	<= adr;
					bram_din	<= din;
					bram_wea	<= sel;

					ack			<= 1'b1;
					state		<= STW_DONE;
				end else if(cyc & stb & !we) begin	// read cycle
					bram_addra 	<= adr;
					bram_wea	<= 2'h0;
					state		<= STW_READ;
				end else begin						// idle cycle
					ack		<= 1'b0;
					dout	<= 16'h0;	

					bram_addra 	<= 16'h0;
					bram_din	<= 16'h0;
					bram_wea	<= 2'h0;
				end
			end
			STW_READ: begin
				dout	<= bram_dout;
				ack		<= 1'b1;
				state	<= STW_DONE;
			end
			STW_DONE: begin
				ack		<= 1'b0;
				dout	<= 16'h0;
				state	<= STW_IDLE;
			end
			endcase
		end
	end
endmodule
