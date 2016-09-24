.PHONY: all clean

VERSION=2.03
OVERLAY_NAME=manual
OVERLAY_FILE=overlay-$(OVERLAY_NAME)-$(VERSION).sqfs
SOURCE := overlay

all: $(OVERLAY_FILE)

clean:
	-rm *.sqfs

$(OVERLAY_FILE): $(SOURCE)
	mksquashfs $< $@ -root-owned -comp lz4
