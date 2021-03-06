PREFIX=/usr/local
SBINDIR=$(PREFIX)/sbin

#######################################

CFLAGS+=-I -pthread -Wall -g -D_GNU_SOURCE -O0

LDFLAGS+=-lpthread -lm -lssl -lcrypto -lrt 

SERVERFNAME=wormhole

sources=main.c relayer.c json_conf.c cJSON.c myrand.c ds_llist.c util_time.c

objects=$(sources:.c=.o)

all: $(SERVERFNAME)

$(SERVERFNAME): $(objects)
	    $(CC) -o $@ $^ $(LDFLAGS)

install: all
	    $(INSTALL) $(SERVERFNAME) $(SBINDIR)/

clean:
	    rm -f $(objects) $(SERVERFNAME)

