PACKER := packer
VAGRANT := vagrant

ARTIFACTS := artifacts

NAMESPACE := umt-hrs

VIRTUALBOX := virtualbox
VIRTUALBOX-BUILDER := $(VIRTUALBOX)-iso
VIRTUALBOX-OUTPUT-DIR := $(ARTIFACTS)/$(VIRTUALBOX)
VIRTUALBOX-GUEST-ADDITIONS-ISO := $(VBOX_MSI_INSTALL_PATH)VBoxGuestAdditions.iso

CENTOS-BASE-JSON := centos.json

.PHONY: all
all: centos-6 centos-6-i386 centos-7

.PHONY: clean
clean:
	$(RM) artifacts/**/*.box

.PHONY: centos-6 centos-6-i386 centos-7 centos-base
centos-base: $(VIRTUALBOX-GUEST-ADDITIONS-ISO) $(CENTOS-BASE-JSON)
centos-6: $(VIRTUALBOX-OUTPUT-DIR)/CentOS-6.box centos-base
$(VIRTUALBOX-OUTPUT-DIR)/CentOS-6.box: centos6.json
	$(PACKER) build -only $(VIRTUALBOX-BUILDER) -var-file $^ $(CENTOS-BASE-JSON)
centos-6-i386: $(VIRTUALBOX-OUTPUT-DIR)/CentOS-6-i386.box centos-base
$(VIRTUALBOX-OUTPUT-DIR)/CentOS-6-i386.box: centos6-i386.json
	$(PACKER) build -only $(VIRTUALBOX-BUILDER) -var-file $^ $(CENTOS-BASE-JSON)
centos-7: $(VIRTUALBOX-OUTPUT-DIR)/CentOS-7.box centos-base
$(VIRTUALBOX-OUTPUT-DIR)/CentOS-7.box: centos7.json
	$(PACKER) build -only $(VIRTUALBOX-BUILDER) -var-file $^ $(CENTOS-BASE-JSON)

.PHONY: install install-centos-7 install-centos-6-i386 install-centos-6
install: install-centos-7 install-centos-6-i386 install-centos-6
install-centos-7: $(VIRTUALBOX-OUTPUT-DIR)/CentOS-7.box
	$(VAGRANT) box add $(NAMESPACE)/centos-7 $< --force
install-centos-6: $(VIRTUALBOX-OUTPUT-DIR)/CentOS-6.box
	$(VAGRANT) box add $(NAMESPACE)/centos-6 $< --force
install-centos-6-i386: $(VIRTUALBOX-OUTPUT-DIR)/CentOS-6-i386.box
	$(VAGRANT) box add $(NAMESPACE)/centos-6-i386 $< --force
