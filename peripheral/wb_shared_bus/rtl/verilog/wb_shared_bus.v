
module wb_shared_bus (
	  input				wire	clk_i
	, input				wire	rst_i

	// Master 0 Interface
	, input		[15:0]	wire	m0_adr_i
	, input		[15:0]	wire	m0_dat_i
	, output	[15:0]	wire	m0_dat_o
	, input				wire	m0_cyc_i
	, input				wire	m0_stb_i
	, input		[ 1:0]	wire	m0_sel_i
	, input				wire	m0_we_i
	, output			wire	m0_ack_o
	, output			wire	m0_err_o
	, output			wire	m0_rty_o

	// Master 1 Interface
	, input		[15:0]	wire	m1_adr_i
	, input		[15:0]	wire	m1_dat_i
	, output	[15:0]	wire	m1_dat_o
	, input				wire	m1_cyc_i
	, input				wire	m1_stb_i
	, input		[ 1:0]	wire	m1_sel_i
	, input				wire	m1_we_i
	, output			wire	m1_ack_o
	, output			wire	m1_err_o
	, output			wire	m1_rty_o

	// Master 2 Interface
	, input		[15:0]	wire	m2_adr_i
	, input		[15:0]	wire	m2_dat_i
	, output	[15:0]	wire	m2_dat_o
	, input				wire	m2_cyc_i
	, input				wire	m2_stb_i
	, input		[ 1:0]	wire	m2_sel_i
	, input				wire	m2_we_i
	, output			wire	m2_ack_o
	, output			wire	m2_err_o
	, output			wire	m2_rty_o

	// Master 3 Interface
	, input		[15:0]	wire	m3_adr_i
	, input		[15:0]	wire	m3_dat_i
	, output	[15:0]	wire	m3_dat_o
	, input				wire	m3_cyc_i
	, input				wire	m3_stb_i
	, input		[ 1:0]	wire	m3_sel_i
	, input				wire	m3_we_i
	, output			wire	m3_ack_o
	, output			wire	m3_err_o
	, output			wire	m3_rty_o

	// Slave 0 Interface
	, output	[15:0]	wire	s0_adr_o
	, input		[15:0]	wire	s0_dat_i
	, output	[15:0]	wire	s0_dat_o
	, output			wire	s0_cyc_o
	, output			wire	s0_stb_o
	, output	[ 1:0]	wire	s0_sel_o
	, output			wire	s0_we_o
	, input				wire	s0_ack_i
	, input				wire	s0_err_i
	, input				wire	s0_rty_i

	// Slave 1 Interface
	, output	[15:0]	wire	s1_adr_o
	, input		[15:0]	wire	s1_dat_i
	, output	[15:0]	wire	s1_dat_o
	, output			wire	s1_cyc_o
	, output			wire	s1_stb_o
	, output	[ 1:0]	wire	s1_sel_o
	, output			wire	s1_we_o
	, input				wire	s1_ack_i
	, input				wire	s1_err_i
	, input				wire	s1_rty_i

	// Slave 2 Interface
	, output	[15:0]	wire	s2_adr_o
	, input		[15:0]	wire	s2_dat_i
	, output	[15:0]	wire	s2_dat_o
	, output			wire	s2_cyc_o
	, output			wire	s2_stb_o
	, output	[ 1:0]	wire	s2_sel_o
	, output			wire	s2_we_o
	, input				wire	s2_ack_i
	, input				wire	s2_err_i
	, input				wire	s2_rty_i

	// Slave 3 Interface
	, output	[15:0]	wire	s3_adr_o
	, input		[15:0]	wire	s3_dat_i
	, output	[15:0]	wire	s3_dat_o
	, output			wire	s3_cyc_o
	, output			wire	s3_stb_o
	, output	[ 1:0]	wire	s3_sel_o
	, output			wire	s3_we_o
	, input				wire	s3_ack_i
	, input				wire	s3_err_i
	, input				wire	s3_rty_i

	// Slave 4 Interface
	, output	[15:0]	wire	s4_adr_o
	, input		[15:0]	wire	s4_dat_i
	, output	[15:0]	wire	s4_dat_o
	, output			wire	s4_cyc_o
	, output			wire	s4_stb_o
	, output	[ 1:0]	wire	s4_sel_o
	, output			wire	s4_we_o
	, input				wire	s4_ack_i
	, input				wire	s4_err_i
	, input				wire	s4_rty_i

	// Slave 5 Interface
	, output	[15:0]	wire	s5_adr_o
	, input		[15:0]	wire	s5_dat_i
	, output	[15:0]	wire	s5_dat_o
	, output			wire	s5_cyc_o
	, output			wire	s5_stb_o
	, output	[ 1:0]	wire	s5_sel_o
	, output			wire	s5_we_o
	, input				wire	s5_ack_i
	, input				wire	s5_err_i
	, input				wire	s5_rty_i

	// Slave 6 Interface
	, output	[15:0]	wire	s6_adr_o
	, input		[15:0]	wire	s6_dat_i
	, output	[15:0]	wire	s6_dat_o
	, output			wire	s6_cyc_o
	, output			wire	s6_stb_o
	, output	[ 1:0]	wire	s6_sel_o
	, output			wire	s6_we_o
	, input				wire	s6_ack_i
	, input				wire	s6_err_i
	, input				wire	s6_rty_i

	// Slave 7 Interface
	, output	[15:0]	wire	s7_adr_o
	, input		[15:0]	wire	s7_dat_i
	, output	[15:0]	wire	s7_dat_o
	, output			wire	s7_cyc_o
	, output			wire	s7_stb_o
	, output	[ 1:0]	wire	s7_sel_o
	, output			wire	s7_we_o
	, input				wire	s7_ack_i
	, input				wire	s7_err_i
	, input				wire	s7_rty_i
);
	parameter	s0_addr = 16'h0000,				// Slave 0 start address
				s0_size = 16'h9000,
				s1_addr = 16'h9000,				// Slave 1 start address
				s1_size = 16'h1000,
				s2_addr = 16'hA000,				// Slave 2 start address
				s2_size = 16'h1000,
				s3_addr = 16'hB000,				// Slave 3 start address
				s3_size = 16'h1000,
				s4_addr = 16'hC000,				// Slave 4 start address
				s4_size = 16'h1000,
				s5_addr = 16'hD000,				// Slave 5 start address
				s5_size = 16'h1000,
				s6_addr = 16'hE000,				// Slave 6 start address
				s6_size = 16'h1000,
				s7_addr = 16'hF000,				// Slave 7 start address
				s7_size = 16'h1000;

	// ----------------------------
	// internal wires
	// ----------------------------
	wire [3:0]	request = {m0_cyc_i, m1_cyc_i, m2_cyc_i, m3_cyc_i}; 
	wire [3:0]	grant	;

	reg  [15:0]	i_adr_o	;
	reg  [15:0]	i_dat_i	;
	reg  [15:0]	i_dat_o	;
	reg 		i_cyc_o ;
	reg  		i_ack_i	;
	reg 		i_err_i	;
	reg 		i_rty_i	;
	reg  [ 1:0]	i_sel_o	;
	reg 		i_stb_o ;
	reg 		i_we_o  ;

	// ----------------------------
	// Master side mux
	// ----------------------------
	wb_arb Uwb_arb (
		, .clk   	(clk_i	)
		, .rst   	(rst_i	)
		, .request	(request)
		, .grant 	(grant	)
	);
	
	assign m0_dat_o = grant[0] == 1'b1 ? i_dat_i : 'h0;
	assign m1_dat_o = grant[1] == 1'b1 ? i_dat_i : 'h0;
	assign m2_dat_o = grant[2] == 1'b1 ? i_dat_i : 'h0;
	assign m3_dat_o = grant[3] == 1'b1 ? i_dat_i : 'h0;

	assign m0_ack_o = i_ack_i & grant[0];
	assign m1_ack_o = i_ack_i & grant[1];
	assign m2_ack_o = i_ack_i & grant[2];
	assign m3_ack_o = i_ack_i & grant[3];

	assign m0_err_o = i_err_i & grant[0];
	assign m1_err_o = i_err_i & grant[1];
	assign m2_err_o = i_err_i & grant[2];
	assign m3_err_o = i_err_i & grant[3];
	
	assign m0_rty_o = i_rty_i & grant[0];
	assign m1_rty_o = i_rty_i & grant[1];
	assign m2_rty_o = i_rty_i & grant[2];
	assign m3_rty_o = i_rty_i & grant[3];
	
	always @(*) begin
		case(grant)
		4'b0001: begin
			i_adr_o = m0_adr_i;
			i_sel_o = m0_sel_i;
			i_dat_o = m0_dat_i;
			i_we_o  = m0_we_i ;
			i_cyc_o = m0_cyc_i;
			i_stb_o = m0_stb_i;
			i_sel_o = m0_sel_i;
		end

		4'b0010: begin
			i_adr_o = m1_adr_i;
			i_sel_o = m1_sel_i;
			i_dat_o = m1_dat_i;
			i_we_o  = m1_we_i ;
			i_cyc_o = m1_cyc_i;
			i_stb_o = m1_stb_i;
			i_sel_o = m1_sel_i;
		end

		4'b0100: begin
			i_adr_o = m2_adr_i;
			i_sel_o = m2_sel_i;
			i_dat_o = m2_dat_i;
			i_we_o  = m2_we_i ;
			i_cyc_o = m2_cyc_i;
			i_stb_o = m2_stb_i;
			i_sel_o = m2_sel_i;
		end

		4'b1000: begin
			i_adr_o = m3_adr_i;
			i_sel_o = m3_sel_i;
			i_dat_o = m3_dat_i;
			i_we_o  = m3_we_i ;
			i_cyc_o = m3_cyc_i;
			i_stb_o = m3_stb_i;
			i_sel_o = m3_sel_i;
		end

		default: begin
			i_adr_o = 'h0;
			i_sel_o = 'h0;
			i_dat_o = 'h0;
			i_we_o  = 'h0;
			i_cyc_o = 'h0;
			i_stb_o = 'h0;
			i_sel_o = 'h0;
		end
		endcase 
	end	

	
	// ----------------------------
	// Slave side mux
	// ----------------------------
	wire [7:0]	slave_select;

	assign s0_adr_o = slave_select[0] == 1'b1 ? i_adr_o : 'h0;
	assign s1_adr_o = slave_select[1] == 1'b1 ? i_adr_o : 'h0;
	assign s2_adr_o = slave_select[2] == 1'b1 ? i_adr_o : 'h0;
	assign s3_adr_o = slave_select[3] == 1'b1 ? i_adr_o : 'h0;
	assign s4_adr_o = slave_select[4] == 1'b1 ? i_adr_o : 'h0;
	assign s5_adr_o = slave_select[5] == 1'b1 ? i_adr_o : 'h0;
	assign s6_adr_o = slave_select[6] == 1'b1 ? i_adr_o : 'h0;
	assign s7_adr_o = slave_select[7] == 1'b1 ? i_adr_o : 'h0;

	assign s0_dat_o = slave_select[0] == 1'b1 : i_dat_o : 'h0;
	assign s1_dat_o = slave_select[1] == 1'b1 : i_dat_o : 'h0;
	assign s2_dat_o = slave_select[2] == 1'b1 : i_dat_o : 'h0;
	assign s3_dat_o = slave_select[3] == 1'b1 : i_dat_o : 'h0;
	assign s4_dat_o = slave_select[4] == 1'b1 : i_dat_o : 'h0;
	assign s5_dat_o = slave_select[5] == 1'b1 : i_dat_o : 'h0;
	assign s6_dat_o = slave_select[6] == 1'b1 : i_dat_o : 'h0;
	assign s7_dat_o = slave_select[7] == 1'b1 : i_dat_o : 'h0;

	assign s0_cyc_o = slave_select[0] == 1'b1 : i_cyc_o : 'h0;
	assign s1_cyc_o = slave_select[1] == 1'b1 : i_cyc_o : 'h0;
	assign s2_cyc_o = slave_select[2] == 1'b1 : i_cyc_o : 'h0;
	assign s3_cyc_o = slave_select[3] == 1'b1 : i_cyc_o : 'h0;
	assign s4_cyc_o = slave_select[4] == 1'b1 : i_cyc_o : 'h0;
	assign s5_cyc_o = slave_select[5] == 1'b1 : i_cyc_o : 'h0;
	assign s6_cyc_o = slave_select[6] == 1'b1 : i_cyc_o : 'h0;
	assign s7_cyc_o = slave_select[7] == 1'b1 : i_cyc_o : 'h0;

	assign s0_sel_o = slave_select[0] == 1'b1 : i_sel_o : 'h0;
	assign s1_sel_o = slave_select[1] == 1'b1 : i_sel_o : 'h0;
	assign s2_sel_o = slave_select[2] == 1'b1 : i_sel_o : 'h0;
	assign s3_sel_o = slave_select[3] == 1'b1 : i_sel_o : 'h0;
	assign s4_sel_o = slave_select[4] == 1'b1 : i_sel_o : 'h0;
	assign s5_sel_o = slave_select[5] == 1'b1 : i_sel_o : 'h0;
	assign s6_sel_o = slave_select[6] == 1'b1 : i_sel_o : 'h0;
	assign s7_sel_o = slave_select[7] == 1'b1 : i_sel_o : 'h0;

	assign s0_stb_o = slave_select[0] == 1'b1 : i_stb_o : 'h0;
	assign s1_stb_o = slave_select[1] == 1'b1 : i_stb_o : 'h0;
	assign s2_stb_o = slave_select[2] == 1'b1 : i_stb_o : 'h0;
	assign s3_stb_o = slave_select[3] == 1'b1 : i_stb_o : 'h0;
	assign s4_stb_o = slave_select[4] == 1'b1 : i_stb_o : 'h0;
	assign s5_stb_o = slave_select[5] == 1'b1 : i_stb_o : 'h0;
	assign s6_stb_o = slave_select[6] == 1'b1 : i_stb_o : 'h0;
	assign s7_stb_o = slave_select[7] == 1'b1 : i_stb_o : 'h0;

	assign s0_we_o  = slave_select[0] == 1'b1 : i_we_o  : 'h0;
	assign s1_we_o  = slave_select[1] == 1'b1 : i_we_o  : 'h0;
	assign s2_we_o  = slave_select[2] == 1'b1 : i_we_o  : 'h0;
	assign s3_we_o  = slave_select[3] == 1'b1 : i_we_o  : 'h0;
	assign s4_we_o  = slave_select[4] == 1'b1 : i_we_o  : 'h0;
	assign s5_we_o  = slave_select[5] == 1'b1 : i_we_o  : 'h0;
	assign s6_we_o  = slave_select[6] == 1'b1 : i_we_o  : 'h0;
	assign s7_we_o  = slave_select[7] == 1'b1 : i_we_o  : 'h0;

	always @(*) begin
		case(slave_select)
		8'b0000_0001: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b0000_0010: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b0000_0100: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b0000_1000: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b0001_0000: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b0010_0000: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b0100_0000: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		8'b1000_0000: begin
			i_dat_i = s0_dat_i;
			i_ack_i = s0_ack_i;
			i_err_i = s0_err_i;
			i_rty_i = s0_rty_i;
		end

		default: begin
			i_dat_i = 'h0;
			i_ack_i = 'h0;
			i_err_i = 'h0;
			i_rty_i = 'h0;
		end
	end	

	// ----------------------------
	// Address range decode
	// ----------------------------
	always @(*) begin
		if(i_adr_o >= s0_addr && i_adr_o < (s0_addr+s0_size)) slave_select[0] = 1'b1;
		else	                                              slave_select[0] = 1'b0;
                                                      
		if(i_adr_o >= s1_addr && i_adr_o < (s1_addr+s1_size)) slave_select[1] = 1'b1;
		else	                                              slave_select[1] = 1'b0;
                                                      
		if(i_adr_o >= s2_addr && i_adr_o < (s2_addr+s2_size)) slave_select[2] = 1'b1;
		else	                                              slave_select[2] = 1'b0;
                                                      
		if(i_adr_o >= s3_addr && i_adr_o < (s3_addr+s3_size)) slave_select[3] = 1'b1;
		else	                                              slave_select[3] = 1'b0;
                                                      
		if(i_adr_o >= s4_addr && i_adr_o < (s4_addr+s4_size)) slave_select[4] = 1'b1;
		else	                                              slave_select[4] = 1'b0;
                                                      
		if(i_adr_o >= s5_addr && i_adr_o < (s5_addr+s5_size)) slave_select[5] = 1'b1;
		else	                                              slave_select[5] = 1'b0;
                                                      
		if(i_adr_o >= s6_addr && i_adr_o < (s6_addr+s6_size)) slave_select[6] = 1'b1;
		else	                                              slave_select[6] = 1'b0;
                                                      
		if(i_adr_o >= s7_addr && i_adr_o < (s7_addr+s7_size)) slave_select[7] = 1'b1;
		else	                                              slave_select[7] = 1'b0;
	end

endmodule
