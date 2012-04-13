`include "timescale.v"

module top();

	// --------------------------------------------------
	// Wishbone common signal
	// --------------------------------------------------
	wire	WB_CLK	;
	wire	WB_RESET;
	
	// --------------------------------------------------
	// Wishbone signal
	// --------------------------------------------------
	wire	[31:0]	WB_ADDR		;
	wire	[31:0]	WB_DATA_IN	;		// Master side direction
	wire	[31:0]	WB_DATA_OUT	;		// Master side direction
	wire			WB_WE		;
	wire	[3:0]	WB_SEL		;
	wire			WB_STB		;
	wire			WB_ACK		;
	wire			WB_CYC		;
	wire			WB_ERR		;
	wire			WB_RTY		;	

	// simple wishbone syscon model
	wb_simple_syscon Uwb_simple_syscon(
		  .clk	(WB_CLK		) 
		, .rst	(WB_RESET	) 
	);

	// --------------------------------------------------
	// Wishbone master model
	// --------------------------------------------------
	wb_mast Uwb_master0(
		  .clk	(WB_CLK		) 
		, .rst	(WB_RESET	) 

		, .adr	(WB_ADDR	) 
		, .din	(WB_DATA_IN	) 
		, .dout	(WB_DATA_OUT) 
		, .we	(WB_WE		) 
		, .sel	(WB_SEL		) 
		, .stb	(WB_STB		) 
		, .ack	(WB_ACK		) 
		, .cyc	(WB_CYC		) 
		, .err	(WB_ERR		) 
		, .rty	(WB_RTY		)
	);

	// --------------------------------------------------
	// Wishbone Xilinx BRAM controller
	// --------------------------------------------------
	wb_xilinx_bram Uwb_xilinx_bram (
		  .clk	(WB_CLK		) 
		, .rst	(WB_RESET	) 

		, .adr	(WB_ADDR	[15:0]) 
		, .din	(WB_DATA_OUT[15:0]) 
		, .dout	(WB_DATA_IN	[15:0]) 
		, .we	(WB_WE		) 
		, .sel	(WB_SEL		[ 1:0]) 
		, .stb	(WB_STB		) 
		, .ack	(WB_ACK		) 
		, .cyc	(WB_CYC		) 
		, .err	(WB_ERR		) 
		, .rty	(WB_RTY		)
	);
	assign WB_DATA_IN[31:16] = 'h0;

	// --------------------------------------------------
	// Testbench
	// --------------------------------------------------
	reg [31:0] rdata0;
	reg [31:0] wdata0;
	reg [31:0] addr0;
	reg [ 4:0] s;

	initial begin
		wait(WB_RESET == 1'b0);
		wait(WB_RESET == 1'b1);

		#200 $display("testbench start");
		#200 $display("\ntestbench write 1 word test");
		s = 4'b1111;	
		addr0 = 32'h0000_0000;
		wdata0 = 32'h0000_DEAD;

		Uwb_master0.wb_wr1(addr0, s, wdata0);
		$display("write [0x%08x] : 0x%08x", addr0, wdata0);

		Uwb_master0.wb_rd1(addr0, s, rdata0);
		$display("read [0x%08x] : 0x%08x", addr0, rdata0);

		#300 $finish;
	end


	// --------------------------------------------------
	initial begin
		$dumpfile("sim.vcd");
		$dumpvars(0);
	end
	// --------------------------------------------------
endmodule
