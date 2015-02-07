###Makefile configuration
include config/Makefile.config.in
###Project configuration
include project.config/Makefile.project.config.in

.PHONY: clean clean.* dbghelp

################################
###First Target
################################
###shortcut name
dbghelp=$(OUTLIBPATH)/dbghelp$(DLLEXT)

###shortcut to target
dbghelp: $(dbghelp)
################################

###common between project makefiles
include Makefile.common.in
DLLPREFIX=

DBGHELP_OBJS= \
	$(OBJPATH)/dbghelp/coff$(OBJEXT) \
	$(OBJPATH)/dbghelp/cpu_arm$(OBJEXT) \
	$(OBJPATH)/dbghelp/cpu_ppc$(OBJEXT) \
	$(OBJPATH)/dbghelp/crc32$(OBJEXT) \
	$(OBJPATH)/dbghelp/dwarf$(OBJEXT) \
	$(OBJPATH)/dbghelp/image$(OBJEXT) \
	$(OBJPATH)/dbghelp/minidump$(OBJEXT) \
	$(OBJPATH)/dbghelp/msc$(OBJEXT) \
	$(OBJPATH)/dbghelp/pe_module$(OBJEXT) \
	$(OBJPATH)/dbghelp/stabs$(OBJEXT) \
	$(OBJPATH)/dbghelp/storage$(OBJEXT) \
	$(OBJPATH)/dbghelp/type$(OBJEXT) \
	$(OBJPATH)/dbghelp/cpu_arm64$(OBJEXT) \
	$(OBJPATH)/dbghelp/cpu_i386$(OBJEXT) \
	$(OBJPATH)/dbghelp/cpu_x86_64$(OBJEXT) \
	$(OBJPATH)/dbghelp/dbghelp$(OBJEXT) \
	$(OBJPATH)/dbghelp/elf_module$(OBJEXT) \
	$(OBJPATH)/dbghelp/macho_module$(OBJEXT) \
	$(OBJPATH)/dbghelp/module$(OBJEXT) \
	$(OBJPATH)/dbghelp/path$(OBJEXT) \
	$(OBJPATH)/dbghelp/source$(OBJEXT) \
	$(OBJPATH)/dbghelp/stack$(OBJEXT) \
	$(OBJPATH)/dbghelp/symbol$(OBJEXT) \
	$(COMMON_OBJS)


pDBGHELP_ALLCFLAGS=$(CPPFLAGS) $(CFLAGS) $(DBGHELP_CPPFLAGS) $(DBGHELP_INCLUDEFLAGS) \
	$(x-I)"include" $(CC-c)

pDBGHELP_ALLLDFLAGS=$(DBGHELP_OBJS) $(DBGHELP_REGEXLIB) \
	$(LD--out-implib)"$(OUTLIBPATH)/$(DBGHELP_IMPLIB_NAME)" \
	$(LDFLAGS) $(DBGHELP_LDFLAGS) \
	$(LD-shared)

$(OBJPATH)/dbghelp/%$(OBJEXT): dlls/dbghelp/%.c
	@-$(MKDIR) "$(OBJPATH)/"
	@-$(MKDIR) "$(OBJPATH)/dbghelp/"
	$(CC) $(CC-o)"$@" "$<" $(pDBGHELP_ALLCFLAGS)

$(OUTLIBPATH)/dbghelp$(DLLEXT): $(DBGHELP_OBJS) \
	$(DBGHELP_OBJS) $(DBGHELP_REGEXLIB)
	@-$(MKDIR) "$(OUTLIBPATH)/"
	$(LD) $(LD-o)"$@" $(pDBGHELP_ALLLDFLAGS)

clean: clean.all
clean.all: clean.dbghelp

clean.dbghelp:
	-$(RM) "$(OBJPATH)/dbghelp"
