bin_PROGRAMS = lsdvd
lsdvd_SOURCES = lsdvd.c ocode.c ohuman.c oxml.c lsdvd.h oxml.h ocode.h lsdvd.1
if DEBUG
lsdvd_CFLAGS = $(DVDREAD_CFLAGS) -g
else
lsdvd_CFLAGS = $(DVDREAD_CFLAGS)
endif
lsdvd_LDADD = $(DVDREAD_LIBS)
man_MANS = lsdvd.1
