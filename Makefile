
CC=             $(CROSS_COMPILE)gcc
LD=             $(CROSS_COMPILE)ld
KERNELDIR=      ~/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/overo-angstrom-linux-gnueabi/linux-omap-3.5.0-r122g/git
CROSS_COMPILE=  arm-angstrom-linux-gnueabi-
LD += -S
export          CC LD EXTRA_CFLAGS KERNELDIR CROSS_COMPILE

EXTRA_CFLAGS += -I$(KERNELDIR)/include
EXTRA_CFLAGS += -DFPNUM='"52"' -DDEBUG_LEVEL1

UAPOBJS = uap_main.o uap_proc.o uap_debug.o uap_sdio_mmc.o
obj-m := uap8xxx.o
uap8xxx-objs := $(UAPOBJS)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	-find . -name "*.o" -exec rm {} \;
	-find . -name "*.ko" -exec rm {} \;
	-find . -name ".*.cmd" -exec rm {} \;
	-find . -name "*.mod.c" -exec rm {} \;
	-find . -name "*.symvers" -exec rm {} \;


