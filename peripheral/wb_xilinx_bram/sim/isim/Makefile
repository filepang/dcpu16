FUSE 		= fuse
BENCH_TOP 	= top

SIM_BINARY 	= sim
PRJ 		= sim.prj
WDB			= sim.wdb
TCL			= sim.tcl
CMD			= sim.cmd

all: sim

fuse:
	@if [ -f blk_mem64k.mif	]; then rm -f blk_mem64k.mif; fi
	@if [ ! -f ../../coregen/sp6_64kb/ise13/blk_mem64k.mif ]; then \
		(cd ../../coregen/sp6_64kb/ise13; make); fi
	@if [ -f ../../coregen/sp6_64kb/ise13/blk_mem64k.mif ]; then \
		cp ../../coregen/sp6_64kb/ise13/blk_mem64k.mif .; fi
	@$(FUSE) -incremental -f $(CMD)  -prj $(PRJ) -o $(SIM_BINARY) work.$(BENCH_TOP)
	
sim: fuse
	@./$(SIM_BINARY) -tclbatch $(TCL) -wdb $(WDB) 

gui: fuse
	@./$(SIM_BINARY) -gui -wdb $(WDB) 

clean:
	@rm -f *.vcd $(SIM_BINARY) $(WDB) fuse.* fuse*.* isim.log *.mif
	@rm -rf isim
		
