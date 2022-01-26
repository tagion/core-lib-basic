UNITTEST:=$(BINDIR)/unittest_$(PACKAGE)

TESTDCFLAGS+=$(LIBS)
TESTDCFLAGS+=-main

#vpath %.d tests/
