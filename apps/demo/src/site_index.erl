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
	<<"on">> -> true;
	_ -> false
    end.
    
handle(Req, State) ->
    io:format("State=~p~n", [State]),
    case cowboy_req:method(Req) of
	{<<"GET">>,_Req} ->
	    {ok, Req2} = serve_page(index_tpl, [{onoff,State#state.onoff}], Req),
	    {ok, Req2, State};
	{<<"POST">>,_Req} ->
	    {ok, Props, _Req2} = cowboy_req:body_qs(Req),
	    NewOnoff = boolean_from_form(<<"onoff">>, Props),
	    State2 = State#state{onoff=NewOnoff},
	    {ok, Req2} = serve_page(index_tpl, [{onoff,NewOnoff}], Req),
	    io:format("State2=~p~n", [State2]),
	    {ok, Req2, State2}
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
    
