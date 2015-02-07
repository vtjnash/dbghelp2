/* include/config.h.  Generated from config.h.in by configure.  */
/* include/config.h.in.  Generated from configure.ac by autoheader.  */

#ifndef __WINE_CONFIG_H
#define __WINE_CONFIG_H
#ifndef WINE_CROSSTEST

/* Define to a function attribute for Microsoft hotpatch assembly prefix. */
#define DECLSPEC_HOTPATCH __attribute__((__ms_hook_prologue__))

/* Define to 1 if you have the <elf.h> header file. */
/* #define HAVE_ELF_H 1 */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "wine-devel@winehq.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "DBGHELP2"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "dbghelp2 (wine 1.7.22)"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "dbghelp2"

/* Define to the home page for this package. */
#define PACKAGE_URL "http://www.winehq.org"

/* Define to the version of this package. */
#define PACKAGE_VERSION "1.7.22"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

#endif /* WINE_CROSSTEST */
#endif /* __WINE_CONFIG_H */
