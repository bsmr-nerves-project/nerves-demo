-module(demo_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    % Mount /tmp just in case we need it (consider moving this
    % to erlinit since it should always work)
    os:cmd("/bin/mount -t tmpfs tmpfs /tmp"),

    % Bring up the ethernet interface to a hardcoded IP
    % address for now.
    os:cmd("/sbin/ip link set eth0 up"),
    os:cmd("/sbin/ip addr add 192.168.1.80/24 dev eth0"),
    os:cmd("/sbin/ip route add default via 192.168.1.1"),

    % Initialize the leds
    led:open('beaglebone:green:usr0'),
    led:open('beaglebone:green:usr1'),
    led:open('beaglebone:green:usr2'),
    led:open('beaglebone:green:usr3'),
    led:disable_triggers('beaglebone:green:usr0'),
    led:disable_triggers('beaglebone:green:usr1'),
    led:disable_triggers('beaglebone:green:usr2'),
    led:disable_triggers('beaglebone:green:usr3'),

    % Start up cowboy
    Dispatch = cowboy_router:compile([
	      {'_', [
		     {"/", site_index, []}
		    ]}
				     ]),
	{ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
		{env, [{dispatch, Dispatch}]}
	]),

    demo_sup:start_link().

stop(_State) ->
    ok.
