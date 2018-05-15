LOCAL_INCS_FIXME:=-I include/ -I include/integ
LOCAL_LIBS_FIXME:=-L $(LIB_DIR) -lLeviInterp
LOCAL_LIBS_FIXME:=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so
#MODULE:=integ
LOCAL_LIBS_$(MODULE):=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so
#LOCAL_LIBS_integ:=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so
#LD_FLAFS:=-L $(LIB_DIR) $(LIB_DIR)/libLeviInterp.so
LD_FLAFS_TEST:=-L $(LIB_DIR) -lLeviInterp

include $(RULES_DIR)/unit_test.rl