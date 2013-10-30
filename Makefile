
all:
	rebar get-deps compile
	relx --system_libs $(NERVES_SDK_SYSROOT)/usr/lib/erlang/lib
	$(NERVES_ROOT)/scripts/rel2fw.sh _rel

burn:
	(cd _images && sudo ./fwupdate bbb.fw -d /dev/sdc)

clean:
	rebar clean
	-rm -fr _rel _images
