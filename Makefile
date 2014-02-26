PROJECT = nerves_demo

DEPS = cowboy jsx nerves_utils leds
dep_cowboy = pkg://cowboy master
dep_jsx = pkg://jsx v1.4.3
dep_nerves_utils = git://github.com/nerves-project/nerves-utils erlang.mk
dep_leds = git://github.com/nerves-project/leds erlang.mk

RELX_OPTS += --system_libs $(NERVES_SDK_SYSROOT)/usr/lib/erlang/lib

firmware: rel
	if [ -n "$(NERVES_ROOT)" ]; then $(NERVES_ROOT)/scripts/rel2fw.sh _rel; fi

clean-firmware:
	-rm -fr _images

clean-all: clean-firmware

include erlang.mk


