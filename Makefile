
all:
	./rebar get-deps compile

clean:
	./rebar clean
	-rm -fr _rel
