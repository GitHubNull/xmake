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
-- @file        inherit.lua
--

-- load modules
local import = require("sandbox/modules/import")

-- inherit module
--
-- we can access all super interfaces by _super
--
-- @note the polymiorphism is not supported for import.inherit mode now.
function sandbox_inherit(name, args)

    -- init args
    args = args or {}

    -- mark as inherit
    args.inherit = true

    -- import and inherit it
    return import(name, args)
end

-- load module
return sandbox_inherit

