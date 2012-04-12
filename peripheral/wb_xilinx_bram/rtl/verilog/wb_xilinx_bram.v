

module wb_xilinx_bram (
	// ----------------------------
	// 16Bit Wishbone interface
	// ----------------------------
	  input		wire				clk
	, input		wire				rst
	, input		wire	[16:0]		adr
	, input		wire	[16:0]		din
	, output	reg		[16:0]		dout
	, input		wire				cyc
	, input		wire				stb
	, input		wire	[1:0]		sel
	, input		wire				we
	, output	reg					ack
	, output	reg					err
	, output	reg					rty
);

	// Internal wire
	wire bram_clk = clk;
	
	// --------------------------
	// 16Bit xilinx bram
	// --------------------------
endmodule
