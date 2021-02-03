SOURCE?=tagion
dfiles.mk: ${WAYS}
	@echo "########################################################################################"
	@echo "## DFILES"
	$(PRECMD)find $(SOURCE) -name "*.d" -a -not -name ".#*" -a -path "*tagion*" | sed -e "s/^/DFILES+=/" > dfiles.mk

CLEANER+=clean-dfiles

clean-dfiles:
	rm -f dfiles.mk
