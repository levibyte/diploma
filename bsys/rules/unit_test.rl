TEST_NAME:=$(MODULE)Test
TEST_TARGET:=$(UNITTEST_BIN_DIR)/$(TEST_NAME)
TEST_OBJ_ROOT:=$(OBJ_ROOT)/$(MODULE)/test
TEST_CODE_DIR:=$(CODE_BASE_DIR)/$(MODULE)/test
CPPS:=$(wildcard $(TEST_CODE_DIR)/*.cpp)
OBJS1:=$(CPPS:.cpp=.o)
TEST_OBJS:=$(patsubst $(TEST_CODE_DIR)/%,$(OBJ_ROOT)/$(MODULE)/test/%,$(OBJS1))
TEST_DEPS:=$(TEST_OBJS:.o=.d)

TEST_LOCAL_CC_FLAG:=$(CC_FLAFS) 
TEST_LOCAL_INCS:=$(INCLS) $(LOCAL_INCS_$(MODULE)) -I ./ext/catch-2.1.2
TEST_LOCAL_LIB:=aaa $(LOCAL_LIBS_$(MODULE))


$(shell mkdir -p $(OBJ_ROOT)/$(MODULE)/test)
$(shell mkdir -p $(UNITTEST_BIN_DIR))

#$(info $$MODULE is [${MODULE}])
#$(info $$LOCAL_LIBS_$(MODULE) is [${LOCAL_LIBS_$(MODULE)}])
#$(info $$TEST_LOCAL_LIB is [${TEST_LOCAL_LIB}])
	

$(TEST_NAME):  $(TEST_TARGET) 
	
$(TEST_TARGET): $(TEST_OBJS) 
	#$(eval a:=$(subst Test,,$(subst test/unit/tests/,,$@ )))
	#@echo $(LOCAL_LIBS_$($(subst Test,,$(subst test/unit/tests/,,$@ ))))	
	$(CC) $^ $(LOCAL_LIBS_$(subst Test,,$(subst test/unit/tests/,,$@ ))) $(LD_FLAFS_TEST) -o $@ 

-include $(TEST_DEPS)

$(TEST_OBJ_ROOT)/%.o: $(TEST_CODE_DIR)/%.cpp
	#$(info $$MODULE is [${MODULE}])
	#$(info $$LOCAL_LIBS_$(MODULE) is [${LOCAL_LIBS_$(MODULE)}])
	#@echo aaaa $(LOCAL_LIBS_$(MODULE))
	$(CC) -c $< $(TEST_LOCAL_CC_FLAG) $(TEST_LOCAL_INCS) -o $@ 
		
$(TEST_OBJ_ROOT)/%.d: $(TEST_CODE_DIR)/%.cpp 
	#$(CC) $<  $(TEST_LOCAL_CC_FLAG) $(TEST_LOCAL_INCS)  -MM -MT $(@:.d=.o) > $@

