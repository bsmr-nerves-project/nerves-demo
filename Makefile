
all:
	rebar get-deps compile

burn:
	(cd _images && sudo ./fwupdate bbb.fw -d /dev/sdc)

clean:
	rebar clean
	-rm -fr _rel _images
