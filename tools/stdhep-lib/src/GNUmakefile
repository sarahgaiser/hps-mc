#
# main StdHep makefile
#
# to build debug libraries: make DEBUG="-g" all
# to build shared libraries: make BUILD_SHARED="true" all
#
MAKE=make

ifdef DEBUG
  DMAKE = "DEBUG=$(DEBUG)"
endif

STDHEP_DIR = .

# The cern libraries are needed to build the Phase and Space executables.
# There is no point in building the libraries unless the executables will 
# be built.
ifdef CRNLIB
   BUILD_DISPLAY = spin util display
endif
#------------------------------------------

all: info binlib mcfio stdhep $(BUILD_DISPLAY)

info:
	$(info ----------------------- INFO ----------------------)
	$(info STDHEP_DIR = $(STDHEP_DIR))
	$(info RPC_INCLUDE_DIR = $(RPC_INCLUDE_DIR))
	$(info RPC_LIBRARY = $(RPC_LIBRARY))
        $(info DMAKE = $(DMAKE))

binlib:
	-test -d $(STDHEP_DIR)/bin || mkdir -p $(STDHEP_DIR)/bin
	-test -d $(STDHEP_DIR)/lib || mkdir -p $(STDHEP_DIR)/lib

mcfio:
	(cd mcfio/src; $(MAKE) $(DMAKE) RPC_INCLUDE_DIR=$(RPC_INCLUDE_DIR) all) > log.mcfio.$$$$ 2>&1

stdhep:
	(cd src/stdhep; $(MAKE) $(DMAKE) RPC_INCLUDE_DIR=$(RPC_INCLUDE_DIR) RPC_LIBRARY=$(RPC_LIBRARY) all) > log.stdhep.$$$$ 2>&1

spin:
	(cd src/display/spin; $(MAKE) $(DMAKE) all) > log.spin.$$$$ 2>&1

util:
	(cd src/display/util; $(MAKE) $(DMAKE) all) > log.util.$$$$ 2>&1

display:
	(cd src/display; $(MAKE) $(DMAKE) all) > log.display.$$$$ 2>&1

clean:
	rm -f log.*
	cd mcfio/src; $(MAKE) clean
	cd src/stdhep; $(MAKE) $(DMAKE) clean
	cd src/display; $(MAKE) $(DMAKE) clean
	cd src/display/spin; $(MAKE) $(DMAKE) clean
	cd src/display/util; $(MAKE) $(DMAKE) clean

realclean:
	rm -f log.*
	cd mcfio/src; $(MAKE) realclean
	cd src/stdhep; $(MAKE) realclean
	cd src/display; $(MAKE) realclean
	cd src/display/spin; $(MAKE) realclean
	cd src/display/util; $(MAKE) realclean


#------------------------------------------

.PHONY: all realclean stdhep spin util display mcfio
