#ifndef _DBGHELP2_MINGW_COMPAT_
#define _DBGHELP2_MINGW_COMPAT_

#define WINVER 0x0502
#include <windows.h>
#include <string.h>
#include <stdio.h>

static char _wine_dbg_sprintf[1024];
#define wine_dbg_sprintf(...) (sprintf(_wine_dbg_sprintf, __VA_ARGS__), _wine_dbg_sprintf)
static char _wine_dbgstr_longlong[32];
#define wine_dbgstr_longlong(i) (sprintf(_wine_dbgstr_longlong, "%I64x", i), _wine_dbgstr_longlong)
static char _wine_dbgstr_guid[32];
#define debugstr_guid(i) (sprintf(_wine_dbgstr_guid, "%I64x", i), _wine_dbgstr_guid)
#define wine_dbgstr_a(a) (a)
static char _wine_dbgstr_w[1024];
#define debugstr_w(w) (WideCharToMultiByte(CP_UTF8,0,w,-1,_wine_dbgstr_w,sizeof(_wine_dbgstr_w),NULL,NULL),_wine_dbgstr_w)
#define debugstr_a(a) (a)
#define WINE_DECLARE_DEBUG_CHANNEL(...)
#define TRACE_ON(a) 0
#define TRACE(...)
#define TRACE_(...) TRACE
#define WARN(...) fprintf(stderr, "WARN: " __VA_ARGS__)
#define ERR(...) fprintf(stderr, "ERR: " __VA_ARGS__)
#define FIXME_(...) FIXME
#define FIXME(...) fprintf(stderr, "FIXME: " __VA_ARGS__)
#define strlenW wcslen
#define strcmpW wcscmp
#define strcatW wcscat
#define strchrW wcschr
#define strcpyW wcscpy
#define tolowerW towlower
#define toupperW towupper
#define strncmpiW _wcsnicmp
#define strncmpW wcsncmp
#define strcmpiW _wcsicmp
#define __TRY if (1) 
#define __EXCEPT_PAGE_FAULT if (0) 
#define __ENDTRY
#define IMAGE_FILE_MACHINE_ARM64    0x01c5
#define DECLSPEC_HIDDEN

#endif
