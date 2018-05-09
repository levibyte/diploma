MODULE:=interp
CC_OPTIONS_interp=$(INCLS) $(CC_FLAFS) -fPIC
DEP_OPTIONS_interp:=$(INCLS) $(CC_FLAFS)

include $(RULES_DIR)/static_library.rl
include $(MODULE_CODE_DIR)/test/Module.mk

