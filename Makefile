TARGETS := $(CURDIR)/deploy $(CURDIR)/deploy/src/pixta $(CURDIR)/deploy/src/shutterstock

preinstall:
	@$(foreach dir,$(TARGETS),cd $(dir) && npm install;)