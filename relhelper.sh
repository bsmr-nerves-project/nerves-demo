#!/bin/sh

# Check the environment for whether we're cross-compiling or not

if [ -z "$NERVES_ROOT" ]; then
	echo "Generating a host release (Did you forget to load the nerves environment?)"
	relx
else
	echo "Generating a cross-compiled release"
	relx --system_libs $NERVES_SDK_SYSROOT/usr/lib/erlang/lib
	$NERVES_ROOT/scripts/rel2fw.sh _rel
fi

