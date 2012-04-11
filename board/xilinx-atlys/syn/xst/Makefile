#-------------------------------------------------------------------
#-------------------------------------------------------------------

XST		= xst
NGCE	= ngc2edif
DEV		= xc6slx45csg324-2
INCD	= "../../rtl/verilog"
TOP		= dcpu16_xilinx_atlys
#--------------------------------------------------------
all: synthesis

synthesis:
	if [ -f $(TOP).ngc ]; then /bin/rm -f $(TOP).ngc; fi
	(export dev_name=$(DEV);\
	 export top_name=$(TOP);\
	 export inc_dir=$(INCD);\
	 export design=xst_list.txt;\
	$(XST) -ifn xst_option.txt -ofn ${TOP}.log;)
	if [ -f ${TOP}.ngc ]; then\
		$(NGCE) -bd angle -w ${TOP}.ngc ${TOP}.edif || exit 1;\
		if [ -f ${TOP}T.ngc ]; then /bin/rm -f ${TOP}T.ngc; fi;\
	fi

clean:
	@rm -f compile.log
	@rm -f ngc2edif.log
	@rm -rf ./xst
	@rm -rf ./_xmsgs
	@rm -f $(TOP).xncf
	@rm -f $(TOP).log
	@rm -f $(TOP).edif
	@rm -f $(TOP).ngc
	@rm -f $(TOP).lso
	@rm -f $(TOP).blc
	@rm -rf xlnx_auto_0_xdb
	@rm -f *_xst.xrpt
