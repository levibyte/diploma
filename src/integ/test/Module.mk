#LOCAL_INCS_FIXME:=-I include/integ
#LOCAL_LIBS_FIXME:=-L $(LIB_DIR) -lLeviInterp
#LOCAL_LIBS_FIXME:=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so
#MODULE:=integ
LOCAL_LIBS_$(MODULE):=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so
#LOCAL_LIBS_integ:=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so

include $(RULES_DIR)/unit_test.rl