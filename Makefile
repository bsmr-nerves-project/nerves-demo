
all:
	/home/fhunleth/nerves/test-toolchain/nerves-rebar get-deps compile
	/home/fhunleth/nerves/test-toolchain/nerves-relx
	/home/fhunleth/nerves/test-toolchain/rel2fw.sh _rel

burn:
	(cd _images && sudo ./fwupdate bbb.fw -d /dev/sdc)

clean:
	/home/fhunleth/nerves/test-toolchain/nerves-rebar clean
	-rm -fr _rel _images
