##########################################################################
# These variables can be either set here, or passed in as make arguments
#
PCBSRC ?= ${HOME}/files/pcb
INSTALLDIR ?= ${HOME}/.pcb
#
##########################################################################


INC = $(shell pkg-config --cflags glib-2.0)
INC += -I${PCBSRC} -I${PCBSRC}/src

all: relocate.so

relocate.so: relocate.c
	gcc ${INC} -O2 -shared relocate.c -o relocate.so 

install: relocate.so
	install -D relocate.so ${INSTALLDIR}/plugins


clean:
	rm -f relocate.so
