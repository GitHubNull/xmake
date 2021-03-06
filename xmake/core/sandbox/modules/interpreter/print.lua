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
-- @file        print.lua
--

-- load modules
local try       = require("sandbox/modules/try")
local catch     = require("sandbox/modules/catch")

-- print format string 
function _print(format, ...)

    -- print format string
    if type(format) == "string" and format:find("%", 1, true) then

        local args = {...}
        try
        {
            function ()
                -- attempt to print format string first
                io.write(string.format(format, unpack(args)) .. "\n")
            end,
            catch 
            {
                function ()
                    -- print multi-variables with raw lua action
                    print(format, unpack(args))
                end
            }
        }

    else
        -- print multi-variables with raw lua action
        print(format, ...)
    end
end

-- load module
return _print

