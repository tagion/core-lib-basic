DEPS += lib-logger

$(DBIN)/libbasic.a: SOURCE := tagion/**/*.d tagion/*.d
$(DBIN)/testbasic: SOURCE := tagion/**/*.d tagion/*.d