####$(LIBS_$(subst objroot/,,$(patsubst %/$(notdir $(patsubst objroot/%/*,%,$^)),%,$^)))
####$(INCS_$(subst src/,,$(patsubst %/$(notdir $(patsubst src/%/*,%,$^)),%,$^)))
####$(FLAGS_$(subst src/,,$(patsubst %/$(notdir $(patsubst src/%/*,%,$^)),%,$^)))

MODULE_OBJ_ROOT:=$(OBJ_ROOT)/$(MODULE)
MODULE_CODE_DIR:=$(CODE_BASE_DIR)/$(MODULE)
CPPS:=$(wildcard src/$(MODULE)/*.cpp)
OBJS1:=$(CPPS:.cpp=.o)
MODULE_OBJS:=$(patsubst src/%,$(OBJ_ROOT)/%,$(OBJS1))
MODULE_DEPS:=$(MODULE_OBJS:.o=.d)

TARGET_NAME:=$(TARGET_PREFIX_NAME)$(MODULE)$(TARGET_POSTFIX_NAME)
TARGET:=$(MODULE_OBJ_ROOT)/$(TARGET_NAME)


#default:
#		@echo $(MODULE_OBJ_ROOT)
#		@echo $(MODULE_DEPS)
#		@echo $(MODULE_OBJS) 

#.PHONY: $(MODULE)

#$(MODULE): 
#		mkdir -p $(OBJ_ROOT)/$(MODULE)
		
#FIXME		
$(shell mkdir -p $(OBJ_ROOT)/$(MODULE))

		
$(TARGET): $(MODULE_OBJS) 
	$(AR) rcs  $@  $^  

-include $(MODULE_DEPS)


$(MODULE_OBJ_ROOT)/%.o: $(MODULE_CODE_DIR)/%.cpp
	$(CC) -c $< $(CC_OPTIONS_$(subst src/,,$(patsubst %/$(notdir $(patsubst src/%/*,%,$(wordlist 1,1,$^))),%,$(wordlist 1,1,$^)))) -o $@ 
		
#FIXME		
$(MODULE_OBJ_ROOT)/%.d: $(MODULE_CODE_DIR)/%.cpp 
	$(CC) $< $(DEP_OPTIONS_$(subst src/,,$(patsubst %/$(notdir $(patsubst src/%/*,%,$(wordlist 1,1,$^))),%,$(wordlist 1,1,$^))))  -MM -MT $(@:.d=.o) > $@


