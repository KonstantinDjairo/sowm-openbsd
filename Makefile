CFLAGS += -std=c99 -Wall -Wextra -pedantic -Wout-of-line-declaration
CFLAGS += -Wmissing-prototypes -Wno-unused-parameter
X11INC ?= /usr/X11R6/include
X11LIB ?= /usr/X11R6/lib
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
CC     ?= gcc

all: sowm

config.h:
	cp config.def.h config.h

sowm: sowm.c sowm.h config.h Makefile
	$(CC) -O3 $(CFLAGS) -o $@ $< -lX11 -I${X11INC} -L${X11LIB} $(LDFLAGS)

install: all
	install -Dm755 sowm $(DESTDIR)$(BINDIR)/sowm

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/sowm

clean:
	rm -f sowm *.o

.PHONY: all install uninstall clean
