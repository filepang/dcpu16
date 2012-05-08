`include "timescale.v"

module top();

	// --------------------------------------------------
	// Wishbone common signal
	// --------------------------------------------------
	wire	WB_CLK	;
	wire	WB_RESET;

	// simple wishbone syscon model
	wb_simple_syscon Uwb_simple_syscon(
		  .clk	(WB_CLK		) 
		, .rst	(WB_RESET	) 
	);

	// --------------------------------------------------
	// Wishbone master model x 4
	// --------------------------------------------------

	// --------------------------------------------------
	// Wishbone shared bus 4x8
	// --------------------------------------------------

	// --------------------------------------------------
	// Wishbone Xilinx BRAM controller x 8
	// --------------------------------------------------

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
