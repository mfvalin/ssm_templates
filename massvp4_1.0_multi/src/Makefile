#
# this Makefile has been set for "export" mode (outside of EC Dorval)
#
ifeq ($(BASE_ARCH),$(EC_ARCH))
   $(error ERROR: please setup a compilation environment,  BASE_ARCH is the same as EC_ARCH )
endif

.SUFFIXES :

.SUFFIXES : .F .o

FFLAGS =

CFLAGS =

MASSVLIB = libmassvp4.a

.PRECIOUS: $(MASSVLIB)

genlib: 
#Creer la programmatheque 
	mkdir -p $(EC_ARCH)
	s.f90 -c -O 2 massvp4.F
	rm -f $(EC_ARCH)/$(MASSVLIB)
	ar rcv $(EC_ARCH)/$(MASSVLIB) massvp4.o
	rm massvp4.o

install:  genlib
#publier la programmatheque 
	mkdir -p ../lib/$(EC_ARCH)
	mv $(EC_ARCH)/$(MASSVLIB) ../lib/$(EC_ARCH)/$(MASSVLIB)
	cd ../lib/$(EC_ARCH)/ ; ln -sf $(MASSVLIB) libmassv_p4.a
	mkdir -p ../include/$(EC_ARCH)
	touch ../include/$(EC_ARCH)/dummy.h

clean:
	rm -rf *.o $(EC_ARCH)
