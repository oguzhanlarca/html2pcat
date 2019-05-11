# Determine the platform
UNAME_S := $(shell uname -s)

# CC
ifeq ($(UNAME_S),Darwin)
  CC := clang++ -arch x86_64
else
  CC := g++
endif

# Folders
SRCDIR := src
BUILDDIR := build
TARGETDIR := bin

# Targets
EXECUTABLE := html2pcat
TARGET := $(TARGETDIR)/$(EXECUTABLE)

# Final Paths
INSTALLBINDIR := /usr/local/bin

# Code Lists
SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

# Folder Lists
# Note: Intentionally excludes the root of the include folder so the lists are clean
INCDIRS := $(shell find include/* -name '*.hpp' -exec dirname {} \; | sort | uniq)
INCLIST := $(patsubst include/%,-I include/%,$(INCDIRS))
BUILDLIST := $(patsubst include/%,$(BUILDDIR)/%,$(INCDIRS))

# Shared Compiler Flags
CFLAGS := -c
INC := -I include $(INCLIST) -I /usr/local/include
LIB := -L /usr/local/lib

# Platform Specific Compiler Flags
ifeq ($(UNAME_S),Linux)
    CFLAGS += -std=gnu++11 -O2 # -fPIC

    # PostgreSQL Special
    PG_VER := 9.3
    INC += -I /usr/pgsql-$(PG_VER)/include
    LIB += -L /usr/pgsql-$(PG_VER)/lib
else
  CFLAGS += -std=c++11 -stdlib=libc++ -O2
endif

$(TARGET): $(OBJECTS)
#	@mkdir -p $(TARGETDIR)
	@echo " "
	@echo "Linking..."
	@echo "  Linked $(TARGET)"; $(CC) $^ -o $(TARGET) $(LIB)
	@echo " "

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
#	@mkdir -pv $(BUILDLIST)
	@echo "Compiling $<..."; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo "Cleaning $(TARGET)..."; $(RM) -r $(BUILDDIR) $(TARGET)

install:
	@echo " "
	@echo "Installing $(EXECUTABLE)..."; cp $(TARGET) $(INSTALLBINDIR)
	@echo " "
	@cp misc/welcomeshell.txt ~/.sau/sau_algorithms.config 2>/dev/null

distclean:
	@echo "Removing $(INSTALLBINDIR)/$(EXECUTABLE)..."; rm $(INSTALLBINDIR)/$(EXECUTABLE)
	@echo "Bye.";
.PHONY: clean

# Follow the makefile author as @hiltmon
# Follow the project author as @oguzhanlarca
