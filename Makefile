
all:
	rebar get-deps compile
	if [ -n "$(NERVES_ROOT)" ]; then $(NERVES_ROOT)/scripts/rel2fw.sh _rel; fi

burn:
	(cd _images && sudo ./fwupdate bbb.fw -d /dev/sdc)

clean:
	rebar clean
	-rm -fr _rel _images
