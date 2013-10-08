-module(site_index).

-export([init/3, handle/2, terminate/3]).

% This state doesn't work the way that I originally thought.
% Real state should be kept somewhere else, since Cowboy doesn't
% keep updates to state that are returned from handle/2.
-record(state, {onoff=false}).

init(_TransportAndProtocol, Req, _Options) -> 
    {ok, Req, #state{}}.

boolean_from_form(Key, Props) ->
    case proplists:get_value(Key, Props, <<"">>) of
	<<"on">> -> on;
	_ -> off
    end.
    
brightness_to_onoff(0) -> off;
brightness_to_onoff(_) -> on.
onoff_to_brightness(on) -> 1;
onoff_to_brightness(off) -> 0.

get_current_state() ->
    {ok, Led0} = led:brightness("beaglebone:green:usr0"),
    {ok, Led1} = led:brightness("beaglebone:green:usr1"),
    {ok, Led2} = led:brightness("beaglebone:green:usr2"),
    {ok, Led3} = led:brightness("beaglebone:green:usr3"),
    [{led0, brightness_to_onoff(Led0)},
     {led1, brightness_to_onoff(Led1)},
     {led2, brightness_to_onoff(Led2)},
     {led3, brightness_to_onoff(Led3)}].

set_state(Props) ->
    io:format("Got Props: ~p~n", [Props]),
    Led0 = boolean_from_form(<<"led0">>, Props),
    Led1 = boolean_from_form(<<"led1">>, Props),
    Led2 = boolean_from_form(<<"led2">>, Props),
    Led3 = boolean_from_form(<<"led3">>, Props),
    ok = led:set_brightness("beaglebone:green:usr0", onoff_to_brightness(Led0)),
    ok = led:set_brightness("beaglebone:green:usr1", onoff_to_brightness(Led1)),
    ok = led:set_brightness("beaglebone:green:usr2", onoff_to_brightness(Led2)),
    ok = led:set_brightness("beaglebone:green:usr3", onoff_to_brightness(Led3)).
    
handle(Req, State) ->
    case cowboy_req:method(Req) of
	{<<"GET">>,_Req} ->
	    {ok, Req2} = serve_page(index_tpl, get_current_state(), Req),
	    {ok, Req2, State};
	{<<"POST">>,_Req} ->
	    {ok, Props, _Req2} = cowboy_req:body_qs(Req),
	    set_state(Props),
	    {ok, Req2} = serve_page(index_tpl, get_current_state(), Req),
	    {ok, Req2, State}
    end.
	    

terminate(_Reason, _Req, _State) ->
    ok.

serve_page(Template, Vars, Req) ->
    {ok, URLs} = application:get_env(demo, url),
    {ok, IoList} = Template:render([{url,URLs} | Vars]),
    cowboy_req:reply(
      200,
      [{<<"content-type">>, <<"text/html">>}],
      IoList,
      Req
     ).
    
