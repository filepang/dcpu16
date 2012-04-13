
module blk_mem64k (
	  input 	wire			clka
	, input 	wire	[ 1:0]	wea
	, input 	wire	[14:0] 	addra
	, input 	wire	[15:0] 	dina
	, output 	reg 	[15:0] 	douta
);
	reg [7:0]	mem_u[32767:0];
	reg [7:0]	mem_l[32767:0];
		
	always @(posedge clka) begin
		if(wea[1] == 1'b1) begin
			mem_u[addra] <= dina[15:8];
		end

		if(wea[0] == 1'b1) begin
			mem_l[addra] <= dina[7:0];
		end
	end

	always @(posedge clka) begin
		douta <= {mem_u[addra], mem_l[addra]};
	end
endmodule
