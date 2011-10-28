%% -------------------------------------------------------------------
%%
%% Copyright (c) 2007-2011 Basho Technologies, Inc.  All Rights Reserved.
%%
%% -------------------------------------------------------------------

-module(riak_moss_wm_key_test).

-export([key_test_/0]).

-include("riak_moss.hrl").
-include_lib("webmachine/include/webmachine.hrl").
-include_lib("eunit/include/eunit.hrl").

key_test_() ->
    {setup,
     fun riak_moss_wm_test_utils:setup/0,
     fun riak_moss_wm_test_utils:teardown/1,
     [fun get_object/0]}.

create_object() ->
    ok.

get_object() ->
    %% We use this instead of setting
    %% path info the wm_reqdata because
    %% riak_moss_wm_utils:ensure_doc uses
    %% it.
    Ctx= #key_context{bucket="keytest", key="foo"},
    RD = #wm_reqdata{},

    {Object, _, _} = riak_moss_wm_key:produce_body(RD, Ctx),
    ?assertEqual(<<>>, Object).
