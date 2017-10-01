AC_INIT([lsdvd], [0.17])
AM_INIT_AUTOMAKE([foreign])
AC_PROG_CC
if eval "test x$GCC = xyes"; then # Enable warnings when using GCC
  CFLAGS="$CFLAGS -W -Wall -Wcast-align -Wcast-qual -Wpointer-arith -Wreturn-type -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wformat -Werror=format-security"
fi
AC_SYS_LARGEFILE
PKG_CHECK_MODULES([DVDREAD], [dvdread >= 4.1.3])
AC_ARG_ENABLE([debug],
[  --enable-debug    Turn on debugging],
[case "${enableval}" in
  yes) debug=true ;;
  no)  debug=false ;;
  *) AC_MSG_ERROR([bad value ${enableval} for --enable-debug]) ;;
esac],[debug=false])
AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
