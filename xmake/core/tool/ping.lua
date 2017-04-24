--!The Make-like Build Utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2017, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        ping.lua
--

-- define module
local ping = ping or {}

-- load modules
local io        = require("base/io")
local path      = require("base/path")
local utils     = require("base/utils")
local table     = require("base/table")
local string    = require("base/string")
local sandbox   = require("sandbox/sandbox")
local platform  = require("platform/platform")
local tool      = require("tool/tool")

-- get the current tool
function ping:_tool()

    -- get it
    return self._TOOL
end

-- load the ping for the archive file kind
function ping.load(kind)

    -- get it directly from cache dirst
    if ping._INSTANCE then
        return ping._INSTANCE
    end

    -- new instance
    local instance = table.inherit(ping)

    -- load the ping tool 
    local result, errors = tool.load("ping")
    if not result then 
        return nil, errors
    end        

    -- save tool
    instance._TOOL = result

    -- save this instance
    ping._INSTANCE = instance

    -- ok
    return instance
end

-- send ping to hosts
--
-- .e.g
-- 
-- local results = ping.load():send("www.tboox.org", "www.xmake.io")
--
function ping:send(...)

    -- send ping to hosts
    local hosts = {...}
    local results = {}
    for _, host in ipairs(hosts) do
        local ok, time_or_errors = sandbox.load(self:_tool().send, host)
        if ok then
            results[host] = time_or_errors
        end
    end

    -- ok
    return results
end

-- return module
return ping
