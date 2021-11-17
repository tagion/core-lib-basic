DEPS += lib-logger

configure-libbasic.a: SOURCE := tagion/**/*.d tagion/*.d
configure-libbasictest: SOURCE := tagion/**/*.d tagion/*.d

# $(DBIN)/libbasic.a: INFLILES += $(DTMP)/libsecp256k1.a